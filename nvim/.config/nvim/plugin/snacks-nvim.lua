vim.pack.add({
  Repo.gh("folke/snacks.nvim"),
})

require("snacks").setup({
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  indent = { enabled = true },
})

-- Turn off animate, can't do this through setup
-- I noticed the animations can cause lag with certain treesitter parsers.
vim.g.snacks_animate = false

-- General Pickers
vim.keymap.set("n", "<leader>pp", function()
  Snacks.picker()
end, { desc = "Open Snacks Picker" })
vim.keymap.set("n", "<leader>pf", function()
  Snacks.picker.files({ hidden = true, ignored = true })
end, { desc = "Open Snacks File Picker" })
vim.keymap.set("n", "<leader>ps", function()
  Snacks.picker.grep()
end, { desc = "Open Snacks Grep Picker" })
vim.keymap.set("n", "<leader>ph", function()
  Snacks.picker.help()
end, { desc = "Open Snacks Help Picker" })
vim.keymap.set("n", "<leader>pl", function()
  Snacks.picker.recent()
end, { desc = "Open Snacks Recent Files Picker" })
vim.keymap.set("n", "<leader>pr", function()
  Snacks.picker.resume()
end, { desc = "Resume last Snacks Picker" })
vim.keymap.set("n", "<leader>pb", function()
  Snacks.picker.lines()
end, { desc = "Open Snacks Current Buffer lines Picker" })
vim.keymap.set("n", "<leader>pn", function()
  Snacks.picker.notifications()
end, { desc = "Open Snacks Notifications Picker" })
vim.keymap.set("n", "<leader>pS", function()
  Snacks.picker.spelling()
end, { desc = "Open Snacks Spelling Picker" })
vim.keymap.set("n", "<leader>pd", function()
  Snacks.picker.diagnostics_buffer()
end, { desc = "Open Snacks Diagnostics Buffer Picker" })
vim.keymap.set("n", "<leader>pD", function()
  Snacks.picker.diagnostics()
end, { desc = "Open Snacks Diagnostics Picker" })

-- LSP Pickers
vim.keymap.set("n", "gd", function()
  Snacks.picker.lsp_definitions()
end, { desc = "Open Snacks LSP Definitions Picker" })
vim.keymap.set("n", "gr", function()
  Snacks.picker.lsp_references()
end, { desc = "Open Snacks LSP References Picker" })
vim.keymap.set("n", "gi", function()
  Snacks.picker.lsp_implementations()
end, { desc = "Open Snacks LSP Implementations Picker" })
vim.keymap.set("n", "gy", function()
  Snacks.picker.lsp_type_definitions()
end, { desc = "Open Snacks LSP Type Definitions Picker" })
vim.keymap.set("n", "gD", function()
  Snacks.picker.lsp_declarations()
end, { desc = "Open Snacks LSP Declarations Picker" })
vim.keymap.set("n", "<leader>pS", function()
  Snacks.picker.lsp_symbols()
end, { desc = "Open Snacks LSP Symbols Picker" })
