## Welcome to Indexed.xyz

This repository is part of partnership between Indexed.xyz and Rill Data.  

To get started, run the script below with the smart contract you are interested in:

`curl -s https://cdn.rilldata.com/indexed-xyz.sh | bash -s <your contract>` 

Example with Art Blocks (contract: 0xa7d8d9ef8d8ce8992df33d8b8cf4aebabd5bd270):
`curl -s https://cdn.rilldata.com/indexed-xyz.sh | bash -s 0xa7d8d9ef8d8ce8992df33d8b8cf4aebabd5bd270` 


Indexed.xyz is a public, decoded blockchain dataset for anyone to download and copy openly. Indexed.xyz is a community effort by Goldsky, Cloudflare, Rill, Coinbase, Gnosis, Polygon, and Arweave to make understanding and building in the blockchain space easier.

This script does several things on your behalf:
- install rill
- clone https://github.com/indexed-xyz/rill repo
- regex replace smart contract variables
- rehydrates your Rill project locally creating everything you need - - for your editable dashboard>
- open Goldsky project at http://localhost:9009


TODO
- gif at the top
- link to blog
