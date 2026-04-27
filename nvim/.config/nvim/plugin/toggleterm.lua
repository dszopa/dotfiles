vim.pack.add({
  Repo.gh("akinsho/toggleterm.nvim"),
})

local Terminal = require("toggleterm.terminal").Terminal

local toggleterm = Terminal:new({
  direction = "float",
  float_opts = {
    border = "rounded",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "rounded",
  },
})

vim.keymap.set({ "n", "t" }, "<leader><c-g>", function()
  lazygit:toggle()
end, { desc = "Toggle lazygit" })

vim.keymap.set({ "n", "t" }, "<leader><c-j>", function()
  toggleterm:toggle()
end, { desc = "Toggle terminal" })
