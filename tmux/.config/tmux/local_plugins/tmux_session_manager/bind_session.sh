#!/bin/bash

#
# Usage: bind_session.sh <tmux_env_variable> <session_match> <query>>
#
# This script is used to bind a tmux session to a tmux environment variable.
# If there is no matching session, a new session will be created with the query
# as the session name and used for the binding.
#

tmux_env_variable=$1
session_match=$2
query=$3
session_to_bind=$session_match

# If there was no matching session, create one to match the provided query.
if [ -z "$session_match" ]; then
  session_to_bind=$query
  tmux new-session -s "$session_to_bind" -d
  tmux switch-client -t "$session_to_bind"
fi

tmux setenv -g "$tmux_env_variable" "$session_to_bind" 

