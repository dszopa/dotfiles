--- See [vscode-eslint](https://github.com/microsoft/vscode-eslint/blob/55871979d7af184bf09af491b6ea35ebd56822cf/server/src/eslintServer.ts#L216-L229) for configuration options.
vim.lsp.config("eslint", {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
    "astro",
    "htmlangular",
    "yaml",
    "json",
    "jsonc",
    "markdown",
    "toml",
    "xml",
    "html",
    "css",
    "scss",
    "pcss",
  },
})

vim.lsp.enable("eslint")
