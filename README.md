# nix-apps

<!--toc:start-->
- [nix-apps](#nix-apps)
  - [Projects](#projects)
  - [Apps](#apps)
    - [Packages](#packages)
  - [Nix installation](#nix-installation)
<!--toc:end-->

## Projects

```shell
nix flake new -t "github:badele/nix-apps/master#minimal" new-project-name
cd new-project-name
sh init_project
nix develop
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

APP Name | Description
--- | ---
[cc2531](apps/2531) | zigbee CC2531 Texas Instruments USB stick flashing tool
[network](apps/network) | Network monitoring and sniffing tools
[sdr](apps/sdr) | Software Defined Radio(SDR)
[system](apps/system) | System and performance tools

## Nix installation

If you not use the **NixOS** environment, you can install **Nix**
on your system distribution.

Below command install `nix` and `flake` tool

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)
```
