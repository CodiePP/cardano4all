#{ghc}:
with (import <nixpkgs> {});

haskell.lib.buildStackProject {
  #inherit ghc;
  name = "cardano4all";
  buildInputs = [
      automake
      autoconf
      pkg-config
      gcc
      libtool
      haskell.compiler.ghc8104
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
    '';
}

