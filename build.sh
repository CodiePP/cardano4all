#!/usr/bin/env bash

BASEPATH=$(realpath $(dirname $0))

# first, do some patching
patch -d ext/cardano-base.git -i ${BASEPATH}/patch-cardano-base.diff -p 1

# launch `stack`
stack build --copy-bins

# done.
