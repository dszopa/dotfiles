vim.pack.add({
  { src = Repo.gh("nvim-treesitter/nvim-treesitter"), version = "main" },
})

local parsers = {
  "bash",
  "css",
  "csv",
  "dart",
  "go",
  "html",
  "java",
  "javascript",
  "json",
  "kdl",
  "lua",
  "make",
  "markdown",
  "mermaid",
  "nginx",
  "nix",
  "proto",
  "python",
  "regex",
  "thrift",
  "tmux",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  "zsh",
}

require("nvim-treesitter").install(parsers)

local function treesitter_try_attach(buf, language)
  -- Check if parser exists and load it.
  if not vim.treesitter.language.add(language) then
    return
  end
  -- Enable syntax highlighting and other treesitter features
  vim.treesitter.start(buf, language)

  -- Check if treesitter indentation is available for this language
  -- and enable it if so.
  --
  -- If there is no indent query fallback to vim's built in one.
  local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
  if has_indent_query then
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

local available_parsers = require("nvim-treesitter").get_available()
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local language = vim.treesitter.language.get_lang(filetype)
    if not language then
      return
    end

    local installed_parsers = require("nvim-treesitter").get_installed("parsers")

    -- selene: allow(if_same_then_else)
    if vim.tbl_contains(installed_parsers, language) then
      treesitter_try_attach(buf, language)
    elseif vim.tbl_contains(available_parsers, language) then
      -- If a parser is available in `nvim-treesitter` auto install it and
      -- enable it after the installation is done.
      require("nvim-treesitter").install(language):await(function()
        treesitter_try_attach(buf, language)
      end)
    else
      -- try to enable treesitter features in case the parser exists but is not
      -- available from `nvim-treesitter`.
      treesitter_try_attach(buf, language)
    end
  end,
})
