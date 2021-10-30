#!/bin/sh

VERSION="1.30.1"
HOST=127.0.0.1
PORT=41301
STATEDIR="state-node-testnet/state-${VERSION}"
mkdir -vp ${STATEDIR}

CONFIG=configuration/testnet-config.json
TOPOLOGY=configuration/testnet-topology.json

HSRTS="+RTS -N2 -A16m -qg -qb --disable-delayed-os-memory-return -RTS"

#NODE="stack --nix exec cardano-node --"
NODE="./bin/cardano-node"

${NODE} run --topology $TOPOLOGY --database-path "${STATEDIR}/db-mainnet" --socket-path "${STATEDIR}/node.socket" --config $CONFIG --host-addr ${HOST} --port ${PORT} ${HSRTS}

