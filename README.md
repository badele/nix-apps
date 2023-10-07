# nix-apps

## Nix installation

Before using this project and if you not have the Nix/NixOS, your must install it

Below command install `nix` and `flake` tool

```shell
# linux/windows
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)

# macos 
sh <(curl -L https://nixos.org/nix/install)
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)
```

## Apps

For using some apps packages

```bash
nix develop --impure .#<appname> -c $SHELL # local
or
nix develop --impure  --no-write-lock-file github:badele/nix-apps#<appname> -c $SHELL # remote
```

**Note:** `--impur` for **NUR** package

### Packages

| APP Name                | Description                                             |
| ----------------------- | ------------------------------------------------------- |
| [cc2531](apps/2531)     | zigbee CC2531 Texas Instruments USB stick flashing tool |
| [network](apps/network) | Network monitoring and sniffing tools                   |
| [sdr](apps/sdr)         | Software Defined Radio(SDR)                             |
| [system](apps/system)   | System and performance tools                            |
