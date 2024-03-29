{ lib # pkgs.lib
, hlib # haskell.lib
, fetchFromGitHub
, ...
}:

hself: hsuper: {
  country = hlib.doJailbreak hsuper.country;

  semirings = hsuper.c2n {
    name = "semirings";
    rawPath = fetchFromGitHub {
      owner = "chessai";
      repo = "semirings";
      rev = "cf00ccfa25ebf62ff309958bc27185e1d45cc10a";
      sha256 = "0wiy98a6gbj19gb4p6hgb562vzj0r7yrvcdfqwwjy437jw955wsz";
    };
    apply = [ ];
  };

  chronos = hsuper.c2n {
    name = "chronos";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo = "chronos";
      rev = "af0a36bfd8633b859aa0ae7ebc65eebf01125606";
      sha256 = "0zk1wni83dvfl2ikgak59cy0m1mfslh88iibc990qx3jrx3m0mzg";
    };
    apply = [ ];
  };

  quickcheck-classes = hsuper.c2n {
    name = "quickcheck-classes";
    rawPath = fetchFromGitHub {
      owner = "andrewthad";
      repo   = "quickcheck-classes";
      rev = "139a00d83e37c11e4a2d38eee63d6004782758ad";
      sha256 = "1v3xa0n30rrpk8yqa71mip1ns1zb59nvgca52xr65fwlh39403dd";
    };
    apply = [ hlib.doJailbreak hlib.dontCheck ];
  };

  hedgehog = hsuper.hedgehog_1_0;

  #optparse-applicative = hsuper.c2n {
  #  name = "optparse-applicative";
  #  rawPath = fetchFromGitHub {
  #    owner = "pcapriotti";
  #    repo = "optparse-applicative";
  #    rev = "5478fc16cbd3384c19e17348a17991896c724a3c";
  #    sha256 = "1iaxlmgns285x3wzgqps9ap2fg4dk1k36vcnwvi3x8s64svk2mh0";
  #  };
  #  apply = [ hlib.dontCheck ];
  #};
}
