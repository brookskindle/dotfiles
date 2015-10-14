# Dotfiles
My collection of dotfiles, managed by [gnu
stow](https://www.gnu.org/software/stow/). These are inspired by [xero's
dotfiles](https://github.com/xero/dotfiles).

## Installation
```bash
cd ~/
git clone https://github.com/brookskindle/dotfiles
cd dotfiles
```
From here, use stow to install or uninstall the dotfiles.
```
stow vim  # Install vim dotfiles
stow -D vim  # Uninstall vim dotfiles
```

You can do this for any base folder in the dotfiles repository.
