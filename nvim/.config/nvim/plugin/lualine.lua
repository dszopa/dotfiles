vim.pack.add({
  Repo.gh("nvim-tree/nvim-web-devicons"), -- For icons
  Repo.gh("nvim-lualine/lualine.nvim"),
})

require("lualine").setup({
  sections = {
    lualine_c = {
      {
        "filename",
        path = 1, -- Relative path
      },
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        "filename",
        path = 1, -- Relative path
      },
    },
  },
})
