#!/bin/bash

#
# Usage: tmux_session_manager.sh
#
# This script is used to manage tmux sessions. It allows for easy creation,
# binding, switching to, and killing of tmux sessions.
#

bind_script="$HOME/.config/tmux/local_plugins/tmux_session_manager/bind_session.sh"

# Get the slot bind keys and help lines for each configured slot.
slot_bind_args=()
help_lines=()
for slot in $(seq 1 10); do
  option_name="@tsm_picker_slot_${slot}_key"
  key="$(tmux show-options -gv "$option_name" 2>/dev/null || true)"
  if [ -n "$key" ]; then
    slot_bind_args+=(--bind "${key}:execute(${bind_script} ${slot} {} {q})+accept")
    help_lines+=("${key}: bind to slot ${slot} - creates session from query if no match")
  fi
done

# Create a temporary file to hold the help text for the fzf preview. This file
# will be automatically deleted when the script exits due to the trap command.
help_file="$(mktemp)"
trap 'rm -f "$help_file"' EXIT
if [ "${#help_lines[@]}" -eq 0 ]; then
  printf 'No slot bind keys configured.\n' > "$help_file"
else
  printf '%s\n' "${help_lines[@]}" > "$help_file"
fi
printf 'ctrl-x: kill session\n' >> "$help_file"
printf 'ctrl-h: help\n' >> "$help_file"

choice=$(tmux list-sessions | sed -E 's/:.*//' | \
  fzf --reverse \
      --preview 'tmux capture-pane -pet {}' \
      --preview-window=down,80% \
      --print-query \
      "${slot_bind_args[@]}" \
      --bind "ctrl-x:execute(tmux kill-session -t '{}')+reload(tmux list-sessions | sed -E 's/:.*//')" \
      --bind "ctrl-h:preview(cat ${help_file})")

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
