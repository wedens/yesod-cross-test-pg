#!/usr/bin/env bash

nix build '(with (import ./nix/nixpkgs-src.nix) (import ./nix/haskell.nix-src.nix); haskell-nix.nix-tools)' --out-link nt

./nt/bin/stack-to-nix -o nix/.stack.nix

# unused
rm nix/.stack.nix/default.nix

unlink nt
