{ pkgs ? import <nixpkgs> { }
}:

let
  device = "RTL2838";
in

pkgs.stdenv.mkDerivation {
  name = "sdr";

  buildInputs = with pkgs; [
    # Signal receiver
    rtl_433
    rtl-sdr
    dump1090

    # Realtime SDR
    gqrx
    sdrpp
    sdrangel

    # GNU Radio
    gnuradio
    gnuradio3_8Packages.ais
    gnuradio3_8Packages.rds
    gnuradio3_8Packages.python
    gnuradio3_8Packages.osmosdr
    gnuradio3_8Packages.gnuradio

    # Signal analyzer
    urh
    inspectrum
    gnuradio
    audacity

    usbutils
  ];

  shellHook = ''
    # Fix modules
    sudo rmmod -f dvb_usb_rtl28xxu dvb_usb_v2 rtl2832 > /dev/null 2>&1
    sudo chmod 666 $(lsusb  | grep -i ${device} | awk '{print "/dev/bus/usb/" $2 "/" $4}' | sed 's/\://g')
    
    tools="🔨 Sample commands:
    dump1090

    gqrx
    sdrpp
    sdrangel
    gnuradio

    urh
    inspectrum
    gnuradio
    audacity
    "

    echo "$tools"
  '';
}
