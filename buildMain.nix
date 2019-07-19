{ hlib # haskell.lib
, profiling ? false
, haddocks ? false
}:

hself: hsuper: {
  buildMain = name: path: hsuper.c2n {
    inherit name path;
    apply = [ ]
      ++ ( if profiling
             then [
               hlib.enableLibraryProfiling
               hlib.enableExecutableProfiling
             ]
             else [
               hlib.disableLibraryProfiling
               hlib.disableExecutableProfiling
             ]
         )
      ++ ( if haddocks
             then [ hlib.doHaddock ]
             else [ hlib.dontHaddock ]
         );
  };
}
