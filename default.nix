{ pkgs ? import <nixpkgs> { } }: {
  cc2531 = import ./apps/cc2531/shell.nix { inherit pkgs; };
  network = import ./apps/network/shell.nix { inherit pkgs; };
  sdr = import ./apps/sdr/shell.nix { inherit pkgs; };
  system = import ./apps/system/shell.nix { inherit pkgs; };
}
