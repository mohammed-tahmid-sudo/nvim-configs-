-- init.lua for Neovim using blink.cmp

-- General editor settings
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({

  "nvim-lua/plenary.nvim",
  { "morhetz/gruvbox", lazy = false, priority = 1000 },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "cpp", "lua", "python", "javascript", "typescript", "html", "css" },
        highlight = { enable = true },
        auto_install = true,
      })
    end,
  },
  {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
},

  -- Mason + LSP
  { "williamboman/mason.nvim", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim", "neovim/nvim-lspconfig" } },

  -- LSP config
  "neovim/nvim-lspconfig",

  -- blink.cmp (completion)
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = true } },
      sources = { default = { "lsp", "path", "buffer", "snippets" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- Telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "plenary.nvim" } },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup({})
    end,
  },

  -- Floaterm
  {
    "voldikss/vim-floaterm",
    keys = {
      { "<leader>t", ":FloatermToggle<CR>", desc = "Toggle Floaterm" },
      { "<leader>tn", ":FloatermNext<CR>", desc = "Next Floaterm" },
      { "<leader>tp", ":FloatermPrev<CR>", desc = "Previous Floaterm" },
    },
    config = function()
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
      vim.g.floaterm_opener = "edit"
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_wintitle = 1
      vim.g.floaterm_position = "center"
    end,
  },

  -- Formatter
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          lua = { require("formatter.filetypes.lua").stylua },
          python = {
            function() return { exe = "black", args = { "-" }, stdin = true } end,
          },
          javascript = {
            function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end,
          },
          typescript = {
            function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end,
          },
          html = {
            function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end,
          },
          css = {
            function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end,
          },
          c = { function() return { exe = "clang-format", args = { "-style=file" }, stdin = true } end },
          cpp = { function() return { exe = "clang-format", args = { "-style=file" }, stdin = true } end },
        },
      })
      vim.api.nvim_create_autocmd("BufWritePost", { pattern = "*", callback = function() vim.cmd("FormatWrite") end })
    end,
  },

})

-- Colorscheme
vim.cmd.colorscheme("gruvbox")
vim.o.background = "dark"

-- Keymaps
vim.keymap.set("n", "<leader>F", ":Format<CR>", { desc = "Format file" })

-- LSP setup
local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "ts_ls", "pyright", "lua_ls", "clangd" }

local on_attach = function(client, bufnr)
  local buf_map = function(mode, lhs, rhs, opts)
    opts = opts or { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end
  buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  buf_map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{ async = true }<CR>")
end

for _, srv in ipairs(servers) do
  lspconfig[srv].setup({ on_attach = on_attach })
end

-- blink.cmp setup
require("blink").setup({
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = { documentation = { auto_show = true } },
  sources = { default = { "lsp", "path", "buffer", "snippets" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

