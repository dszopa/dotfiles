#!/bin/bash

#
# Usage: `set-option -g status-right "#(~/.config/tmux/get_status_right.sh)"`
#
# This command is meant to be fed into the tmux status-right option. The
# $DEBUG variable can be set to "true" to print out the values of the variables.
#

CURRENT_SESSION=$(tmux display-message -p "#S")
eval "$(tmux show-environment -g "TMUX_SESSION_U")"
eval "$(tmux show-environment -g "TMUX_SESSION_I")"
eval "$(tmux show-environment -g "TMUX_SESSION_O")"
eval "$(tmux show-environment -g "TMUX_SESSION_P")"

# if DEBUG=true
if [ "$DEBUG" == "true" ]; then
    echo "Current session: $CURRENT_SESSION"
    echo "TMUX_SESSION_U: $TMUX_SESSION_U"
    echo "TMUX_SESSION_I: $TMUX_SESSION_I"
    echo "TMUX_SESSION_O: $TMUX_SESSION_O"
    echo "TMUX_SESSION_P: $TMUX_SESSION_P"
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

SESSION_U=$(get_session_segment "u" "$TMUX_SESSION_U")
SESSION_I=$(get_session_segment "i" "$TMUX_SESSION_I")
SESSION_O=$(get_session_segment "o" "$TMUX_SESSION_O")
SESSION_P=$(get_session_segment "p" "$TMUX_SESSION_P")

if [ "$DEBUG" == "true" ]; then
    echo "SESSION_U: $SESSION_U"
    echo "SESSION_I: $SESSION_I"
    echo "SESSION_O: $SESSION_O"
    echo "SESSION_P: $SESSION_P"
fi

echo "#[align=absolute-centre] $SESSION_U $SESSION_I $SESSION_O $SESSION_P"
