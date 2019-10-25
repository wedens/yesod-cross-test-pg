{
  extras = hackage:
    { packages = { PROJECTNAME = ./PROJECTNAME.nix; }; };
  resolver = "lts-13.30";
  modules = [ ({ lib, ... }: { packages = {}; }) { packages = {}; } ];
  }