{ hlib # haskell.lib
, fetchFromGitHub
}:

let
  trasaPkg = name: hsuper: hsuper.c2n {
    inherit name;
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "4105723995a336a009ca1b094cae8fc906193fcf";
      sha256 = "19rv5y37rakppnqdm00pbb8h7l53cc0dbrbb9w8sy5w6gahmd3ws";
    };
    relativePath = name;
    apply = [ ];
  };
in hself: hsuper: {
  trasa = trasaPkg "trasa" hsuper;
  trasa-client = trasaPkg "trasa-client" hsuper;
  trasa-server = trasaPkg "trasa-server" hsuper;
  trasa-th = trasaPkg "trasa-th" hsuper;
  trasa-extra = trasaPkg "trasa-extra" hsuper;

  wai = hsuper.c2n {
    name = "wai";
    rawPath = fetchFromGitHub {
      owner = "yesodweb";
      repo = "wai";
      rev = "30dd777bc773890ff31f01fa16cf7a79fbc551d7";
      sha256 = "1q0gin2sbj35zn2d8gfamf1xx2cxr8mdy87zl4g9ibkz4ahccs10";
    };
    relativePath = "wai";
    apply = [ ];
  };
}
