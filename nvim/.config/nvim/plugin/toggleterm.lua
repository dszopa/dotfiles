vim.pack.add({
  Repo.gh("akinsho/toggleterm.nvim"),
})

local Terminal = require("toggleterm.terminal").Terminal

local toggleterm_1 = Terminal:new({
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  on_open = function(_)
    vim.cmd("startinsert!")
  end,
})

local toggleterm_2 = Terminal:new({
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  on_open = function(_)
    vim.cmd("startinsert!")
  end,
})

local toggleterm_3 = Terminal:new({
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
  toggleterm_1:toggle()
end, { desc = "Toggle terminal 1" })

vim.keymap.set({ "n", "t" }, "<leader><c-k>", function()
  toggleterm_2:toggle()
end, { desc = "Toggle terminal 2" })

vim.keymap.set({ "n", "t" }, "<leader><c-l>", function()
  toggleterm_3:toggle()
end, { desc = "Toggle terminal 3" })
