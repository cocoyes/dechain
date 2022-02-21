<!--
parent:
  order: false
-->

<div align="center">
  <h1> DeChain </h1>
</div>



DeChain is a scalable, high-throughput Proof-of-Stake blockchain that is fully compatible and
interoperable with Ethereum. It's built using the [Cosmos SDK](https://github.com/cosmos/cosmos-sdk/) which runs on top of [Tendermint Core](https://github.com/tendermint/tendermint) consensus engine.

**Note**: Requires [Go 1.17.5+](https://golang.org/dl/)

## Installation

### Local environment
* Install go compilation environment
* Mount the disk to /wwwroot
    * you must ensure that the disk has more than 100g of space
* Download source code
```
  git clone https://github.com/cocoyes/dechain.git
```
* Make syn.sh becomes executable 
```
chmod +x syn.sh
```
* Run
```
./syn.sh
```
