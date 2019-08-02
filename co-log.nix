{ hlib # haskell.lib
, fetchFromGitHub
}:

let
  cologPkg = name: hsuper: hsuper.c2n {
    inherit name;
    rawPath = fetchFromGitHub {
      owner = "kowainik";
      repo = "co-log";
      rev = "8dff51c38d2e2c8c2de5faae66938fada1b57d99";
      sha256 = "125vqgkrday3adjfdph5va3ijaiii4fxvkrhbzhdhir1ifw51fxg";
    };
    relativePath = name;
    apply = [ ];
  };

in hself: hsuper: {
  co-log-core = cologPkg "co-log-core" hsuper;
  co-log = cologPkg "co-log" hsuper;

  ansi-terminal = hsuper.c2n {
    name = "ansi-terminal";
    rawPath = fetchFromGitHub {
      owner = "feuerbach";
      repo = "ansi-terminal";
      rev = "1236abd3621060a82e60c22c74947670d33bdde6";
      sha256 = "1z94yznrm83074and6bidbvdg4358y3695s9h8a1bsl2yhqg8vvx";
    };
    apply = [ ];
  };

  typerep-map = hsuper.c2n {
    name = "typerep-map";
    rawPath = fetchFromGitHub {
      owner = "kowainik";
      repo = "typerep-map";
      rev = "6b6e08a8d4ac40e3128e29e1d0dc28c02b63df61";
      sha256 = "1qd8qf6qrhv9xyzrkwzcghx14b72fvnri0sl0whrjfi5r8s8m28g";
    };
    apply = [ ];
  };

  concurrent-output = hsuper.c2n {
    name = "concurrent-output";
    rawPath = builtins.fetchGit {
      url = "git://git.joeyh.name/concurrent-output.git";
      rev = "master";
    };
    apply = [ ];
  };
}
