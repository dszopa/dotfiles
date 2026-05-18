-- Set the leader key to space.
vim.g.mapleader = " "

-- Set the heigh of the command line area at the bottom.
vim.opt.cmdheight = 2

-- Displays the line number for the current line.
vim.opt.number = true

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 500

-- Time in milliseconds of inactivity before writing the swap file and triggering the CursorHold event.
vim.opt.updatetime = 4000

-- Ignore case when searching patterns.
vim.opt.ignorecase = true

-- Override the 'ignorecase' option if the search pattern contains uppercase letters.
vim.opt.smartcase = true

-- Automatically switch to case-sensitive search if a capital letter is used.
vim.opt.smartcase = true

-- Enables 24-bit RBG color in the TUI.
vim.opt.termguicolors = true

-- Number of spaces that a <Tab> in the file counts for.
vim.opt.tabstop = 2

-- Number of spaces to use for each step of automatic indentation.
vim.opt.shiftwidth = 2

-- Number of spaces that a <Tab> counts for during editing operations.
vim.opt.softtabstop = 2

-- Use spaces instead of tabs.
vim.opt.expandtab = true

-- Automatically insert an extra level of indentation in some cases.
vim.opt.smartindent = true

-- Makes <Tab> insert 'shiftwidth' number of spaces at the start of a line.
vim.opt.smarttab = true

-- Add border around loating windows
vim.opt.winborder = "rounded"

-- Show whitespace characters.
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "•" }

-- Only show the tabline when there are at least two tabs.
vim.opt.showtabline = 1

-- Always leave 8 lines above / below cursor
vim.opt.scrolloff = 8

-- Highlight the 80th column to encourage keeping lines within 80 characters.
vim.opt.colorcolumn = "80"

-- Highlight the current line.
vim.opt.cursorline = true

-- Do not highlight search matches after the search is done.
vim.opt.hlsearch = false

-- Show search matches as you type, but do not highlight them after the search is done.
vim.opt.incsearch = true

-- When opening a new split, place it below or to the right of the current window.
vim.opt.splitbelow = true

-- When opening a new vertical split, place it to the right of the current window.
vim.opt.splitright = true

-- Enable spell checking.
vim.opt.spell = true

-- Set the language for spell checking to English (United States).
vim.opt.spelllang = "en_us"

-- Reduce the time it takes for CursorHold to trigger, which is used by some plugins for features like showing diagnostics or triggering autocommands.
vim.opt.updatetime = 250

-- Reduce the time it takes for mapped key sequences to complete, which can make the editor feel more responsive when using key mappings.
vim.opt.timeoutlen = 300

-- Don't show mode in the status line.
vim.opt.showmode = false

-- Automatically reload files that have been changed outside of Neovim.
vim.opt.autoread = true

-- Insert mode completion behavior:
-- 1. Show the completion menu even if there is only one match
-- 2. Do not insert text until a selection is made
-- 3. Show the completion menu as a popup
vim.opt.completeopt = { "menuone", "popup", "noinsert" }

-- Enable the new (experimental) UI features in Neovim, such as improved
-- floating windows and popups.
require("vim._core.ui2").enable({})
