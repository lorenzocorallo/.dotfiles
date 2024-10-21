if [[ -f "$HOME/.profile" ]]; then
    source $HOME/.profile
fi

. "$HOME/.cargo/env"

typeset -U path
path=(~/.local/scripts /usr/local/texlive/2022/bin/x86_64-linux $path)

typeset -u manpath
manpath=(/usr/local/texlive/2022/texmf-dist/doc/man $manpath)

typeset -u infopath
infopath=(/usr/local/texlive/2022/texmf-dist/doc/info $infopath)

if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="scripts,tmux,nvim,zsh,i3"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

# Setting the LG_WEBOS_TV_SDK_HOME variable to the parent directory of CLI
export LG_WEBOS_TV_SDK_HOME="/opt/webOS_TV_SDK"
 
if [ -d "$LG_WEBOS_TV_SDK_HOME/CLI/bin" ]; then
  # Setting the WEBOS_CLI_TV variable to the bin directory of CLI
  export WEBOS_CLI_TV="$LG_WEBOS_TV_SDK_HOME/CLI/bin"
  # Adding the bin directory of CLI to the PATH variable
  export PATH="$PATH:$WEBOS_CLI_TV"
fi

if [ -d "/opt/Mullvad VPN/" ]; then
  # Adding the bin directory of mullvad to the PATH variable
  export PATH="$PATH:/opt/Mullvad VPN/"
fi

if [ -d "$HOME/Documents/latex/templates/math_1" ]; then
    export MATH_1_TEX="$HOME/Documents/latex/templates/math_1"
fi

if [[ -f "$HOME/.env" ]]; then
    source $HOME/.env
fi

export GOLANG_BIN="/usr/local/go/bin"
if [[ -d "$GOLANG_BIN" ]]; then
    export PATH="$PATH:$GOLANG_BIN"
fi

if [[ -d "/opt/nvim-linux64/bin/" ]]; then
    export PATH="$PATH:/opt/nvim-linux64/bin/"
fi
