# lsp

This folder enables the lsps supported by this config along with any custom configuration
options for a particular lsp.

Each language server should have its own file named `<language_server>.lua` where the language
server is configured & enabled. Each `<language_server>.lua` file will be automatically loaded
by `init.lua`.

- A language server can be configured with `vim.lsp.config("<language_server>", config_opts)` (optional).
- A language server can be enabled with `vim.lsp.enable("<language_server>")`.

This folder assumes that `nvim-lspconfig` is installed & loaded.
`nvim-lspconfig` provides lsp configuration to `vim.lsp.config` by default so any calls to
`vim.lsp.config("<langauge_server>", config_opts)` are merged into the `nvim-lspconfig` config.

See the following documentation for more information:
- `:h lsp-core`
- `:h lsp-quickstart`
- `neovim/nvim-lspconfig`

## Configured LSPs

| LSP Name          | Program to Install         | Install Method                      |
| ----------------- | -------------------------- | ----------------------------------- |
| copilot           | copilot-language-server    | NPM                                 |
| dartls            | dart                       | Package manager                     |
| eslint            | eslint                     | NPM (Per project)                   |
| lua_ls            | lua-language-server        | Package manager                     |
| rust_analyzer     | rustup                     | Package manager / default installer |
| tsgo (typescript) | typescript-go              | NPM / TS 7                          |
| systemd_lsp       | systemd-lsp                | Package manager / Cargo             |
| gh_actions_ls     | gh-actions-language-server | NPM                                 |
