#!/bin/bash

#
# Environment variables
#

# Environment variables for tmux session manager
tmux set-environment -g TMUX_SESSION_U "primary"
tmux set-environment -g TMUX_SESSION_I "primary"
tmux set-environment -g TMUX_SESSION_O "primary"
tmux set-environment -g TMUX_SESSION_P "primary"

#
# Keybindings
#

# Switch between sessions with <prefix><key>
tmux bind-key u run-shell 'tmux switch-client -t "${TMUX_SESSION_U}"'
tmux bind-key i run-shell 'tmux switch-client -t "${TMUX_SESSION_I}"'
tmux bind-key o run-shell 'tmux switch-client -t "${TMUX_SESSION_O}"'
tmux bind-key p run-shell 'tmux switch-client -t "${TMUX_SESSION_P}"'

# Launch manager with <prefix>s
tmux bind-key s display-popup -E -w '100%' -h '100%' ~/.config/tmux/local_plugins/tmux_session_manager/tmux_session_manager.sh
