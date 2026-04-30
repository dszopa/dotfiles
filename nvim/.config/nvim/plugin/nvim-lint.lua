vim.pack.add({
  Repo.gh("mfussenegger/nvim-lint"),
})

require("lint").linters_by_ft = {
  lua = { "selene" },
}

-- Run linters on save.
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
