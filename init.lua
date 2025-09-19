-- init.lua
-- Neovim config: robust LSP setup (mason + lspconfig), nvim-cmp (capabilities), blink.cmp installed,
-- which-key, formatter, floaterm, treesitter. Focus: accuracy and sane defaults.

-- Basic options
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

require("lazy").setup({
  -- utilities
  { "nvim-lua/plenary.nvim" },

  -- theme
  { "morhetz/gruvbox", lazy = false, priority = 1000 },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- mason for LSP management
  { "williamboman/mason.nvim", cmd = "Mason", config = function() require("mason").setup() end },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },

  -- lspconfig
  { "neovim/nvim-lspconfig" },

  -- completion (nvim-cmp) + snippets
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- blink.cmp (user wanted this installed) — kept simple
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = { nerd_font_variant = "mono" },
      completion = { documentation = { auto_show = false } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({})
      wk.register({
        f = {
          name = "file",
          f = { "<cmd>Telescope find_files<CR>", "Find File" },
          n = { "<cmd>enew<CR>", "New File" },
          s = { "<cmd>w<CR>", "Save" },
        },
        w = { name = "windows" },
        b = { name = "buffers" },
        q = { "<cmd>q<CR>", "Quit" },
      }, { prefix = "<leader>" })
    end,
  },

  -- floaterm
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

  -- formatter.nvim
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          c = { function() return { exe = "clang-format", args = { "--assume-filename", vim.api.nvim_buf_get_name(0) }, stdin = true } end },
          cpp = { function() return { exe = "clang-format", args = { "--assume-filename", vim.api.nvim_buf_get_name(0) }, stdin = true } end },
          python = { function() return { exe = "black", args = { "-" }, stdin = true } end },
          java = { function() return { exe = "google-java-format", args = { "-" }, stdin = true } end },
          lua = { function() return { exe = "stylua", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "-" }, stdin = true } end },
          html = { function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end },
          css = { function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end },
          javascript = { function() return { exe = "prettier", args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) }, stdin = true } end },
        },
      })

      vim.cmd([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.c,*.cpp,*.py,*.java,*.lua,*.js,*.html,*.css FormatWrite
        augroup END
      ]])
    end,
  },

  -- telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
},
{ defaults = { lazy = false }, checker = { enabled = true } })

-- colorscheme
vim.cmd.colorscheme("gruvbox")
vim.o.background = "dark"

-- Basic keymaps
vim.keymap.set("n", "<leader>F", ":Format<CR>", { desc = "Format file" })

-- Diagnostics display
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "●" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Setup nvim-cmp (basic, works with cmp_nvim_lsp capabilities)
local cmp_ok, cmp = pcall(require, "cmp")
local has_cmp = cmp_ok
if has_cmp then
  local luasnip = require("luasnip")
  require("luasnip.loaders.from_vscode").lazy_load()
  cmp.setup({
    snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = require("cmp").mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({ { name = "nvim_lsp" }, { name = "luasnip" } }, { { name = "buffer" } }),
  })
end

-- LSP capabilities (enhanced for nvim-cmp)
local capabilities = vim.lsp.protocol.make_client_capabilities()
if has_cmp then
  local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if ok then capabilities = cmp_nvim_lsp.default_capabilities(capabilities) end
end

-- LSP on_attach: keymaps + format handler + inlay hints
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

  -- enable inlay hints if server supports it
  if client.server_capabilities.inlayHintProvider then
    pcall(vim.lsp.inlay_hint, bufnr, true)
  end
end

-- mason + mason-lspconfig: ensure servers installed
local mason_ok, mason = pcall(require, "mason")
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if mason_ok and mason_lsp_ok then
  mason.setup()
  mason_lsp.setup({
    ensure_installed = { "html", "cssls", "tsserver", "pyright", "lua_ls", "clangd" },
    automatic_installation = true,
  })
end

-- lspconfig setup
local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  vim.notify("nvim-lspconfig not found", vim.log.levels.ERROR)
  return
end

-- Servers with sane settings for accuracy
local servers = {
  html = {},
  cssls = {},
  tsserver = {
    init_options = { hostInfo = "neovim" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
  },
  pyright = {
    settings = { python = { analysis = { typeCheckingMode = "basic", autoSearchPaths = true, useLibraryCodeForTypes = true } } },
  },
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
  },
  clangd = {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
  },
}

-- Setup each server with capabilities + on_attach
for name, cfg in pairs(servers) do
  cfg = vim.tbl_deep_extend("force", { capabilities = capabilities, on_attach = on_attach }, cfg)
  lspconfig[name].setup(cfg)
end

-- Extra: stronger root detection for tsserver
lspconfig.tsserver.setup(vim.tbl_deep_extend("force", { capabilities = capabilities, on_attach = on_attach }, {
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
}))

-- Diagnostic navigation
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- End

