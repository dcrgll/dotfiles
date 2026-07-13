# dotfiles

Personal macOS dotfiles and app setup.

## What's Included

- zsh configuration
- Starship prompt configuration
- Zed settings
- `.hushlogin` (suppresses login banner / last-login message)
- Homebrew `Brewfile`

## Install

From this repo:

```sh
./install.sh
```

This symlinks config files into `$HOME`. Existing files that aren't already symlinks are backed up as `*.bak.<timestamp>` first.

To also install Homebrew packages from the `Brewfile`:

```sh
./install.sh --brew
```

## asdf

asdf Node versions and plugins are managed separately from the `Brewfile`.
