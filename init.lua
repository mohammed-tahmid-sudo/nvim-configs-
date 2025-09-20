-- ~/.config/nvim/init.lua
-- Set leader key to space
vim.g.mapleader = " "
-- Both absolute + relative (current line shows absolute, others relative)
vim.wo.number = true
vim.wo.relativenumber = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({
	{
  "morhetz/gruvbox",
  config = function()
    vim.cmd([[colorscheme gruvbox]])
  end
},
	require("plugins_and_config/floaterm"),
	require("plugins_and_config/treesitter"),
	require("plugins_and_config/which-key"),
	require("plugins_and_config/telescope"),
	require("plugins_and_config/conform"),
	require("plugins_and_config/lualine"),


})

