{ pkgs ? import <nixpkgs> { }
, nur ? import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  }
}:

let
  device = "RTL2838";

  commonsPkgs = with pkgs; [
    # My NUR contrib
    nur.repos.badele.rtl-gopow
    nur.repos.badele.trunk-recorder
    nur.repos.badele.rtlsdr-airband
    nur.repos.badele.tetrapol-kit

    # SDR-RTL
    dump1090
    kalibrate-rtl # kal
    rtl_433
    rtl-sdr
    soapyrtlsdr

    # Realtime SDR/DAB+
    cubicsdr
    gqrx
    qradiolink
    sdrangel
    sdrpp
    sigdigger

    # DAB/DAB+
    dablin
    dabtools
    guglielmo

    # GNU Radio
    (gnuradio3_8.override {
      extraPackages = with gnuradio3_8Packages; [
        ais
        grnet
        limesdr
        osmosdr
        rds
        soapyrtlsdr
      ];
    })
    librtlsdr
    xorg.libxcb

    # Signal analyzer
    audacity
    inspectrum
    urh

    # CW/Morse
    aldo
    fldigi

    # Misc
    usbutils
    xterm
  ];
in

pkgs.stdenv.mkDerivation {
  name = "sdr";

  buildInputs = commonsPkgs
    ++ pkgs.lib.optionals (pkgs.stdenv.isi686 || pkgs.stdenv.isx86_64) [
    # DAB/DAB+
    pkgs.welle-io
  ]
  ;

  shellHook = ''
    # Fix modules
    sudo rmmod -f dvb_usb_rtl28xxu dvb_usb_v2 rtl2832 > /dev/null 2>&1
    sudo chmod 666 $(lsusb  | grep -i ${device} | awk '{print "/dev/bus/usb/" $2 "/" $4}' | sed 's/\://g')
    
    echo "🔨 Sample commands:"
    echo "See apps/sdr/shell.nix for programs list" 
  '';
}
