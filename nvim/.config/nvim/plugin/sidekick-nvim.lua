-- Coding agent used for sidekick.
local agent = "opencode"

vim.pack.add({
  Repo.gh("folke/sidekick.nvim"),
})

require("sidekick").setup({
  cli = {
    win = {
      layout = "float",
    },
  },
})

--
-- Keybindings
-- - Prefix - a / <c-a> / <a-a> - for (a)i / (a)gent
--

vim.keymap.set({ "n", "i" }, "<tab>", function()
  -- If there is a next edit, jump to it, otherwise apply it if any
  if not require("sidekick").nes_jump_or_apply() then
    return "<Tab>" -- fallback to normal tab
  end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

vim.keymap.set({ "n", "t", "i", "x" }, "<leader><a-a>", function()
  require("sidekick.cli").focus({ name = agent })
end, { desc = "Sidekick Focus" })

vim.keymap.set({ "n", "t" }, "<leader><c-a>", function()
  require("sidekick.cli").toggle({ name = agent })
end, { desc = "Sidekick Toggle CLI" })

-- Because my head keeps thinking I should be able to do this
vim.keymap.set({ "x" }, "<leader><c-a>", function()
  require("sidekick.cli").send({ name = agent, msg = "{this}" })
end, { desc = "Sidekick send this (visual)" })

vim.keymap.set({ "x", "n" }, "<leader>at", function()
  require("sidekick.cli").send({ name = agent, msg = "{this}" })
end, { desc = "Sidekick send this" })

vim.keymap.set({ "n" }, "<leader>af", function()
  require("sidekick.cli").send({ name = agent, msg = "{file}" })
end, { desc = "Sidekick send file" })

-- TODO: DSZOPA - I don't understand how this is different than `{this}`.
vim.keymap.set({ "n" }, "<leader>av", function()
  require("sidekick.cli").send({ name = agent, msg = "{selection}" })
end, { desc = "Sidekick send visual selection" })

-- WARNING - This function uses internals of sidekick & may break with updates.
vim.keymap.set({ "n", "t" }, "<leader>at", function()
  local sessions = require("sidekick.cli.terminal").sessions()
  if #sessions == 0 then
    print("No Sidekick sessions found.")
    return
  end

  local terminal = require("sidekick.cli.terminal").get(sessions[1].id)
  terminal.opts.layout = terminal.opts.layout == "float" and "right" or "float"
  require("sidekick.cli").hide({ name = agent })
  require("sidekick.cli").focus({ name = agent })
end, { desc = "Sidekick toggle terminal layout" })
