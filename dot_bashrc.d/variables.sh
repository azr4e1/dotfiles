# Variables
#####################################################################

# Ansi color code variables
export black="\[\033[30m\]"
export cyan="\[\033[36m\]"
export purple="\[\033[35m\]"
export yellow="\[\033[33m\]"
export red="\e[0;91m"
export blue="\e[0;94m"
export expand_bg="\e[K"
export blue_bg="\e[0;104m${expand_bg}"
export red_bg="\e[0;101m${expand_bg}"
export green_bg="\e[0;102m${expand_bg}"
export green="\e[0;92m"
export white="\e[0;97m"
export bold="\e[1m"
export uline="\e[4m"
export reset="\e[0m"

# set vim as editor
export EDITOR='helix'
export VISUAL="$EDITOR"
export BROWSER="firefox"
export PAGER="bat --style=plain,rule"

export MOZ_ENABLE_WAYLAND=1

# set gpg configuration file
export GNUPGHOME=$HOME/.config/gpg

# set user main email
export EMAIL="drumondlorenzo@posteo.net"

# You should always add the following lines to your .bashrc or whatever initialization file is used for all shell invocations:
GPG_TTY=$(tty)
# It is important that this environment variable always reflects the output of the tty command.  For W32 systems this option is not required.
export GPG_TTY

# fzf by default starts in fullscreen mode, but you can make it start below the cursor with --height option.
# Also, check out --reverse and --layout options if you prefer "top-down" layout instead of the default "bottom-up" layout.
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export XDG_DATA_HOME=$HOME/.local/share

# for calibre appearnace
# export CALIBRE_USE_DARK_PALETTE=1
# export CALIBRE_USE_SYSTEM_THEME=1

# prompt
# export PS1='[\u@\h \W$(git_branch)]\$ '

# qt settings
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_QPA_PLATFORM=wayland

# nltk location
export NLTK_DATA="$HOME/.local/share/nltk_data"

# nvim listens to this socket
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# gPodder
# export GPODDER_HOME=~/.config/gpodder/
# export GPODDER_DOWNLOAD_DIR=~/Desktop/Podcasts/

export GOPATH="$HOME/.go"
export AIRFLOW_HOME="$HOME/.local/share/airflow"
export DOCKER_HOST="unix://$(podman info --format '{{.Host.RemoteSocket.Path}}')"
