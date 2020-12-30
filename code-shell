#!/bin/sh
SESSION="vscode`pwd | md5`"
USER=`whoami`
tmux attach-session -d -t $SESSION || /Users/$USER/tmux.dev.sh $SESSION