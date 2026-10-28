# homebrew-tap

The [Homebrew](https://brew.sh/) tap for developer tools and menu-bar utilities from [seankoji-com](https://github.com/seankoji-com). Write-ups for each tool are at [seankoji.com/open-source](https://seankoji.com/open-source).

## Available formulae

| Formula | What it does | Platforms | Install |
|---|---|---|---|
| [frugalbar](https://github.com/seankoji-com/frugalbar) | AI quotas, spend caps and rate limits in the macOS menu bar | macOS 15+ on Apple silicon | `brew install seankoji-com/tap/frugalbar` |
| [freshen](https://github.com/seankoji-com/freshen) | Terminal dashboard for syncing a folder of Git repositories and watching their CI | macOS, Linux | `brew install seankoji-com/tap/freshen` |

The agent workflows formerly installed as `t3-plugins` are no longer distributed through Homebrew. Install them from their Git repository, [seankoji-com/.agents](https://github.com/seankoji-com/.agents). Existing installs keep working until you run `brew uninstall t3-plugins`.

## Quick start

Add the tap:

```bash
brew tap seankoji-com/tap
```

Install a formula:

```bash
brew install frugalbar
brew services start frugalbar

brew install freshen
```

Keep them current:

```bash
brew update
brew upgrade
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for adding or updating formulae.

## Licence

This repository is available under the [MIT License](LICENSE). Each formula installs software under its own project's licence.
