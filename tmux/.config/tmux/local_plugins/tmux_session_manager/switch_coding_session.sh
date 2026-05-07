#!/bin/bash

set -euo pipefail

base_dir="$(tmux show-options -gv @coding_base_dir 2>/dev/null || true)"
if [ -z "$base_dir" ]; then
  printf 'Error: tmux option @coding_base_dir is unset.\n' >&2
  exit 1
fi

# Expand ~ to $HOME if it exists
base_dir="${base_dir/#\~/$HOME}"

# Use fzf to select a directory in the base_dir. The --reverse flag is used to
# display the results from the bottom up.
#
# Toggle e temporarily to allow for handling the case where the user cancels
# the fzf prompt.
set +e
choice=$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort | fzf --reverse)
exit_code=$?
set -e

if [ "$exit_code" -ne 0 ] || [ -z "${choice:-}" ]; then
  exit 0
fi

session_name="$choice"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -c "$base_dir/$choice"
fi

tmux switch-client -t "$session_name"
