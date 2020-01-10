# cardano4all
Building the Cardano node and tools from [input-output-hk/cardano-node](https://github.com/input-output-hk/cardano-node) including all its dependencies.

## Quick setup and build on Linux

> this will only work if you have the required system dependencies installed. (see below)

### 1 checkout the dependencies

_`$`_ `git submodule update --init --remote`

### 2 build

2 a) `cabal`:   _`$`_ `cabal build all`
  
2 b) `stack`:   _`$`_ `stack build`
  
### 3 run test suite

3 a) `cabal`:   _`$`_ `cabal test all`
  
3 b) `stack`:   _`$`_ `stack test`

## System setup *Linux*
> <tbd>
  
## System setup *Mac OSX*
> <tbd>
  
## System setup *Windows*
> <tbd>
  
