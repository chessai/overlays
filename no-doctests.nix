{ hlib # haskell.lib
, ...
}:

hself: hsuper: {
  comonad = hlib.disableCabalFlag hsuper.comonad "test-doctests";
  semigroupoids = hlib.disableCabalFlag hsuper.semigroupoids "doctests";
  lens = hlib.disableCabalFlag hsuper.lens "test-doctests";
  distributive = hlib.dontCheck (hlib.disableCabalFlag hsuper.distributive "test-doctests");

  http-types        = hlib.dontCheck hsuper.http-types;
  silently          = hlib.dontCheck hsuper.silently;
  unliftio          = hlib.dontCheck hsuper.unliftio;
  conduit           = hlib.dontCheck hsuper.conduit;
  yaml              = hlib.dontCheck hsuper.yaml;
  extra             = hlib.dontCheck hsuper.extra;
  half              = hlib.dontCheck hsuper.half;
  iproute           = hlib.dontCheck hsuper.iproute;
  aeson-compat      = hlib.dontCheck hsuper.aeson-compat;
  tzdata            = hlib.dontCheck hsuper.tzdata;
  tz                = hlib.dontCheck hsuper.tz;
  time-exts         = hlib.dontCheck hsuper.time-exts;
  double-conversion = hlib.dontCheck hsuper.double-conversion;
}
