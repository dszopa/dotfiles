--
-- Color themes
--

vim.pack.add({
  { src = Repo.gh("catppuccin/nvim"), name = "catppuccin" },
  { src = Repo.gh("projekt0n/github-nvim-theme"), name = "github-theme" },
})

vim.pack.add({
  Repo.gh("f-person/auto-dark-mode.nvim"),
})

local theme = {
  light_theme = "github_light",
  dark_theme = "catppuccin-mocha",
}

require("auto-dark-mode").setup({
  set_dark_mode = function()
    vim.cmd.colorscheme(theme.dark_theme)
    vim.api.nvim_set_option_value("background", "dark", {})
  end,
  set_light_mode = function()
    vim.cmd.colorscheme(theme.light_theme)
    vim.api.nvim_set_option_value("background", "light", {})
  end,
})

if vim.o.background == "dark" then
  vim.cmd.colorscheme(theme.dark_theme)
else
  vim.cmd.colorscheme(theme.light_theme)
end

vim.keymap.set("n", "<leader>`", function()
  if vim.o.background == "dark" then
    vim.api.nvim_set_option_value("background", "light", {})
  else
    vim.api.nvim_set_option_value("background", "dark", {})
  end
end, { desc = "Toggle dark mode" })
