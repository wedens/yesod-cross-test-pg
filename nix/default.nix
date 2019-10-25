{ nixpkgs ? ./nixpkgs-src.nix
, nixpkgsArgs ? { }
, haskell-nix ? import ./haskell.nix-src.nix
, overlays ? []
, pkgs ? import nixpkgs (haskell-nix // nixpkgsArgs // { overlays = haskell-nix.overlays ++ overlays; })
}:

let
  pkgSet = pkgs.haskell-nix.mkStackPkgSet {
    stack-pkgs = import ./.stack.nix/pkgs.nix;
    pkg-def-extras = [
      # https://github.com/input-output-hk/haskell.nix/issues/214#issuecomment-515785254
      (hackage: { hsc2hs = hackage.hsc2hs."0.68.4".revisions.default; })
    ];
    modules = [
      {
        packages."postgresql-libpq".patches =
          pkgs.stdenv.lib.optionals pkgs.stdenv.hostPlatform.isWindows [
            (pkgs.runCommand "libpq_paths.patch" {} ''
              substitute ${./libpq_paths.patch} $out --subst-var-by libpq ${pkgs.libpq.out}
            '')
          ];
      }
      # disable haddock generation
      { doHaddock = false; }
    ];
  };

in
  pkgSet.config.hsPkgs
