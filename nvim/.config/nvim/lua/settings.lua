-- This file houses configuration settings that are intended to be ran
-- after plugins have been loaded.
--
-- It serves as a home for nvim settings that are not related to plugins, or standalone opts.

-- Show diagnostics as virtual lines instead of virtual text, but only for the current line.
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
})

-- Create the backup directory if it doesn't already exist.
local backup_dir = vim.fn.expand("~/.vim/backup")
if vim.fn.isdirectory(backup_dir) == 0 then
  vim.fn.mkdir(backup_dir, "p")
end
-- Set the backup directory to `backup_dir` & create a unique filename for each backup file.
vim.opt.backupdir = backup_dir .. "//"
