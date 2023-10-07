{
  description = "Nix applications packages";

  # See tags on https://github.com/NixOS/nixpkgs
  # ex:
  # inputs.nixpkgs.url = "github:NixOS/nixpkgs/22.11";
  # inputs.nixpkgs.url = "github:NixOS/nixpkgs/4d2b37a84fad1091b9de401eb450aae66f1a741e";
  # inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/22.11";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "i686-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    {
      devShells = nixpkgs.lib.genAttrs systems (system: import ./. {
        pkgs = import nixpkgs { inherit system; };
      });
    };
}
