# nix-apps

For using some apps packages

```bash
nix develop .#<appname> -c $SHELL # local
or
nix develop --no-write-lock-file github:badele/nix-apps#<appname> -c $SHELL # remote
```

## Packages

APP Name | Description
--- | ---
[cc2531](apps/2531) | zigbee CC2531 Texas Instruments USB stick flashing tool
[sdr](apps/sdr) | Software Defined Radio(SDR)

## Applications

### [cc2531](apps/2531)

- cc-tool
- zigbee2mqtt

### [sdr](apps/sdr)

- dump1090
- gqrx
- sdrpp
- sdrangel
- gnuradio
- urh
- inspectrum
- gnuradio
- audacity

## Nix installation

If you not use the **NixOS** environment, you can install **Nix**
on your system distribution.

Below command install `nix` and `flake` tool

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)
```
