-- Basic Vim options and settings
vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

-- 📏 Tab and Indentation Settings 📏
vim.opt.tabstop = 2        -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 2     -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 2    -- Number of spaces that a tab counts for while editing
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

-- 🎯 Additional Editor Settings 🎯
vim.opt.wrap = false       -- Don't wrap lines
vim.opt.cursorline = true  -- Highlight current line
vim.opt.ignorecase = true  -- Ignore case in search
vim.opt.smartcase = true   -- Override ignorecase if search contains uppercase
vim.opt.hlsearch = true    -- Highlight search results
vim.opt.incsearch = true   -- Show search matches as you type

