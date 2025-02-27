#
# .zshrc
#
# Description:
# .zshrc is sourced in interactive shells. It should contain commands to set up
# the shell environment, such as custom prompt settings, aliases, and functions.
#

#
# Homebrew configuration
#

if command -v brew &> /dev/null; then
  # Put homebrew executables on the fpath so that oh-my-zsh will auto-pick
  # up completions.
  fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)
else
  echo "Homebrew not found, please install Homebrew."
fi

#
# oh-my-zsh configuration
#

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"

# Plugins
#
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  # Standard plugins
  brew
  docker
  docker-compose
  fzf
  git
  man
  tmux
  zsh-autosuggestions
  # Custom Plugins
  # https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting
)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
else
  echo "oh-my-zsh not found at $ZSH/oh-my-zsh.sh, please install oh-my-zsh."
fi

# zsh-autosuggestions config
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#475258,underline"
# bind ctrl+space to accept current suggestion
bindkey -M viins '^ ' autosuggest-accept

#
# Settings configuration
#

# Set vim-style keybindings
bindkey -v

# ctrl+x-ctrl+e to edit the current command in $EDITOR
bindkey "^X^E" edit-command-line

#
# Aliases & Functions
#

## .profile
alias editprofile='${EDITOR} ~/.profile'
alias reloadprofile='source ~/.profile'

## .zshrc
alias editzshrc='${EDITOR} ~/.zshrc'
alias reloadzshrc='source ~/.zshrc'

## tmux
alias edittmux='${EDITOR} ~/.config/tmux/tmux.conf'
alias reloadtmux='tmux source-file ~/.config/tmux/tmux.conf'

tmux_kill_all_sessions() {
  tmux kill-server
}

## Git
alias editgitconfig='${EDITOR} ~/.gitconfig'

## Neovim
alias editnvim='${EDITOR} ~/.config/nvim/'
alias view_nvim_logs='${EDITOR} ${HOME}/.local/state/nvim/'

## Docker
alias stopDockerContainers='docker stop $(docker ps -a -q)'
alias removeDockerContainers='docker rm $(docker ps -a -q)'
alias stopDpcContainer='docker stop $(docker ps | grep doc_plat_client:latest-release | awk "{print $1}")'

## Dart
alias ddev='dart run dart_dev'
alias df='ddev format'
alias dt='ddev test'
alias da='ddev analyze'
alias pubcleanlock='git ls-files pubspec.lock --error-unmatch &>/dev/null && echo "Not removing pubspec.lock - it is tracked" || (rm pubspec.lock && echo "Removed pubspec.lock")'
alias pubclean='rm -r .pub/ && echo "Removed .pub/"; rm -r packages/ && echo "Removed packages/"; rm .packages && echo "Removed .packages"; pubcleanlock'

dt_pal() {
  ddev test -n $1 --test-args="--pause-after-load"
}

## Conversion

# Usage: 
#   $ mov_to_mp4 "somePath/to/fileToConvert.mov"
#
# Assumes input ends in .mov
# Assumes ffmpeg is installed - `brew install ffmpeg`
mov_to_mp4() {
  # -crf <number> indicates the compression. 0 is lossless, 18 looks lossless but really isn't
  # %.* returns the variable with the content after & including the last period removed
  ffmpeg -i $1 -crf 18 "${1%.*}.mp4"
}

# Usage:
#   $ mov_to_gif "somePath/to/fileToConvert.mov"
#
#  Assumes input ends in .mov
#  Assumes ffmpeg is installed - `brew install ffmpeg`
#
# Source: https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality
mov_to_gif() {
	args=(
		-i $1
		# Output gif has an fps of 10 with a width of 1280 & automatic height (-1)
		# lanczos is the scaling algorithm used
		# split allows everything to happen in one command. Avoids having to create temporary files
		# palettegen & palette use generate a custom palette from input file
		-vf "fps=10,scale=1280:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"
		# Loop infinitely
		-loop 0
		"${1%.*}.gif"
	)
	ffmpeg "${args[@]}"
}

#
# Local Configuration
#

if [ -f ~/.config/zsh_local/.zshrc_additions.zsh ]; then
  source ~/.config/zsh_local/.zshrc_additions.zsh
fi

#
# Commands to run after config
#

# Setup zsh completions & keybindings
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
else
  echo "fzf not found, please install fzf."
fi

# Setup asdf
source $HOME/.asdf/asdf.sh
