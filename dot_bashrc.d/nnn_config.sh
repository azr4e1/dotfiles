# nnn options
export NNN_OPTS="dcQUi"
# nnn plugins
export NNN_PLUG='p:preview-tui;e:-!sudo -e $nnn*;g:-!git log;j:autojump;m:mocq;l:moc-lyrics;f:finder'
# nnn bookmarks
export NNN_BMS="c:$HOME/.config;b:$HOME/.local/bin;s:$HOME/.scripts;d:$HOME/Desktop;p:$HOME/Desktop/Projects;"
export NNN_LOCKER="btop"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_COLORS='7777'
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_TRASH=1
export NNN_TERMINAL="alacritty"
export NNN_OPENER="$HOME/.config/nnn/plugins/nuke"
export NNN_PAGER="$PAGER"
export NNN_ICONLOOKUP=1
export NNN_PREVIEWIMGPROG="catimg"
export GUI=1
export BIN=1

# to cd on quit
n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}
