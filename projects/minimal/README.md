# {{REPOSITORY}}

## {{REPOSITORY}} project configuration

Allowing **github action** (release and changelog push)

Goto to [Actions settings](
<https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/settings/actions>)

## Included tools

This template includes this tools

- nix/flake - reproducible, declarative and reliable developpement systems
- pre-commit
- cocogitto - auto versionning and conventional commits

## Git workflow

- `nix develop` or automatically loaded with `direnv` tool
- Conventional commits - `cog feat "message" scope`
  - pre-commit hook
    - markdownlint - markdown linter
    - nixpkgs-fmt - nix linter
- Github releasing ([release action](
<https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/actions/workflows/Release.yml>)
