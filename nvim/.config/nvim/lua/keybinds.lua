--
-- Keybindings that require no plugins.
-- Plugin specific keybindings should be placed in their respective plugin.lua files.
--

-- Lua Development Helpers
vim.keymap.set("n", "<leader><leader>r", "<cmd>source %<CR>", { desc = "Reload current file" })
vim.keymap.set("n", "<leader><leader>x", ":.lua<CR>", { desc = "Run current line as lua code" })
vim.keymap.set("v", "<leader><leader>x", ":lua<CR>", { desc = "Run selected text as lua code" })

-- Easy copy / paste with system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"*y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>p", '"*p', { desc = "Paste below from system clipboard" })
vim.keymap.set("n", "<leader>P", '"*P', { desc = "Paste above from system clipboard" })

-- Support using escape to switch to normal mode from terminal mode
vim.keymap.set("t", "<leader><Esc>", "<C-\\><C-n>", { desc = "Switch to normal mode from terminal mode" })

-- Center when jumping to search results
vim.keymap.set("n", "n", "nzz", { desc = "Center when jumping to next search result" })
vim.keymap.set("n", "N", "Nzz", { desc = "Center when jumping to previous search result" })

-- Tab management
vim.keymap.set("n", "<leader>To", ":tabnew<CR>", { desc = "Open a new tab" })
vim.keymap.set("n", "<leader>Tx", ":tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>Tn", ":tabnext<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>TN", ":tabprevious<CR>", { desc = "Go to previous tab" })

-- Copy the current file path to the clipboard
vim.keymap.set("n", "<leader>Yp", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
  vim.notify("Copied file path to clipboard: " .. file_path, vim.log.levels.INFO)
end, { desc = "Copy relative file path to clipboard" })

-- Quickfix list enhancements
vim.keymap.set("n", "]q", ":cnext<CR>zz", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "[q", ":cprev<CR>zz", { desc = "Go to previous quickfix item" })
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>qx", ":cclose<CR>", { desc = "Close quickfix list" })

-- LSP
vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set("n", "gr", function()
  vim.lsp.buf.references()
end, { desc = "Go to references" })
vim.keymap.set("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "Go to implementation" })
vim.keymap.set("n", "gy", function()
  vim.lsp.buf.type_definition()
end, { desc = "Go to type definition" })
vim.keymap.set("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
vim.keymap.set("n", "K", function()
  vim.lsp.buf.hover()
end, { desc = "Show hover information" })
vim.keymap.set("n", "gK", function()
  vim.lsp.buf.signature_help()
end, { desc = "Show signature help" })
vim.keymap.set("i", "<c-k>", function()
  vim.lsp.buf.signature_help()
end, { desc = "Show signature help" })
