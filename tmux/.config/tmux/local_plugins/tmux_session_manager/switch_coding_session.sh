#!/bin/bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  printf 'Error: switch_coding_session.sh requires exactly one base directory argument.\n' >&2
  exit 1
fi

base_dir="$1"

# Expand ~ to $HOME if it exists
base_dir="${base_dir/#\~/$HOME}"

# Get the slot bind keys and help lines for each configured slot.
slot_bind_args=()
help_lines=()
for slot in $(seq 1 10); do
  option_name="@tsm_picker_slot_${slot}_key"
  key="$(tmux show-options -gv "$option_name" 2>/dev/null || true)"
  if [ -n "$key" ]; then
    slot_bind_args+=(--bind "${key}:execute(tmux setenv -g TMUX_SESSION_SLOT_${slot} '{}')+accept")
    help_lines+=("${key}: bind selected directory session to slot ${slot}")
  fi
done

help_file="$(mktemp)"
trap 'rm -f "$help_file"' EXIT
if [ "${#help_lines[@]}" -eq 0 ]; then
  printf 'No slot bind keys configured.\n' > "$help_file"
else
  printf '%s\n' "${help_lines[@]}" > "$help_file"
fi
printf 'ctrl-h: help\n' >> "$help_file"

# Use fzf to select a directory in the base_dir. The --reverse flag is used to
# display the results from the bottom up.
#
# Toggle e temporarily to allow for handling the case where the user cancels
# the fzf prompt.
set +e
choice=$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort | \
  fzf --reverse \
      "${slot_bind_args[@]}" \
      --bind "ctrl-h:preview(cat ${help_file})")
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
