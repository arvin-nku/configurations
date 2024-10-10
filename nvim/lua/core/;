-- ~/.config/nvim/lua/core/lazy.lua
-- EVERY FUNCTION CAN IS EXPLAINED: at ':h <function>'
-- from the nvim API:
-- vim. is the main object you interact with in lua they are called tables
-- vim.fn. is a sub-table (object inside the main object 'vim')
-- -> which provides the vimscript functions to interact with the API
-- 	'stdpath' function returns the standard path for storing Neovim data 
-- 	files (usually '~/.local/share/nvim' on Linux)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- '..' is for concatenation of 'strings'
-- checking if Lazy.nvim is already installed
if not vim.loop.fs_stat(lazypath) then
  -- 'system'-function runs a system command
  vim.fn.system({
    "git",
    "clone",
    -- this option reduces the amount of data being cloned by omitting blobs (file content)
    -- that are not immediately needed.
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    -- the destination (stored in the local variable lazypath) where Lazy.nvim will be cloned.
    lazypath,
  })
end

-- again a sub-sub-table 'rtp' (Runtime Path) refering to the runtime path option for Neovim.
-- This is a special option that tells Neovim where to look for runtime files.
-- 	'prepend'-function is used to add a directory to the beginning of the runtime path.
-- 	this ensures that the specified directory is searched first when Neovim looks for 
-- 	runtim files.
vim.opt.rtp:prepend(lazypath)

-- The 'require().setup()' pattern is commonly used in Neovim's Lua configuration to load
-- a Lua module and then immediately call its 'setup' function to configure it.
--
-- 'require("module_name")'-function is used to load a Lua module. The function returns the module,
-- which is usually a table.
-- 'setup(config_table)'-function is used once the module is loaded and returned as a table,
-- so the module-methods can be called.
-- 	the 'setup' method is a convention used by many Neovim plugins to initialize and
-- 	configure the plugin with a configuration table.
-- 	the 'config_table' is a Lua table containing configuration options that customize the
-- 	behaviour of the plugin.
require("lazy").setup("plugins.configs")

