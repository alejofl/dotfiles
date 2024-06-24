# Configure ZSH
mkdir $HOME/.zsh
cp zsh/functions.sh $HOME/.zsh/functions.sh
cp zsh/prompt.sh $HOME/.zsh/prompt.sh
cp zsh/.zshrc $HOME/.zshrc

# Config Files
cp config_files/.gitconfig $HOME/.gitconfig
cp config_files/.gitauthors $HOME/.gitauthors

# Install Git
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Configure PATH
sudo sh -c 'cat /etc/paths > /etc/paths.d/10-apple'
sudo sh -c 'echo "" > /etc/paths'
sudo sh -c 'echo "/opt/homebrew/bin" > /etc/paths.d/01-homebrew'
sudo sh -c 'echo "/opt/homebrew/sbin" >> /etc/paths.d/01-homebrew'

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Install formulae and apps
eval "$(/opt/homebrew/bin/brew shellenv)"
./formulae.sh
./apps.sh

# Configure VSCode
sudo cp config_files/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
sudo cp config_files/vscode/extensions.json $HOME/.vscode/extensions/extensions.json

# Configure macOS things
pwpolicy -clearaccountpolicies
