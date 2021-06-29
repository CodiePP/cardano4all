# cardano4all
Building the Cardano node and tools from [input-output-hk/cardano-node](https://github.com/input-output-hk/cardano-node) including all its dependencies.

## Quick setup and build on Linux

> this will only work if you have the required system dependencies installed. (see below)


### 1 checkout the dependencies

this is only necessary for a fresh checkout of this repo:

_`$`_ `git submodule update --init --remote`

otherwise, update the submodules to the revision defined in the commit:

_`$`_ `git submodule update`


### 2 build dependencies

```sh
cd ext/input-output-hk_libsodium.git
mkdir -p OUT
./autogen.sh 
./configure --prefix=$(pwd)/OUT
make -j 8
make check
make install

```

set the variable PKG_CONFIG_PATH to point to the locally build _libsodium_ so that it will be found by `stack` when linking the Haskell node.

```sh
export PKG_CONFIG_PATH=$(pwd)/ext/input-output-hk_libsodium.git/OUT/lib/pkgconfig:$PKG_CONFIG_PATH
```

### 3 build

3 I) `stack`:   _`$`_ `stack build cardano-node:exe:cardano-node --copy-bins`
3 II) `patchelf --replace-needed libsodium.so.23 $(pwd)/ext/input-output-hk_libsodium.git/OUT/lib/libsodium.so.23 bin/cardano-node`
        (this changes the "rpath" in the binary to the local libsodium)
  
### 4 run test suite

4) `stack`:   _`$`_ `stack test`

## System setup *Linux*

on a Linux/Debian system:
> `sudo apt install libsystemd-dev pkg-config`
  
## System setup *Mac OSX*
many dependencies can be installed using [brew](https://brew.sh), e.g. `brew install pkg-config`

The files "stack.yaml" needs to be adapted:
* remove all references to `systemd`
* disable compiling using nix: `enable: false`

## System setup *Windows*
> <tbd>

