if [ -d "$HOME/.zsh" ]; then
    source $HOME/.zsh/functions.sh
    source $HOME/.zsh/prompt.sh
fi

export LSCOLORS=Gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias grep='grep --color=auto'

# Clear the screen
printf '\33c\e[3J'
