#!/bin/sh

VERSION="1.30.1"
HOST=127.0.0.1
PORT=31301
STATEDIR="state-node-mainnet/state-${VERSION}"
mkdir -vp ${STATEDIR}

CONFIG=mainnet-config.json
TOPOLOGY=ext/cardano-node.git/configuration/cardano/mainnet-topology.json

HSRTS="+RTS -N2 -A16m -qg -qb --disable-delayed-os-memory-return -RTS"

#NODE="stack --nix exec cardano-node --"
NODE="./bin/cardano-node"

${NODE} run --topology $TOPOLOGY --database-path "${STATEDIR}/db-mainnet" --socket-path "${STATEDIR}/node.socket" --config $CONFIG --host-addr ${HOST} --port ${PORT} ${HSRTS}

