vim.pack.add({
  Repo.gh("akinsho/toggleterm.nvim"),
})

local Terminal = require("toggleterm.terminal").Terminal

local toggleterm = Terminal:new({
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  on_open = function(_)
    vim.cmd("startinsert!")
  end,
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  on_open = function(_)
    vim.cmd("startinsert!")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader><c-g>", function()
  lazygit:toggle()
end, { desc = "Toggle lazygit" })

vim.keymap.set({ "n", "t" }, "<leader><c-j>", function()
  toggleterm:toggle()
end, { desc = "Toggle terminal" })
