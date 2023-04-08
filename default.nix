{ pkgs ? import <nixpkgs> { } }: {
  cc2531 = import ./apps/cc2531/shell.nix { inherit pkgs; };
}
