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

-- General Pickers
vim.keymap.set("n", "<leader>pp", function() Snacks.picker() end, { desc = "Open Snacks Picker" })
vim.keymap.set("n", "<leader>pf", function() Snacks.picker.files({ hidden = true, ignored = true }) end, { desc = "Open Snacks File Picker" })
vim.keymap.set("n", "<leader>ps", function() Snacks.picker.grep() end, { desc = "Open Snacks Grep Picker" })
vim.keymap.set("n", "<leader>ph", function() Snacks.picker.help() end, { desc = "Open Snacks Help Picker" })
vim.keymap.set("n", "<leader>pl", function() Snacks.picker.recent() end, { desc = "Open Snacks Recent Files Picker" })
vim.keymap.set("n", "<leader>pr", function() Snacks.picker.resume() end, { desc = "Resume last Snacks Picker" })
vim.keymap.set("n", "<leader>pb", function() Snacks.picker.lines() end, { desc = "Open Snacks Current Buffer lines Picker" })
vim.keymap.set("n", "<leader>pn", function() Snacks.picker.notifications() end, { desc = "Open Snacks Notifications Picker" })
vim.keymap.set("n", "<leader>pS", function() Snacks.picker.spelling() end, { desc = "Open Snacks Spelling Picker" })

-- LSP Pickers
-- TODO: DSZOPA - Should this just replace gd?
vim.keymap.set("n", "<leader>pLd", function() Snacks.picker.lsp_definitions() end, { desc = "Open Snacks LSP Definitions Picker" })
vim.keymap.set("n", "<leader>pLi", function() Snacks.picker.lsp_implementations() end, { desc = "Open Snacks LSP Implementations Picker" })
vim.keymap.set("n", "<leader>pL<", function() Snacks.picker.lsp_incoming_calls() end, { desc = "Open Snacks LSP Incoming Calls Picker" })
vim.keymap.set("n", "<leader>pL>", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "Open Snacks LSP Outgoing Calls Picker" })
vim.keymap.set("n", "<leader>pLs", function() Snacks.picker.lsp_symbols() end, { desc = "Open Snacks LSP Symbols Picker" })



