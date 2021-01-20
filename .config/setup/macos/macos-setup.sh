# https://sourabhbajaj.com/mac-setup/

# Install Xcode Commad line tools
xcode-select --install
if [ !$? ]; then return; fi;

# Setup Screenshots folder
mkdir $HOME/Screenshots && \
    defaults write com.apple.screencapture location $HONE/Screenshots/ && \
    killall SystemUIServer
if [ !$? ]; then return; fi;

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
if [ !$? ]; then return; fi;

brew update
chsh -s $(which zsh)
if [ !$? ]; then return; fi;

brew tap caskroom/cask
if [ !$? ]; then return; fi;

brew cask install google-chrome
if [ !$? ]; then return; fi;

brew cask install iterm2
if [ !$? ]; then return; fi;

brew install zsh git tree fzf ack tmux python3 nvm
if [ !$? ]; then return; fi;

[ -f /usr/local/opt/fzf/install ] && /usr/local/opt/fzf/install

git config --global user.name "Pasi Bergman" && \
    git config --global user.email "pasi.bergman@hiq.fi" && \
    git config --global credential.helper osxkeychain
if [ !$? ]; then return; fi;

brew cask install visual-studio-code
if [ !$? ]; then return; fi;

sudo pip3 install --upgrade setuptools
if [ !$? ]; then return; fi;

sudo pip3 install --upgrade pip
if [ !$? ]; then return; fi;

pip3 install virtualenv
if [ !$? ]; then return; fi;

brew cask install dotnet-sdk
if [ !$? ]; then return; fi;

curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
if [ !$? ]; then return; fi;

echo "Install Source Code Pro for Powerline fonts"
open https://github.com/powerline/fonts
