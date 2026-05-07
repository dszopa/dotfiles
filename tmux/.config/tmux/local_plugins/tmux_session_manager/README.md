# tmux_session_manager

Local tmux session manager plugin with slot-based session switching and fzf pickers.

## Dependencies

- `fzf`

## What it does

- Initializes 10 global tmux slot variables: `TMUX_SESSION_SLOT_1` through `TMUX_SESSION_SLOT_10`.
- Lets you quickly switch to a slot via `tsm slot-N`.
- Provides an fzf popup to manage sessions (`tsm open`):
  - switch to existing sessions,
  - create a new session from query text,
  - bind a selected/query session to a slot,
  - kill sessions.
- Provides a directory picker (`tsm pick-dir <path>`) that:
  - picks a directory under `<path>`,
  - creates a session if needed (named after directory basename),
  - switches to that session,
  - optionally binds that session to a slot from inside fzf.

## Files

- `plugin.tmux`
  - Setup only. Initializes `TMUX_SESSION_SLOT_1..10` to `unset`.
- `tsm`
  - Main command wrapper.
  - Commands:
    - `slot-1` ... `slot-10`
    - `open`
    - `pick-dir <path>`
- `tmux_session_manager.sh`
  - Session popup UI (fzf) for session list, create/switch, slot binding, kill.
- `bind_session.sh`
  - Helper used by `tmux_session_manager.sh` to bind/create slot sessions.
- `pick_directory_create_and_switch_to_session.sh`
  - Directory popup UI (fzf) used by `tsm pick-dir <path>`.

## Configurable slot picker keys

Both fzf pickers read tmux options to decide which keys bind to which slots:

- `@tsm_picker_slot_1_key`
- `@tsm_picker_slot_2_key`
- ...
- `@tsm_picker_slot_10_key`

If a key option is unset/empty, no fzf bind is added for that slot.

Example:

```tmux
set -g @tsm_picker_slot_1_key "ctrl-u"
set -g @tsm_picker_slot_2_key "ctrl-i"
set -g @tsm_picker_slot_3_key "ctrl-o"
set -g @tsm_picker_slot_4_key "ctrl-p"
```

## Typical tmux.conf wiring

```tmux
# Load plugin setup
run '~/.config/tmux/local_plugins/tmux_session_manager/plugin.tmux'

# Slot switching
bind-key u run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm slot-1'
bind-key i run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm slot-2'
bind-key o run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm slot-3'
bind-key p run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm slot-4'

# Session picker popup
bind-key s run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm open'

# Directory picker popup
bind-key S run-shell '~/.config/tmux/local_plugins/tmux_session_manager/tsm pick-dir ~/Documents/coding/'
```

## Notes

- `tsm slot-N` exits with an error if slot `N` is `unset`.
- `pick-dir` and `open` handle fzf cancel/no-selection gracefully (exit without changes).
- Session names in `pick-dir` are the selected directory basenames.
