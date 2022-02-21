GEN_FILE="http://dechain.oss-cn-hangzhou.aliyuncs.com/config/tj/genesis.json"
echo "Please mount the disk to /wwwroot ,and you must ensure that the disk has more than 100g of space"
# Please mount the disk to /wwwroot ,and you must ensure that the disk has more than 100g of space
STORE_DIR="/wwwroot/evm/store"
KEY="mykey"
CHAINID="evmos_9000-1"
MONIKER="denet"
KEYRING="file"
KEYALGO="eth_secp256k1"
LOGLEVEL="info"
# to trace evm
#TRACE="--trace"
TRACE=""

if [ ! -d "${STORE_DIR}" ]; then
  mkdir -p ${STORE_DIR}
fi

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# remove existing daemon
rm -rf ~/.evmosd*

make install

evmosd config keyring-backend $KEYRING
evmosd config chain-id $CHAINID

# if $KEY exists it should be deleted
evmosd keys add $KEY --keyring-backend $KEYRING --algo $KEYALGO

# Set moniker and chain-id for Evmos (Moniker can be anything, chain-id must be an integer)
evmosd init $MONIKER --chain-id $CHAINID 


#download gen file
curl http://dechain.oss-cn-hangzhou.aliyuncs.com/config/tj/genesis.json > $STORE_DIR/.evmosd/config/genesis.json

evmosd validate-genesis

#download seed file
SEEDS=`curl -sL http://dechain.oss-cn-hangzhou.aliyuncs.com/config/tj/seeds.txt | awk '{print $1}' | paste -s -d, -`
sed -i.bak -e "s/^seeds =.*/seeds = \"$SEEDS\"/" $STORE_DIR/.evmosd/config/config.toml

nohup evmosd start --pruning=nothing  --log_level info --minimum-gas-prices=0.0001aphoton --json-rpc.api eth,txpool,personal,net,debug,web3 &