# dotfiles

Personal macOS dotfiles and app setup.

## What's Included

- zsh configuration
- Starship prompt configuration
- Zed settings
- Ghostty config
- `.editorconfig`
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

## mise

Tool versions are managed with mise (activated in `.zshrc`), separately from the `Brewfile`.
