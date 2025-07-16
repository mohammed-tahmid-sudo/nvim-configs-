
-- LSP Configuration
local lspconfig = require('lspconfig')

-- Define diagnostic signs with enhanced icons
local signs = {
  { name = "DiagnosticSignError", text = "" },  -- Error icon
  { name = "DiagnosticSignWarn", text = "" },   -- Warning icon
  { name = "DiagnosticSignHint", text = "󰌶" },   -- Hint/lightbulb icon
  { name = "DiagnosticSignInfo", text = "" },   -- Info icon
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Configure diagnostics with enhanced visual indicators
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    spacing = 2,
    source = "if_many",
    format = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "󰌶",
      }
      return string.format("%s %s", icons[diagnostic.severity] or "", diagnostic.message)
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    format = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = "󰌶 ",
      }
      return icons[diagnostic.severity] .. diagnostic.message
    end,
  },
})

-- LSP capabilities with completion support
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enhanced LSP UI configuration
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
    title = "󰋖 Hover Documentation",
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
    title = "󰘦 Signature Help",
  }
)

-- Custom LSP attach function with enhanced keymaps
local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Enhanced LSP keymaps with descriptive names
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

-- Setup language servers with enhanced configuration
lspconfig.pyright.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off"
      }
    }
  }
}

lspconfig.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
}

-- Add more LSP servers if needed
-- lspconfig.lua_ls.setup{ capabilities = capabilities, on_attach = on_attach }
-- lspconfig.tsserver.setup{ capabilities = capabilities, on_attach = on_attach }
