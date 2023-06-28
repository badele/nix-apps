{ pkgs ? import <nixpkgs> { }
, nur ? import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  }
}:

let
  pythonEnv = pkgs.python310.withPackages
    (p: with p; [
      six # Used by tetrapol-kit/demod
    ]);

  commonsPkgs = with pkgs; [
    # System performance
    atop
    btop
    htop
    procps
    iotop
    iotop-c
    dstat
    sysstat
    nmon

    # Trace
    strace
    ltrace
    lsof
  ];
in

pkgs.stdenv.mkDerivation {
  name = "network";

  buildInputs = commonsPkgs
    ++ pkgs.lib.optionals (pkgs.stdenv.isi686 || pkgs.stdenv.isx86_64) [
  ];



  shellHook = ''
    echo "🔨 Available commands"
    echo $PATH | tr ":" "\n" | grep -E "/nix/store" | sed -e "s/\/nix\/store\/[a-z0-9]\+\-//g" | sed -e "s/\/.*//g" | sed -e "s/\-.*//g" | sort -u | column
  '';
}
