vim.pack.add({
  Repo.gh("akinsho/bufferline.nvim"),
})

require("bufferline").setup({
  options = {
    mode = "tabs",
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
  },
})
