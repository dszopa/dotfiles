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
  window = {
    position = "left",
    width = 70,
    auto_expand_width = true,
  },
  -- These take up extra space, I don't want them in my tree.
  default_component_configs = {
    file_size = {
      enabled = false,
    },
    type = {
      enabled = false,
    },
    ---@diagnostic disable-next-line: missing-fields
    last_modified = {
      enabled = false,
    },
    ---@diagnostic disable-next-line: missing-fields
    created = {
      enabled = false,
    },
    symlink_target = {
      enabled = false,
    },
  },
  filesystem = {
    group_empty_dirs = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
    },
  },
  git_status = {
    group_empty_dirs = true,
  },
})

vim.keymap.set("n", "<leader>tt", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-Tree" })
vim.keymap.set("n", "<leader>to", "<cmd>Neotree show<CR>", { desc = "Open Neo-Tree" })
vim.keymap.set("n", "<leader>tc", "<cmd>Neotree close<CR>", { desc = "Close Neo-Tree" })
vim.keymap.set("n", "<leader>tr", "<cmd>Neotree focus reveal<CR>", { desc = "Reveal current file in Neo-Tree" })
vim.keymap.set("n", "<leader>td", "<cmd>Neotree focus filesystem<CR>", { desc = "Show filesystem in Neo-Tree" })
vim.keymap.set("n", "<leader>tg", "<cmd>Neotree focus git_status<CR>", { desc = "Show git status in Neo-Tree" })
