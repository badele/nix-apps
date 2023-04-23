{ pkgs ? import <nixpkgs> { } }: {
  cc2531 = import ./apps/cc2531/shell.nix { inherit pkgs; };
  sdr = import ./apps/sdr/shell.nix { inherit pkgs; };
}
