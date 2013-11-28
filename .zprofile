if [  -z $TMUX ]; then
    if $(tmux has-session 2> /dev/null); then
        tmux attach
    else
        tmux
    fi
fi
