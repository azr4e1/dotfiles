# Functions
#####################################################################

# quickly edit scripts
function myscripts {
    local script=$( find $HOME/.scripts -type f ! -iregex ".*\.git.*" | fzf-tmux --preview="cat {}")
    [ -n "$script" ] && $EDITOR "$script"
}

# quickly edit configuration files
function config {
    local conf=$( find $HOME/.config -type f | fzf-tmux )
    [ -n "$conf" ] && $EDITOR "$conf"
}

# returns most used commands in recent history
function frequent_commands {
    history | awk '{if ($2 == "sudo") print $3; else print $2}' | awk 'FS="|" {print $1}' | sort | uniq -c | sort -n | tail -15
}

function w3m {
    if [ -z "$@" ]; then
        command w3m https://lite.duckduckgo.com/lite/
    else
        command w3m "$@"
    fi
}

# create a dir and enter it
function ncd {
    local newdir="$1"
    # create the dir if it does not exist
    [ ! -d "$newdir" ] && mkdir -p "$newdir"
    # enter it
    cd "$newdir"
}

# to cd on quit
function n {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@" 2>> ~/.nnn.log

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# function git_branch {
#     branch=$( git branch --show-current 2>/dev/null | sed -E 's/(.*)/\ \1/' )
#     echo "$branch"
# }

# Extracts any archive(s) (if unp isn't installed)
extract () {
	for archive in $*; do
		if [ -f $archive ] ; then
			case $archive in
				*.tar.bz2)   tar xvjf $archive    ;;
				*.tar.gz)    tar xvzf $archive    ;;
				*.bz2)       bunzip2 $archive     ;;
				*.rar)       rar x $archive       ;;
				*.gz)        gunzip $archive      ;;
				*.tar)       tar xvf $archive     ;;
				*.tbz2)      tar xvjf $archive    ;;
				*.tgz)       tar xvzf $archive    ;;
				*.zip)       unzip $archive       ;;
				*.Z)         uncompress $archive  ;;
				*.7z)        7z x $archive        ;;
				*)           echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# choose tmux session
tmux-sessionizer () {
	case $1 in
		switch) session=$(tmux list-sessions | grep -v "^$(tmux display-message -p '#S'):" | fzf-tmux | awk -F ":" '{print $1}')
                [ -z "$session" ] && return
                tmux switch-client -t "$session";;
		rename) session=$(tmux list-sessions | fzf-tmux | awk -F ":" '{print $1}')
                [ -z "$session" ] && return
								read -p "New name for '$session': " name
                [ -z "$name" ] && return
                tmux  rename-session -t "$session" $name;;
		new) read -p "New session name: " session
				 [ -z "$session" ] && tmux new-session -d && return
				 tmux new-session -d -s "$session" && tmux switch-client -t "$session";;
		kill) session=$(tmux list-sessions | grep -v "^$(tmux display-message -p '#S'):" | fzf-tmux | awk -F ":" '{print $1}')
				 [ -z "$session" ] && return
                 tmux kill-session -t "$session";;
		*) echo "Unknown";;
	esac
}
