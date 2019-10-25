{ nixpkgs ? <nixpkgs> }:

let
  hsPkgs = import ./default.nix { };
  hsPkgsWin64 = import ./default.nix {
    nixpkgsArgs = {
      crossSystem = { config = "x86_64-pc-mingw32"; };
    };
    overlays = [(self: super: {
      libpq = super.callPackage ./postgresql-prebuild.nix {
        inherit (super.buildPackages) fetchurl unzip;
      };
    })];
  };
in {
  PROJECTNAME = hsPkgs.PROJECTNAME.components.exes.PROJECTNAME;
  PROJECTNAME-win64 = hsPkgsWin64.PROJECTNAME.components.exes.PROJECTNAME;
}
