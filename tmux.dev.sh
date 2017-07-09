#!/bin/sh

# ----------------------
# Panes automator
# -----------------------

SESSION=$1

# Clear rbenv variables before starting tmux
unset RBENV_VERSION
unset RBENV_DIR

# Start server
tmux start-server;

# Create Development session and the first window.
TMUX= tmux new-session -s $SESSION -n process -d

# Navigate to root folder
tmux send-keys -t $SESSION 'cd ~/' C-m

# pane:1.1
tmux send-keys -t $SESSION 'node -v' C-m

# Split window and divide main-horizontal.
tmux split-window -h -t $SESSION

# Select new pane
tmux select-layout -t $SESSION main-vertical

# Navigate to root folder on splitted screen
tmux send-keys -t $SESSION:1.2 'cd ~/' C-m

# pane:1.2
tmux send-keys -t $SESSION:1.2 'node -v' C-m

# Setup a console window
tmux new-window -k -n console -t $SESSION:2

# Setup a htop
tmux new-window -k -n htop -t $SESSION:3
tmux send-keys -t $SESSION:3 'htop' C-m

# Select main window and pane.
tmux select-window -t $SESSION:1
tmux select-pane -t $SESSION:1.1

if [ -z ${TMUX} ]; then
    # Attach to session
    tmux -u attach-session -t $SESSION
else
    # Attach to session
    tmux -u switch-client -t $SESSION
fi