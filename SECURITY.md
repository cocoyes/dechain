# Security

As part of our vulnerability disclosure policy, we operate a bug
bounty.

See the policy for more details on submissions and rewards, and see "Example Vulnerabilities" (below) for examples of the kinds of bugs the team is most interested in.


## Guidelines

We require that all researchers:

* Use the bug bounty to disclose all vulnerabilities, and avoid posting vulnerability information in public places, including Github Issues, Discord channels, and Telegram groups
* Make every effort to avoid privacy violations, degradation of user experience, disruption to production systems (including but not limited to the Dechain mainnet and/or testnets), and destruction of data
* Keep any information about vulnerabilities that you’ve discovered confidential between yourself and the engineering team until the issue has been resolved and disclosed
* Avoid posting personally identifiable information, privately or publicly

If you follow these guidelines when reporting an issue to us, we commit to:

* Not pursue or support any legal action related to your research on this vulnerability
* Work with you to understand, resolve and ultimately disclose the issue in a timely fashion


## Supported Releases

The team commits to releasing security patch releases for both the latest minor release as well for the major/minor release that Dechain is running.

###### If you are running older versions of Dechain, we encourage you to upgrade at your earliest opportunity so that you can receive security patches directly from the repo. While you are welcome to backport security patches to older versions for your own use, we will not publish or promote these backports.

## Scope

Please note that, in the interest of the safety of our users and staff, a few things are explicitly excluded from scope:

* Any third-party services
* Findings from physical testing, such as office access
* Findings derived from social engineering (e.g., phishing)

## Example Vulnerabilities

The following is a list of examples of the kinds of vulnerabilities that we’re most interested in. It is not exhaustive: there are other kinds of issues we may also be interested in!

### Specification

* Conceptual flaws
* Ambiguities, inconsistencies, or incorrect statements
* Mis-match between specification and implementation of any component

### Consensus

Assuming less than 1/3 of the voting power is Byzantine (malicious):

* Validation of blockchain data structures, including blocks, block parts, votes, and so on
* Execution of blocks
* Validator set changes
* Proposer round robin
* Two nodes committing conflicting blocks for the same height (safety failure)
* A correct node signing conflicting votes
* A node halting (liveness failure)
* Syncing new and old nodes

Assuming more than 1/3 the voting power is Byzantine:

* Attacks that go unpunished (unhandled evidence)

### Networking

* Authenticated encryption (MITM, information leakage)
* Eclipse attacks
* Sybil attacks
* Long-range attacks
* Denial-of-Service

### RPC

* Write-access to anything besides sending transactions
* Denial-of-Service
* Leakage of secrets

### Denial-of-Service

Attacks may come through the P2P network or the RPC layer:

* Amplification attacks
* Resource abuse
* Deadlocks and race conditions

### Libraries

* Serialization
* Reading/Writing files and databases

### Cryptography

* Elliptic curves for validator signatures
* Hash algorithms and Merkle trees for block validation
* Authenticated encryption for P2P connections

### Light Client

* Core verification
* Bisection/sequential algorithms