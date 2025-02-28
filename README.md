# dotfiles

My unix-based-system dotfiles

## Installation

```bash
# Clone the repository into your home directory.
git clone https://github.com/dszopa/dotfiles.git ~/dotfiles/

# Change directory to the dotfiles directory.
cd ~/dotfiles/

# Install dotfiles using stow.
## All dotfiles
stow */
## Specific dotfiles (where package is the name of the directory)
stow <package>
```

## Stow

```bash
# Preview modifications to be made by stow.
stow --simulate --verbose */
# OR
stow --simulate --verbose <package>
```

```bash
# Explicitly apply changes with stow regardless of conflicts.
stow --adopt */
# OR
stow --adopt <package>
```

## Homebrew Packages

Install [Homebrew](https://github.com/Homebrew/brew)

```bash
# Leaving a machine
brew leaves > leaves.txt

# Fresh installation
xargs brew install < leaves.txt
```

Rather than including everything in my leaves.txt, I prefer to explicitly
add / remove packages as needed.

## Tmux

Install tpm

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

then start a new tmux session and run prefix + I (prefix will be bound to ctrl + b)


## Inspired by

- https://github.com/charliestrawn/.dotfiles
