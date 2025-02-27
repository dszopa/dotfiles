#
# .zprofile
#
# Description:
# .zprofile is sourced by zsh at login time. It is not meant to be sourced by
# other scripts, so it should contain commands that should be executed only at
# login time. It is usually used to set environment variables and run commands
# that should be run only once.
#

# Bump the maximum number of open file descriptors.
ulimit -n 8192

# Source Homebrew environment
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew not found, please install Homebrew."
fi

export SHARED=/Users/Shared/

# Golang
export GOPATH=$HOME/Documents/coding/go
export PATH="$PATH":"$GOPATH/bin"

# Dart
# Support running installed dart packages
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Flutter
export FLUTTER_PATH="$SHARED/flutter/bin"
export PATH="$PATH":"$FLUTTER_PATH"

# XDG Config
#
# XDG_CONFIG is a standard for storing user configuration files. It is used by
# many programs to determine where to store user-specific configuration files.
export XDG_CONFIG_HOME="$HOME/.config"

# Make
# Use gmake as make
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vi' # Remote
 else
   export EDITOR='nvim' # Local
 fi

# Get rid of the 0.4 second delay when hitting ESC
export KEYTIMEOUT=1

# Local Configuration
if [ -f ~/.config/zsh_local/.zprofile_additions.zsh ]; then
  source ~/.config/zsh_local/.zprofile_additions.zsh
fi
