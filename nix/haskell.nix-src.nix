let
  spec = builtins.fromJSON (builtins.readFile ./haskell.nix-src.json);
  haskell-nix-src = {
    url = "${spec.url}/archive/${spec.rev}.tar.gz";
    inherit (spec) sha256;
  };
in
  import (builtins.fetchTarball haskell-nix-src)
