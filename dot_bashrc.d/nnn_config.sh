# nnn options
export NNN_OPTS="dcQU"
# nnn plugins
export NNN_PLUG='p:-!less -iR $nnn;e:-!sudo -e $nnn*;d:-!git diff;l:-!git log;o:-!nvr --remote $nnn'
# nnn bookmarks
export NNN_BMS="c:$HOME/.config;b:$HOME/.local/bin;s:$HOME/.scripts;d:$HOME/Desktop;p:$HOME/Desktop/Projects;"
export NNN_LOCKER="cmatrix"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_COLORS='7777'
export NNN_TRASH=1

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
