{ pkgs ? import <nixpkgs> { }
}:
let
  serial_port = "/dev/ttyACM0";
  firmware_revision = "20211115";
  firmware_url = "https://github.com/Koenkk/Z-Stack-firmware/raw/master/coordinator/Z-Stack_Home_1.2/bin/default/CC2531_DEFAULT_${firmware_revision}.zip";

  zigbee2mqtt_conf = pkgs.writeText "configuration.yaml" ''
    # Minimal configuration.yml example
    permit_join: false
    mqtt:
      server: mqtt://localhost:1883
    serial:
      port: ${serial_port}
    frontend: false
  '';

  flashcc2531 = pkgs.writeShellScriptBin "flash_cc2531" ''
    wget -O /tmp/CC2531_DEFAULT_${firmware_revision}.zip "${firmware_url}"
    unzip -d /tmp /tmp/CC2531_DEFAULT_${firmware_revision}.zip
    sudo cc-tool -e -w /tmp/CC2531ZNP-Prod.hex
  '';

  check_cc2531_revision = pkgs.writeShellScriptBin "check_cc2531_revision" ''
    sudo chmod o+rw ${serial_port}
    mkdir -p /tmp/cc2531
    install -o$(id -u) -g$(id -g) ${zigbee2mqtt_conf} /tmp/cc2531/configuration.yaml
    zigbee2mqtt | egrep -o 'revision":${firmware_revision}' > /dev/null && echo "Good revision"
  '';


in
pkgs.stdenv.mkDerivation {
  name = "app";

  buildInputs = with pkgs; [
    # Texas Instruments CC Debugger
    cc-tool

    # My flashing tools
    flashcc2531
    check_cc2531_revision

    # zigbee2mqtt tools
    zigbee2mqtt

    # Misc
    unzip
    wget
  ];

  shellHook = ''
    tools="🔨 zigbee CC2531 Texas Instruments USB stick flashing tool

    For flashing your CC2541 follow below commands:
    > flash_cc2531

    Verify you firmware version:
    > check_cc2531_revision
    "

    export ZIGBEE2MQTT_DATA=/tmp/cc2531
    echo "$tools"
  '';
}
