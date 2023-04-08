# nix-apps

## nix-apps

For using some apps packages

```
nix develop .#<appname> -c $SHELL # local
or
nix develop --no-write-lock-file github:badele/nix-apps#<appname> -c $SHELL # remote
```

## Applications

APP Name | Description
--- | ---
[cc2531](apps/2531) | zigbee CC2531 Texas Instruments USB stick flashing tool


## Nix installation

If you not use the **NixOS** environment, you can install **Nix** on your system distribution.

Below command install `nix` and `flake` tool

```
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)
```