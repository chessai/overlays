{ lib # pkgs.lib
, hlib # haskell.lib
, fetchFromGitHub
, sources ? {} # niv sources
, ...
}:

let
  # This function removes any cruft not relevant to our Haskell builds.
  #
  # If something irrelevant to our build is not removed by this function, and
  # you modify that file, Nix will rebuild the derivation even though nothing
  # that would affect the output has changed.
  #
  # The `excludePred` argument is a function that can be used to filter out more
  # files on a package-by-package basis.
  # The `includePred` argument is a function that can be used to include files
  # that this function would normally filter out.
  clean = (
    { path,
      excludePred ? (name: type: false),
      includePred ? (name: type: false)
    }:
    if lib.canCleanSource path
    then lib.cleanSourceWith {
           filter = name: type: (includePred name type) || !(
             with rec {
               baseName     = baseNameOf (toString name);
               isFile       = (type == "regular");
               isLink       = (type == "symlink");
               isDir        = (type == "directory");
               isUnknown    = (type == "unknown");
               isNamed      = str: (baseName == str);
               hasExtension = ext: (lib.hasSuffix ext baseName);
               beginsWith   = pre: (lib.hasPrefix pre baseName);
               matches      = regex: (builtins.match regex baseName != null);
             };

             lib.any (lib.all (x: x)) [
               # Each element of this list is a list of booleans, which should be
               # thought of as a "predicate" on paths; the predicate is true if the
               # list is composed entirely of true values.
               #
               # If any of these predicates is true, then the path will not be
               # included in the source used by the Nix build.
               #
               # Remember to use parentheses around elements of a list;
               # `[ f x ]`   is a heterogeneous list with two elements,
               # `[ (f x) ]` is a homogeneous list with one element.
               # Knowing the difference might save your life.
               [ (excludePred name type) ]
               [ isUnknown ]
               [ isDir (isNamed "dist") ]
               [ isDir (isNamed "dist-newstyle") ]
               [ isDir (isNamed  "run") ]
               [ (isFile || isLink) (hasExtension ".nix") ]
               [ (beginsWith ".ghc") ]
               [ (hasExtension ".sh") ]
               #[ (hasExtension ".txt") ]
               [ (hasExtension ".md") ]
               [ (hasExtension ".rst") ]
             ]);
           src = lib.cleanSource path;
         }
    else path);
in hself: hsuper: {
  nivc2n = (
    { source
    , name ? source
    , relativePath ? null
    , args ? {}
    , apply ? []
    , extraCabal2nixOptions ? []
    }: hself.c2n {
    inherit name relativePath args apply extraCabal2nixOptions;
    rawPath = fetchFromGitHub { inherit (sources.${source}) owner repo rev sha256; };
  });

  c2n = (
    { name
    , path ? (throw "c2n requires a path argument!")
    , rawPath ? (clean { inherit path; })
    , relativePath ? null
    , args ? {}
    , apply ? []
    , extraCabal2nixOptions ? []
    }:

    with rec {
      filter = p: type: (
        (lib.hasSuffix "${name}.cabal" p)
        || (baseNameOf p == "package.yaml"));
      expr = hsuper.haskellSrc2nix {
        inherit name;
        extraCabal2nixOptions = lib.concatStringsSep " " (
          (if relativePath == null then [] else ["--subpath" relativePath])
          ++ extraCabal2nixOptions);
        src = if lib.canCleanSource rawPath
              then lib.cleanSourceWith { src = rawPath; inherit filter; }
              else rawPath;
      };
      compose = f: g: x: f (g x);
      composeList = x: lib.foldl' compose lib.id x;
    };

    composeList apply (hlib.overrideCabal (hself.callPackage expr args) (orig: { src = rawPath; })));

}
