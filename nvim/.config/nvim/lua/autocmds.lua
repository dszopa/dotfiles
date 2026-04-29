-- Save on focus lost.
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = { "*" },
  command = "silent! wa",
})

-- Automatically reload files after they've changed on disk when re-entering the buffer.
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
  pattern = { "*" },
  command = "silent! checktime",
})
