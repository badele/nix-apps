# {{REPOSITORY}}

## TODO {{REPOSITORY}} project initialisation

- Enable **Read and write permissions** on the [Github action workflow permission](
<https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/settings/actions>)
(for pushing the release and changelog)
- Add CODECOV_TOKEN on the [secret project](
<https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/secrets/actions>)

## Included with this project

- nix/flake - reproducible, declarative and reliable developpement systems
- pre-commit - verify commit before commit validation
- cocogitto - conventional commits and auto versioning
- sbt - scala build tool
- sbt-scalafmt - lint the code
- sbt-codecov - coverage code

## Git workflow

- `nix develop` or automatically loaded with `direnv` tool
- Conventional commits - `cog feat "message" scope`
  - pre-commit hook
    - markdownlint - markdown linter
    - nixpkgs-fmt - nix linter
    - scalafmt - scala linter
- github
  - CI
    - conventional commits
    - lint
    - test
    - coverage
  - Manually releasing a new version [release action](
<https://{{REMOTE}}/{{OWNER}}/{{REPOSITORY}}/actions/workflows/Release.yml>)
