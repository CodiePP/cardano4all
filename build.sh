#!/usr/bin/env bash

BASEPATH=$(realpath $(dirname $0))

# first, build dependency
pushd ext/input-output-hk_libsodium.git
mkdir -p OUT
./autogen.sh 
./configure --prefix=$(pwd)/OUT
make -j 8
make check
make install
popd


# can find locally built libsodium
export PKG_CONFIG_PATH=$(pwd)/ext/input-output-hk_libsodium.git/OUT/lib/pkgconfig:$PKG_CONFIG_PATH


# launch `stack`
stack build --copy-bins

# done.
