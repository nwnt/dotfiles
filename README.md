## Prerequisites
- Clone dotfiles to $HOME/work/config
- GNU Stow
- exa (ls drop-in replacement)
- tldr (modern man)
- fasd
- nodejs (needed for CoC)

## ZSH
1. Change bash to zsh
1. `mkdir -p .config/zsh`
1. `sudo stow -d $HOME/work/config/dotfiles/etc/ -t /etc/zsh -S -v zsh`
1. `sudo stow -d $HOME/work/config/dotfiles/etc/ -t /etc/profile.d -S -v profile.d`
1. `stow -d $HOME/work/config/dotfiles -t $HOME/.config/zsh -S -v zsh
1. Install OMZ per the instructions on the web.  $ZSH (the installation location) has been overriden in .zshrc
1. Install Powerlevel 10k.  See OMZ section.
1. Install zsh-syntax-highlighting. Again, see OMZ section.
1. Install zsh-autosuggestions

## Fonts 

Currently, Comic Mono is used, but the AUR doesn't have the nerd font patch.

```
sudo curl -sLo /usr/local/share/fonts/ComicMonoNF.ttf https://github.com/xtevenx/ComicMonoNF/raw/master/ComicMonoNF.ttf
sudo curl -sLo /usr/local/share/fonts/ComicMonoNF-Bold.ttf https://github.com/xtevenx/ComicMonoNF/raw/master/ComicMonoNF-Bold.ttf
```

## Alacritty
1. `mkdir -p .config/alacritty`
1. `stow -d ./work/config/dotfiles -t .config/alacritty -v -S alacritty`

## Neovim
1. `mkdir -p .config/nvim`
1. `stow -d ./work/config/dotfiles -t .config/nvim -v -S nvim`
1. Install vim-plug (see Neovim section)
2. Coc-Install
