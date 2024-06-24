# Homebrew formulae
brew install ffmpeg
brew install jaq
brew install maven
brew install postgresql@15
brew install tree
brew install watch

# Python
brew install python@3.11
sudo sh -c 'echo "/opt/homebrew/opt/python@3.11/libexec/bin" > /etc/paths.d/02-python'

# Node
nvm install --lts

# Git Co-Author
git clone https://github.com/alejofl/git-coauthor.git $HOME/.git-coauthor
sudo sh -c 'echo "$HOME/.git-coauthor" > /etc/paths.d/100-git-coauthor'

# LaTeX
brew install --cask mactex-no-gui
sudo sh -c 'echo "/Library/TeX/texbin" > /etc/paths.d/100-tex'
