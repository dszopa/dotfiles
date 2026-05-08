# Neovim Config

This config is organized by responsibility:

- `init.lua` wires core modules and shared globals.
- `lua/` contains reusable Lua modules (core options, keymaps, autocmds, and LSP loading).
- `plugin/` contains one file per plugin (install + setup + plugin-specific keymaps).

## External Dependencies

- `stylua` for formatting Lua files.
- `selene` for linting Lua files.
- `tree-sitter-cli` for treesitter support. Primarily for highlighting languages that don't have built in support.
- Various language servers in `lua/lsp/<server>.lua` files. See those files for specifics.
- `lazygit` for lazygit integration.

## Load order

1. `init.lua` runs first.
2. `init.lua` requires the core modules in this order:
   - `opts`
   - `settings`
   - `lsp`
   - `keybinds`
   - `autocmds`
3. Neovim then sources files in `plugin/`.

## Directory structure

```text
.config/nvim/
├── init.lua
├── lua/
│   ├── opts.lua
│   ├── settings.lua
│   ├── keybinds.lua
│   ├── autocmds.lua
│   └── lsp/
│       └── <server>.lua
├── plugin/
│   └── <plugin>.lua
├── nvim-pack-lock.json
├── selene.toml
└── stylua.toml
```

## Module responsibilities

- `init.lua`
  - Requires all top-level core modules.
- `lua/opts.lua`
  - Editor options (`vim.opt`) and global editor behavior.
- `lua/settings.lua`
  - General runtime settings that are not plugin-specific.
- `lua/keybinds.lua`
  - Non-plugin keymaps and general LSP keymaps.
- `lua/autocmds.lua`
  - Global autocommands.
- `lua/lsp/init.lua`
  - Discovers and loads all `lua/lsp/*.lua` files (except `init.lua`), sorted by filename.
- `lua/lsp/<server>.lua`
  - Per-language-server configuration and enablement.
- `plugin/<plugin>.lua`
  - Plugin declaration via `vim.pack.add(...)`, setup, and plugin-local keymaps.

## Notes

- `require("...")` resolves local modules from the `lua/` directory in this config.
- `plugin/README.md` documents plugin-file conventions.
- `lua/lsp/README.md` documents LSP conventions.
