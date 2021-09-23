with (import <nixpkgs> {});

haskell.lib.buildStackProject {
  name = "cardano4all";
  buildInputs = [
      automake
      autoconf
      pkg-config
      gcc
      libtool
      cabal-install
      #haskell.compiler.ghc8104
      ghc
      ccls
      vscode

      ormolu
      haskell-language-server

      zlib
      systemd
      rdkafka
    ];
    shellHook = ''
      echo 'Haskel Stack nixified environment'
      ghc --version
      export PKG_CONFIG_PATH="$(pwd)/ext/input-output-hk_libsodium.git/OUT/lib/pkgconfig:$PKG_CONFIG_PATH"
      export LD_LIBRARY_PATH="$(pwd)/ext/input-output-hk_libsodium.git/OUT/lib:$LD_LIBRARY_PATH"
    '';
}

