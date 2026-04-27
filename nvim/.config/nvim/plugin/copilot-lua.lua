vim.pack.add({
  Repo.gh("zbirenbaum/copilot.lua"),
})

require("copilot").setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    auto_trigger = true,
  },
})

vim.keymap.set({ "i" }, "<C-;>", function()
  if require("copilot.suggestion").is_visible() then
    require("copilot.suggestion").accept()
  else
    require("copilot.suggestion").next()
  end
end, { desc = "Accept Copilot suggestion or jump to next" })
