{ hlib # haskell.lib
, fetchFromGitHub
}:

hself: hsuper: {
  wide-word = hsuper.c2n {
    name = "wide-word";
    rawPath = fetchFromGitHub {
      owner = "erikd";
      repo = "wide-word";
      rev = "953af7e4bcd779adbd07c4a19064f2f49fbfde23";
      sha256 = "0004zmli1fc4p94f73184l5xgg2ffjzdayd2fm67rs8cjaslvjyx";
    };
    apply = [ ];
  };

  ip = hsuper.c2n {
    name = "ip";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "haskell-ip";
      rev = "2fe1a38d1bf2155cf068ac3b7e08fa7319d4231c";
      sha256 = "13z01jryfkfj9z7d45nsb55v6798gv9dqqrqw5wxymzywmhqyc4m";
    };
    apply = [ ];
  };

  posix-api = hsuper.c2n {
    name = "posix-api";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "posix-api";
      rev = "6344f841b969cb70195e49093be1504b4a84f7c5";
      sha256 = "09d025jfiaznwzsr9fny4ncb51nh5vbhj5nwb1y2y6w8ivgs717r";
    };
  };

  ping = hsuper.c2n {
    name = "ping";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "ping";
      rev = "82229a41507732049ff90e1cc3abff69be26540f";
      sha256 = "1n0apsinwj52c1m17hjd91sxp2r6m7sn185ykkzfszb7xrm0xskg";
    };
    apply = [ ];
  };

  error-codes = hsuper.c2n {
    name = "error-codes";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "error-codes";
      rev = "5eb520f475285eeed17fe33f4bac5929104657a0";
      sha256 = "0shcvsyykbpwjsd9nwnyxkp298wmfpa7v2h8vw1clhka2xsw2c86";
    };
  };

  sockets = hlib.overrideCabal (hsuper.c2n {
    name = "sockets";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "sockets";
      rev = "58b5bfc54c3ee77984871bec91ad5f08c46fa6eb";
      sha256 = "1sdpaxz65y565rzrsnprj9nr4lbmzylqpkraps4n9f26cb2f0i1s";
    };
    apply = [ ];
  }) (old: {
    configureFlags = [
      # GHC cannot perform multithreaded backpackified typechecking
      # Nix's generic haskell builder invokes ghc with `j$NIX_BUILD_CORES`
      # by default. Anything other than 1 behind that value results in
      # GHC giving up when attempting to compile `sockets`.
      "--ghc-option=-j1"
      # `sockets` API is still highly experimental, so it's best to
      # keep verbose errors enabled.
      "-f+verbose-errors"
    ];
  });
}
