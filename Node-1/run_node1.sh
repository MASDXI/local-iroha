#!/usr/local/bin/zsh
#
iroha-cli --genesis_block --peers_address peers.list
irohad --genesis_block genesis.block --config config.json --keypair_name node1
