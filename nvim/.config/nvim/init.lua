_G.Repo = {
  gh = function(x)
    return "https://github.com/" .. x
  end,
}

require("opts")
require("settings")
require("lsp")
require("keybinds")
