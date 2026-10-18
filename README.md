# homebrew-tap

The [Homebrew](https://brew.sh/) tap for developer tools and menu-bar utilities from [seankoji-com](https://github.com/seankoji-com). Write-ups for each tool are at [seankoji.com/open-source](https://seankoji.com/open-source).

## Available formulae

| Formula | What it does | Platforms | Install |
|---|---|---|---|
| [t3-plugins](https://github.com/seankoji-com/t3-plugins) | Provider-neutral agent workflows for T3 Code, with tests and review tied to the exact revision | macOS, Linux | `brew install seankoji-com/tap/t3-plugins` |
| [frugalbar](https://github.com/seankoji-com/frugalbar) | AI quotas, spend caps and rate limits in the macOS menu bar | macOS 15+ on Apple silicon | `brew install seankoji-com/tap/frugalbar` |
| [freshen](https://github.com/seankoji-com/freshen) | Terminal dashboard for syncing a folder of Git repositories and watching their CI | macOS, Linux | `brew install seankoji-com/tap/freshen` |

The t3-plugins formula also installs an `imps` command.

## Quick start

Add the tap:

```bash
brew tap seankoji-com/tap
```

Install a formula:

```bash
brew install t3-plugins
t3-plugins setup

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
