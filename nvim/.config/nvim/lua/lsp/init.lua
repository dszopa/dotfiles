--
-- Automatically load all LSP configuration files in the 'lsp' directory, except for 'init.lua'.
--

local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"
local modules = {}

for name, t in vim.fs.dir(lsp_dir) do
  if t == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
    ---@diagnostic disable-next-line: no-unknown
    modules[#modules + 1] = name:gsub("%.lua$", "")
  end
end

table.sort(modules)

---@diagnostic disable-next-line: no-unknown
for _, mod in ipairs(modules) do
  require("lsp." .. mod)
end
