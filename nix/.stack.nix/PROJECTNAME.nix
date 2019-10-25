let
  buildDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (build dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  sysDepError = pkg:
    builtins.throw ''
      The Nixpkgs package set does not contain the package: ${pkg} (system dependency).
      
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      '';
  pkgConfDepError = pkg:
    builtins.throw ''
      The pkg-conf packages does not contain the package: ${pkg} (pkg-conf dependency).
      
      You may need to augment the pkg-conf package mapping in haskell.nix so that it can be found.
      '';
  exeDepError = pkg:
    builtins.throw ''
      The local executable components do not include the component: ${pkg} (executable dependency).
      '';
  legacyExeDepError = pkg:
    builtins.throw ''
      The Haskell package set does not contain the package: ${pkg} (executable dependency).
      
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
  buildToolDepError = pkg:
    builtins.throw ''
      Neither the Haskell package set or the Nixpkgs package set contain the package: ${pkg} (build tool dependency).
      
      If this is a system dependency:
      You may need to augment the system package mapping in haskell.nix so that it can be found.
      
      If this is a Haskell dependency:
      If you are using Stackage, make sure that you are using a snapshot that contains the package. Otherwise you may need to update the Hackage snapshot you are using, usually by updating haskell.nix.
      '';
in { system, compiler, flags, pkgs, hsPkgs, pkgconfPkgs, ... }:
  ({
    flags = { dev = false; library-only = false; };
    package = {
      specVersion = "0";
      identifier = { name = "PROJECTNAME"; version = "0.0.0"; };
      license = "NONE";
      copyright = "";
      maintainer = "";
      author = "";
      homepage = "";
      url = "";
      synopsis = "";
      description = "";
      buildType = "Simple";
      isLocal = true;
      };
    components = {
      "library" = {
        depends = [
          (hsPkgs."aeson" or (buildDepError "aeson"))
          (hsPkgs."base" or (buildDepError "base"))
          (hsPkgs."bytestring" or (buildDepError "bytestring"))
          (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
          (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
          (hsPkgs."classy-prelude-conduit" or (buildDepError "classy-prelude-conduit"))
          (hsPkgs."classy-prelude-yesod" or (buildDepError "classy-prelude-yesod"))
          (hsPkgs."conduit" or (buildDepError "conduit"))
          (hsPkgs."containers" or (buildDepError "containers"))
          (hsPkgs."data-default" or (buildDepError "data-default"))
          (hsPkgs."directory" or (buildDepError "directory"))
          (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
          (hsPkgs."file-embed" or (buildDepError "file-embed"))
          (hsPkgs."foreign-store" or (buildDepError "foreign-store"))
          (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
          (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
          (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
          (hsPkgs."monad-control" or (buildDepError "monad-control"))
          (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
          (hsPkgs."persistent" or (buildDepError "persistent"))
          (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
          (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
          (hsPkgs."safe" or (buildDepError "safe"))
          (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
          (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
          (hsPkgs."text" or (buildDepError "text"))
          (hsPkgs."time" or (buildDepError "time"))
          (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
          (hsPkgs."vector" or (buildDepError "vector"))
          (hsPkgs."wai" or (buildDepError "wai"))
          (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
          (hsPkgs."wai-logger" or (buildDepError "wai-logger"))
          (hsPkgs."warp" or (buildDepError "warp"))
          (hsPkgs."yaml" or (buildDepError "yaml"))
          (hsPkgs."yesod" or (buildDepError "yesod"))
          (hsPkgs."yesod-auth" or (buildDepError "yesod-auth"))
          (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
          (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
          (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
          ];
        buildable = true;
        };
      exes = {
        "PROJECTNAME" = {
          depends = [
            (hsPkgs."PROJECTNAME" or (buildDepError "PROJECTNAME"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
            (hsPkgs."classy-prelude-conduit" or (buildDepError "classy-prelude-conduit"))
            (hsPkgs."classy-prelude-yesod" or (buildDepError "classy-prelude-yesod"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."foreign-store" or (buildDepError "foreign-store"))
            (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
            (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-logger" or (buildDepError "wai-logger"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-auth" or (buildDepError "yesod-auth"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
            (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
            ];
          buildable = if flags.library-only then false else true;
          };
        };
      tests = {
        "PROJECTNAME-test" = {
          depends = [
            (hsPkgs."PROJECTNAME" or (buildDepError "PROJECTNAME"))
            (hsPkgs."aeson" or (buildDepError "aeson"))
            (hsPkgs."base" or (buildDepError "base"))
            (hsPkgs."bytestring" or (buildDepError "bytestring"))
            (hsPkgs."case-insensitive" or (buildDepError "case-insensitive"))
            (hsPkgs."classy-prelude" or (buildDepError "classy-prelude"))
            (hsPkgs."classy-prelude-conduit" or (buildDepError "classy-prelude-conduit"))
            (hsPkgs."classy-prelude-yesod" or (buildDepError "classy-prelude-yesod"))
            (hsPkgs."conduit" or (buildDepError "conduit"))
            (hsPkgs."containers" or (buildDepError "containers"))
            (hsPkgs."data-default" or (buildDepError "data-default"))
            (hsPkgs."directory" or (buildDepError "directory"))
            (hsPkgs."fast-logger" or (buildDepError "fast-logger"))
            (hsPkgs."file-embed" or (buildDepError "file-embed"))
            (hsPkgs."foreign-store" or (buildDepError "foreign-store"))
            (hsPkgs."hjsmin" or (buildDepError "hjsmin"))
            (hsPkgs."hspec" or (buildDepError "hspec"))
            (hsPkgs."http-client-tls" or (buildDepError "http-client-tls"))
            (hsPkgs."http-conduit" or (buildDepError "http-conduit"))
            (hsPkgs."monad-control" or (buildDepError "monad-control"))
            (hsPkgs."monad-logger" or (buildDepError "monad-logger"))
            (hsPkgs."persistent" or (buildDepError "persistent"))
            (hsPkgs."persistent-postgresql" or (buildDepError "persistent-postgresql"))
            (hsPkgs."persistent-template" or (buildDepError "persistent-template"))
            (hsPkgs."safe" or (buildDepError "safe"))
            (hsPkgs."shakespeare" or (buildDepError "shakespeare"))
            (hsPkgs."template-haskell" or (buildDepError "template-haskell"))
            (hsPkgs."text" or (buildDepError "text"))
            (hsPkgs."time" or (buildDepError "time"))
            (hsPkgs."unordered-containers" or (buildDepError "unordered-containers"))
            (hsPkgs."vector" or (buildDepError "vector"))
            (hsPkgs."wai" or (buildDepError "wai"))
            (hsPkgs."wai-extra" or (buildDepError "wai-extra"))
            (hsPkgs."wai-logger" or (buildDepError "wai-logger"))
            (hsPkgs."warp" or (buildDepError "warp"))
            (hsPkgs."yaml" or (buildDepError "yaml"))
            (hsPkgs."yesod" or (buildDepError "yesod"))
            (hsPkgs."yesod-auth" or (buildDepError "yesod-auth"))
            (hsPkgs."yesod-core" or (buildDepError "yesod-core"))
            (hsPkgs."yesod-form" or (buildDepError "yesod-form"))
            (hsPkgs."yesod-static" or (buildDepError "yesod-static"))
            (hsPkgs."yesod-test" or (buildDepError "yesod-test"))
            ];
          buildable = true;
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.././.; }) // {
    cabal-generator = null;
    }
