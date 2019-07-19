{ hlib # haskell.lib
, fetchFromGitHub
}:

hself: hsuper: {
  trasa = hsuper.c2n {
    name = "trasa";
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "1d958c8b92e98d6e0245574d162412c79d49e6bd";
      sha256 = "019c7sn8dy6drd2f0gy063nfp9i2lg8nhqmvjnidychigj4myf6l";
    };
    relativePath = "trasa";
    apply = [ ];
  };

  trasa-client = hsuper.c2n {
    name = "trasa-client";
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "1d958c8b92e98d6e0245574d162412c79d49e6bd";
      sha256 = "019c7sn8dy6drd2f0gy063nfp9i2lg8nhqmvjnidychigj4myf6l";
    };
    relativePath = "trasa-client";
    apply = [ ];
  };

  trasa-server = hsuper.c2n {
    name = "trasa-server";
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "1d958c8b92e98d6e0245574d162412c79d49e6bd";
      sha256 = "019c7sn8dy6drd2f0gy063nfp9i2lg8nhqmvjnidychigj4myf6l";
    };
    relativePath = "trasa-server";
    apply = [ ];
  };

  trasa-th = hsuper.c2n {
    name = "trasa-th";
    rawPath = fetchFromGitHub {
      owner = "haskell-trasa";
      repo = "trasa";
      rev = "1d958c8b92e98d6e0245574d162412c79d49e6bd";
      sha256 = "019c7sn8dy6drd2f0gy063nfp9i2lg8nhqmvjnidychigj4myf6l";
    };
    relativePath = "trasa-th";
    apply = [ ];
  };

  trasa-extra = hsuper.c2n {
    name = "trasa-extra";
    rawPath = fetchFromGitHub {
      owner = "goolord";
      repo = "trasa-extra";
      sha256 = "0g62h1ljp3myrwpdn7lxbk12rk059khpawh8nh2dp8hfscrla53a";
      rev = "1ae01da873c66c13731a4ec687d281a8f50a179e";
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
