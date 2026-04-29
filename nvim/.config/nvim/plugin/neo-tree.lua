vim.pack.add({
  {
    src = Repo.gh("nvim-neo-tree/neo-tree.nvim"),
    version = vim.version.range("3"),
  },
  -- Dependencies
  Repo.gh("nvim-lua/plenary.nvim"),
  Repo.gh("MunifTanjim/nui.nvim"),
  -- optional, but recommended
  Repo.gh("nvim-tree/nvim-web-devicons"),
  -- Repo.gh('s1n7ax/nvim-window-picker'), -- Configured in `nvim-window-picker.lua`
})

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
  },
})

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-Tree" })
vim.keymap.set("n", "<leader>to", "<cmd>Neotree show<CR>", { desc = "Open Neo-Tree" })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "Close Neo-Tree" })
