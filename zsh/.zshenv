. "$HOME/.cargo/env"

typeset -U path
path=(~/.local/scripts/ /usr/local/texlive/2022/bin/x86_64-linux $path)

typeset -u manpath
manpath=(/usr/local/texlive/2022/texmf-dist/doc/man $manpath)

typeset -u infopath
infopath=(/usr/local/texlive/2022/texmf-dist/doc/info $infopath)

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="scripts,tmux,nvim,zsh"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi
