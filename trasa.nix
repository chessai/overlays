{ hlib # haskell.lib
, fetchFromGitHub
}:

let
  trasaPkg = name: hsuper: hsuper.c2n {
    inherit name;
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "c533ec1189b3802ab3fb9c879bfae3ebf4a4c6ec";
      sha256 = "0ny9hcv87z6pbp0y4sq25byncf4i9xjzr3xzfg5h7riiim9xpr7f";
    };
    relativePath = name;
    apply = [ ];
  };
in hself: hsuper: {
  trasa = trasaPkg "trasa" hsuper;
  trasa-client = trasaPkg "trasa-client" hsuper;
  trasa-server = trasaPkg "trasa-server" hsuper;
  trasa-th = trasaPkg "trasa-th" hsuper;
  trasa-extra = hsuper.c2n {
    name = "trasa-extra";
    rawPath = fetchFromGitHub {
      owner = "goolord";
      repo = "trasa-extra";
      rev = "1ae01da873c66c13731a4ec687d281a8f50a179e";
      sha256 = "0g62h1ljp3myrwpdn7lxbk12rk059khpawh8nh2dp8hfscrla53a";
    };
    apply = [ ];

  };

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
