-- Basic Vim options and settings
vim.g.mapleader = ' '

-- Wayland clipboard configuration
vim.opt.clipboard = 'unnamedplus'  -- Use system clipboard
vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy',
    ['*'] = 'wl-copy --primary',
  },
  paste = {
    ['+'] = 'wl-paste --no-newline',
    ['*'] = 'wl-paste --no-newline --primary',
  },
  cache_enabled = 1,
}

vim.opt.number = true
vim.opt.relativenumber = true

-- 📏 Tab and Indentation Settings 📏
vim.opt.tabstop = 2        -- Number of spaces that a tab counts for
vim.opt.shiftwidth = 2     -- Number of spaces to use for each step of (auto)indent
vim.opt.softtabstop = 2    -- Number of spaces that a tab counts for while editing
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smart autoindenting when starting a new line
vim.opt.cindent = false    -- Disable C-style automatic indenting

-- 🎯 Additional Editor Settings 🎯
vim.opt.wrap = false       -- Don't wrap lines
vim.opt.cursorline = true  -- Highlight current line
vim.opt.ignorecase = true  -- Ignore case in search
vim.opt.smartcase = true   -- Override ignorecase if search contains uppercase
vim.opt.hlsearch = true    -- Highlight search results
vim.opt.incsearch = true   -- Show search matches as you type

-- 🎨 UI and Font Settings 🎨
vim.opt.termguicolors = true  -- Enable 24-bit RGB color in TUI
vim.opt.pumheight = 10        -- Maximum number of entries in popup
vim.opt.conceallevel = 0      -- Show `` in markdown files

-- Font settings for better icon display
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"  -- Larger font for better icon visibility
  vim.g.neovide_scale_factor = 1.0
elseif vim.g.fvim_loaded then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h14'
end

