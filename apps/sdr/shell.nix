{ pkgs ? import <nixpkgs> { }
}:


# pkgs.mkShell {
#   buildInputs = with pkgs; [
#     urh
#     rtl-sdr
#     rtl_433

#     usbutils
#     strace
#   ];

#   shellHook = ''
#     lsusb
#   '';
# }

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

    # Signal analyzer
    gnuradio
    gqrx
    urh
    inspectrum
    audacity

    usbutils
  ];

  shellHook = ''
    # Fix modules
    sudo rmmod -f dvb_usb_rtl28xxu dvb_usb_v2 rtl2832 > /dev/null 2>&1
    sudo chmod 666 $(lsusb  | grep -i ${device} | awk '{print "/dev/bus/usb/" $2 "/" $4}' | sed 's/\://g')
    
    tools="🔨 Sample commands:
      urh
      gqrx
      gnuradio
      audacity      
      inspectrum
    "

    echo "$tools"
  '';
}
