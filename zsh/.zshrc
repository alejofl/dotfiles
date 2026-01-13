if [ -d "$HOME/.zsh" ]; then
    source $HOME/.zsh/functions.sh
    source $HOME/.zsh/prompt.sh
    source $HOME/.zsh/path.sh
fi

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LSCOLORS=Gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias grep='grep --color=auto'

# Clear the screen
printf '\33c\e[3J'
