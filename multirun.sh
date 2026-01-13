SESSIONEXISTS=$(tmux list-sessions | grep "multirun")
hosts=(
    192.168.7.177
    192.168.7.166
    192.168.7.147
)
if [ "$SESSIONEXISTS" != "" ]
then
    tmux kill-session -t "multirun"
fi
tmux new-session -d -s "multirun"

# Name first Pane and start zsh
window="multirun:0"
tmux split-window -h
tmux split-window -h
pane0="multirun.0"
pane1="multirun.1"
pane2="multirun.2"
tmux select-layout even-horizontal

if [[ "$1" == "deploy" ]]; then
    tmux rename-window -t 0 'deployment'
    tmux send-keys -t "$pane0" C-z "clear" Enter "./management-scripts/remote-deploy.sh 0 ${hosts[0]} ${pane0}" Enter
    tmux send-keys -t "$pane1" C-z "clear" Enter "./management-scripts/remote-deploy.sh 1 ${hosts[1]} ${pane1}" Enter
    tmux send-keys -t "$pane2" C-z "clear" Enter "./management-scripts/remote-deploy.sh 2 ${hosts[2]} ${pane2}" Enter
elif [[ "$1" == "test" ]]; then
    tmux send-keys -t "$pane0" C-z "clear" Enter "./management-scripts/test.sh ${hosts[0]}" Enter
    tmux send-keys -t "$pane1" C-z "clear" Enter "./management-scripts/test.sh ${hosts[1]}" Enter
    tmux send-keys -t "$pane2" C-z "clear" Enter "./management-scripts/test.sh ${hosts[2]}" Enter
elif [[ "$1" == "cmd" ]]; then
    tmux send-keys -t "$pane0" C-z "clear" Enter "ssh ${hosts[0]} '$2'" Enter
    tmux send-keys -t "$pane1" C-z "clear" Enter "ssh ${hosts[1]} '$2'" Enter
    tmux send-keys -t "$pane2" C-z "clear" Enter "ssh ${hosts[2]} '$2'" Enter
else
    return 1
fi

tmux attach-session -t multirun:0
echo "error above can be ignored"