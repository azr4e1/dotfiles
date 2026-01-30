### Aliases

# enable colors for ls
alias ls='ls --color=auto'
#enable colors for grep
alias grep='grep --color=auto'
# shortcut for ls -l
alias ll="ls -l"
alias l="ls -la"
# quickly go to .local/bin
alias cdb="cd $HOME/.local/bin"
# quickly go to config
alias cdc="cd $HOME/.config"
# ask if you want to delete something
alias trash="trash-put"
# alias rm="rm -iv"
alias mv="mv -v"
alias cp="cp -v"
# alias for info
alias info="info --vi-keys"
# weather
alias weather="curl wttr.in"
alias myip="curl ipinfo.io/json"
# compile latex continuously
alias comp_lat="latexmk -pdf -pvc -view=none"

alias o="xdg-open"
alias open="xdg-open"
# to inhibit gnome suspension

# remote mount
alias remote-mount="sshfs root@192.168.197.5:/ /home/ld/Desktop/Mount"
alias remote-umount="fusermount -u /home/ld/Desktop/Mount/"
alias cdm="cd /home/ld/Desktop/Mount/"

# keep awake
# alias docker=podman

# taskwarrior
alias t=task
alias ts="task sync"
alias to="task +OVERDUE"
alias tt="task +TODAY"
alias tm="task +TOMORROW"
alias tf="task due.after:today"
alias tb="task burndown.daily"
alias ta="task add"
alias tdo="task done"
alias tc="task calendar"
alias tdl="task delete"
alias tmod="task modify"
alias todo="task due.before:today or due:today or due:tomorrow"
alias tcl="task end.after:yesterday completed"
alias tclw="task end.after:monday-1wk completed"
alias tch="task +Chores due.before:today or due:today"
complete -o nospace -F _task t
complete -o nospace -F _task tb
complete -o nospace -F _task ta
complete -o nospace -F _task tdo
complete -o nospace -F _task tmod

function task-alias {
    echo '
t             task
ts            task sync
to            task +OVERDUE
tt            task +TODAY
tm            task +TOMORROW
tf            task due.after:today
tb            task burndown.daily
ta            task add
tdo           task done
tc            task calendar
tdl           task delete
tmod          task modify
tch           task +Chores due.before:today or due:today
'
}
# conda
alias cna="conda activate"
alias cnd="conda deactivate"
alias c="conda"

alias lg="lazygit"

alias TODO="grep -n --exclude-dir='.git' -r TODO"

alias np="notepy --vault '/home/ld/Desktop/Knowledge' --author 'Lorenzo Drumond' --autocommit"

alias x="helix"
alias hx="helix"
alias nv="nvim"
alias v="nvim"

alias huawei-start-tunnel="ssh -N -L 5900:localhost:5900 -f alia@10.87.191.5"
alias huawei-stop-tunnel="ps aux | grep 'ssh -N -L 5900:localhost:5900 -f alia@10.87.191.5' | awk '{print \$2}' | head -n1 | xargs kill"

alias music="ncmpcpp"

alias apti="appunti --vault '/home/ld/Desktop/Knowledge' --author 'Lorenzo Drumond' --autocommit"

alias prompt_install="curl -sS https://starship.rs/install.sh | sh"
