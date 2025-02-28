#!/bin/bash

#
# Usage: tmux_session_manager.sh
#
# This script is used to manage tmux sessions. It allows for easy creation,
# binding, switching to, and killing of tmux sessions.
#

echo_help="echo '\
ctrl-u: bind to u - creates session from query if no match\n\
ctrl-i: bind to i - creates session from query if no match\n\
ctrl-o: bind to o - creates session from query if no match\n\
ctrl-p: bind to p - creates session from query if no match\n\
ctrl-x: kill session\n\
ctrl-h: help\n\
'"

fzf_input="tmux list-sessions | sed -E 's/:.*//'"
choice=$(eval "$fzf_input" |\
  fzf --reverse\
      --preview 'tmux capture-pane -pet {}'\
      --preview-window=down,80%\
      --print-query\
      --bind "ctrl-u:execute(~/.config/tmux/local_plugins/tmux_session_manager/bind_session.sh TMUX_SESSION_U {} {q})+accept"\
      --bind "ctrl-i:execute(~/.config/tmux/local_plugins/tmux_session_manager/bind_session.sh TMUX_SESSION_I {} {q})+accept"\
      --bind "ctrl-o:execute(~/.config/tmux/local_plugins/tmux_session_manager/bind_session.sh TMUX_SESSION_O {} {q})+accept"\
      --bind "ctrl-p:execute(~/.config/tmux/local_plugins/tmux_session_manager/bind_session.sh TMUX_SESSION_P {} {q})+accept"\
      --bind "ctrl-x:execute(tmux kill-session -t '{}')+reload($fzf_input)"\
      --bind "ctrl-h:preview($echo_help)"\
  )

exit_code=$?
if [[ $exit_code -eq 1 ]]; then # if no match was found
  tmux new-session -s "$choice" -d
  tmux switch-client -t "$choice"
elif [[ $exit_code -eq 0 ]]; then
  # tail -n 1 is to get the 2nd line of output because the first line will be
  # the query since we're passing --print-query.
  choice=$(echo "$choice" | tail -n 1)
  tmux switch-client -t "$choice"
fi

exit 0


