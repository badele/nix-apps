{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "sdr";

  buildInputs = with pkgs; [
    cocogitto
    nixpkgs-fmt
    nodePackages.markdownlint-cli
    pre-commit
  ];

  shellHook = ''
    export PROJ="nix-apps"

    echo ""
    echo "⭐ Welcome to the $PROJ project ⭐"
    echo ""
  '';
}
