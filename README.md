# nix-apps

<!--toc:start-->
- [nix-apps](#nix-apps)
  - [Nix installation](#nix-installation)
  - [Project initialisation](#project-initialisation)
    - [Github](#github)
  - [Apps](#apps)
    - [Packages](#packages)
<!--toc:end-->

## Nix installation

Before using this project and if you not have the Nix/NixOS, your must install it

Below command install `nix` and `flake` tool

```bash
# linux: sh <(curl -L https://nixos.org/nix/install) --daemon
# macos: sh <(curl -L https://nixos.org/nix/install)
grep 'experimental-features' /etc/nix/nix.conf || (echo 'experimental-features = nix-command flakes' >> /etc/nix/nix.conf)

# [Optional] direnv (load and unload environment variables depending on the current directory)
curl -sfL https://direnv.net/install.sh | bash
```

## Project initialisation

### Github

- From github website, create repository (without enabled
"Initialize this repository with")
- Enable **Read and write permissions** on the [Workflow permission section](
<https://github.com/badele/test/settings/actions>)

```shell
nix flake new -t "github:badele/nix-appsminimal" your-project-name
cd your-project-name
sh init_project
nix develop
```

### Project

Project | Description
--- | ---
[minimal](projects/minimal) | Minimal CI project

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
