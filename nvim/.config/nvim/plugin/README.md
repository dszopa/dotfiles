# Plugin

`.lua` files in this directory are sourced after `init.lua`.

Intention of this directory is to create a separate file for each plugin.
Each file should have the following:

1. A `vim.pack.add()` section to add the plugin.
2. A setup section for initializing and configuring the plugin.
3. A keymaps section for registering keymaps relevant to the plugin.

See `:h plugin` & `:h load-plugins` for specifics.
