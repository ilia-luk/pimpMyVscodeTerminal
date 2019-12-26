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

# Split window and divide main-vertical.
tmux split-window -v -p 33 -t $SESSION
tmux select-pane -t $SESSION:1.1
tmux split-window -v -p 33 -t $SESSION
tmux send-keys -t $SESSION:1.3 'htop' C-m

# Setup a console window
tmux new-window -k -n console -t $SESSION:2

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