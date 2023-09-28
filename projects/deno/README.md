# {{REPOSITORY}}

## TODO {{REPOSITORY}} project initialisation

- Enable **Read and write permissions** on the
[Github action workflow permission](https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/settings/actions)
(for pushing the release and changelog)

## Included with this project

- nix/flake - reproducible, declarative and reliable developpement systems
- pre-commit
- cocogitto - conventional commits and auto versioning
- deno - typescript/javascript engine

## Git workflow

- `nix develop` or automatically loaded with `direnv` tool
- Conventional commits - `cog feat "message" scope`
  - pre-commit hook
    - markdownlint - markdown linter
    - nixpkgs-fmt - nix linter
- github
  - CI
    - conventional commits
    - lint
    - test
    - coverage
  - Manually releasing a new version
    [release action](https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/actions/workflows/Release.yml)
