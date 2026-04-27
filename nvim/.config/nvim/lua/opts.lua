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
vim.opt.listchars = { trail = "•" }
