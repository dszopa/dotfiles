#!/bin/bash

#
# Usage: `set-option -g status-right "#(~/.config/tmux/get_status_right.sh)"`
#
# This command is meant to be fed into the tmux status-right option. The
# $DEBUG variable can be set to "true" to print out the values of the variables.
#

CURRENT_SESSION=$(tmux display-message -p "#S")
eval "$(tmux show-environment -g "TMUX_SESSION_SLOT_1")"
eval "$(tmux show-environment -g "TMUX_SESSION_SLOT_2")"
eval "$(tmux show-environment -g "TMUX_SESSION_SLOT_3")"
eval "$(tmux show-environment -g "TMUX_SESSION_SLOT_4")"

# if DEBUG=true
if [ "$DEBUG" == "true" ]; then
    echo "Current session: $CURRENT_SESSION"
    echo "TMUX_SESSION_SLOT_1: $TMUX_SESSION_SLOT_1"
    echo "TMUX_SESSION_SLOT_2: $TMUX_SESSION_SLOT_2"
    echo "TMUX_SESSION_SLOT_3: $TMUX_SESSION_SLOT_3"
    echo "TMUX_SESSION_SLOT_4: $TMUX_SESSION_SLOT_4"
fi

match_color="green"
no_match_color="blue"

function get_session_segment() {
  session_letter=$1
  session_name=$2

  if [ "$CURRENT_SESSION" == "$session_name" ]; then
    echo "#[default,fg=$match_color]#[bg=$match_color,fg=black,bold]$session_letter - $session_name#[default,fg=$match_color]"
  else
    echo "#[default,fg=$no_match_color]#[bg=$no_match_color,fg=black,bold]$session_letter - $session_name#[default,fg=$no_match_color]"
  fi
}

SESSION_1=$(get_session_segment "u" "$TMUX_SESSION_SLOT_1")
SESSION_2=$(get_session_segment "i" "$TMUX_SESSION_SLOT_2")
SESSION_3=$(get_session_segment "o" "$TMUX_SESSION_SLOT_3")
SESSION_4=$(get_session_segment "p" "$TMUX_SESSION_SLOT_4")

if [ "$DEBUG" == "true" ]; then
    echo "SESSION_1: $SESSION_1"
    echo "SESSION_2: $SESSION_2"
    echo "SESSION_3: $SESSION_3"
    echo "SESSION_4: $SESSION_4"
fi

echo "#[align=absolute-centre] $SESSION_1 $SESSION_2 $SESSION_3 $SESSION_4"
