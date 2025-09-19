-- Indentation
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.autoindent = true
-- Set leader key early
vim.g.mapleader = " "  -- space as leader
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

require("lazy").setup({
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
},
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
  { "morhetz/gruvbox", lazy = false, priority = 1000 },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
        c = {
          function()
            return { exe = "clang-format", args = { "--assume-filename", vim.api.nvim_buf_get_name(0) }, stdin = true }
          end
        },
        cpp = {
          function()
            return { exe = "clang-format", args = { "--assume-filename", vim.api.nvim_buf_get_name(0) }, stdin = true }
          end
        },
        python = {
          function()
            return { exe = "black", args = { "-" }, stdin = true }
          end
        },
        java = {
          function()
            return { exe = "google-java-format", args = { "-" }, stdin = true }
          end
        },
        lua = {
          function()
            return { exe = "stylua", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "-" }, stdin = true }
          end
        },
        html = {
          function()
            return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true }
          end
        },
        css = {
          function()
            return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true }
          end
        },
        javascript = {
          function()
            return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true }
          end
        },
      },
    })

    -- Optional: auto format on save
    vim.cmd([[
      augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.c,*.cpp,*.py,*.java,*.lua,*.js,*.html,*.css FormatWrite
      augroup END
    ]])
  end
},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
},
  defaults = { lazy = false },
  checker = { enabled = true },
})

vim.cmd.colorscheme("gruvbox")
vim.o.background = "dark"



local wk = require("which-key")
wk.add({
  { "<leader>f", group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fb", function() print("hello") end, desc = "Foobar" },
  { "<leader>fn", desc = "New File" },
  { "<leader>f1", hidden = true }, -- hide this keymap
  { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
  { "<leader>b", group = "buffers", expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" }, -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})


vim.keymap.set("n", "<leader>F", ":Format<CR>", { desc = "Format file" })

-- Ensure nvim >= 0.11, nvim-lspconfig and nvim-cmp installed
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Enhance capabilities for nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Keymaps for LSP features
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
end

-- LSP servers with capabilities
local servers = {
  html = {},
  cssls = {},
  tsserver = {},
  pyright = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      },
    },
  },
  clangd = {},
}

-- Setup each server
for server, config in pairs(servers) do
  config = vim.tbl_extend("force", { on_attach = on_attach, capabilities = capabilities }, config)
  lspconfig[server].setup(config)
end

