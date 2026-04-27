vim.pack.add({
  {
    src = Repo.gh("saghen/blink.cmp"),
    version = vim.version.range("1"),
  },
})

require("blink.cmp").setup({
  signature = { enable = true },
})
