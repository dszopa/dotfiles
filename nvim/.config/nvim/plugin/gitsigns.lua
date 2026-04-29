vim.pack.add({
  Repo.gh("lewis6991/gitsigns.nvim"),
})

require("gitsigns").setup()

vim.keymap.set("n", "]h", function()
  require("gitsigns").nav_hunk("next")
end, { desc = "Go to next git hunk" })
vim.keymap.set("n", "[h", function()
  require("gitsigns").nav_hunk("prev")
end, { desc = "Go to previous git hunk" })
