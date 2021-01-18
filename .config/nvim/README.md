# Neovim configuration

## Cheatsheet

[Cheatsheet file](keys/cheatsheet.md)

## Installation

```shell
mkdir $HOME/.config
git clone git@github.com:PasiBergman/nvim.git $HOME/.config/nvim
```

Add Vimspector adapters in nvim:

```viml
" Install Vimspector debugging adapters
:VimspectorInstall
```

## Dependencies

For all features, please make sure that the following dependencies have been
installed.

### macOS / Homebrew

```shell
brew tap "homebrew/bundle"
brew tap "homebrew/cask"
brew tap "homebrew/cask-fonts"
brew tap "homebrew/core"
# iTerm2 used with macOS. Not needed/available for Linux.
brew install "iterm2" --cask
brew install "neovim"
brew install "tmux"
brew install "fzf"
brew install "git"
brew install "ripgrep"
brew install "font-hack-nerd-font" --cask
brew install "font-jetbrains-mono-nerd-font" --cask
brew install "font-sauce-code-pro-nerd-font" --cask
brew install python3
# Using nvm to handle node virtual environments
brew install nvm
# Install python3 provider dependencies
pip3 install pynvim
pip3 install neovim-remote
# Install node v14.15.3 (or select newer LTS version)
nvm install 14.15.3
# Install node dependencies
npm install -g neovim
```

### Debian / Ubuntu / Raspberry Pi OS

```shell
sudo apt update && sudo apt upgrade -y
sudo apt install zsh git curl python3 python3-pip -y
sudo apt install tmux neovim fzf ripgrep software-properties-common -y
# Install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install nvm (node version manager)
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.zshrc
# Install python3 provider dependencies
pip3 install pynvim
pip3 install neovim-remote
# Install node v14.15.3 (or select newer LTS version)
nvm install 14.15.3
# Install node dependencies
npm install -g neovim
```

## Credits

Originally based on nvim repository by Christian Chiarulli. Please checkout his work:

- [Original repository](https://github.com/ChristianChiarulli/nvim)
- [Blog](https://www.chrisatmachine.com)
- [YouTube](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA)
