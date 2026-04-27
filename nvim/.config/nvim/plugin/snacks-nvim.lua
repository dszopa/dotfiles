vim.pack.add({
  Repo.gh("folke/snacks.nvim"),
})

require("snacks").setup({
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  indent = { enabled = true },
})
