-- LSP Configuration
local lspconfig = require('lspconfig')

-- Define diagnostic signs with icons
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- LSP capabilities with completion support
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup language servers with enhanced configuration
lspconfig.pyright.setup{
  capabilities = capabilities,
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
-- lspconfig.lua_ls.setup{ capabilities = capabilities }
-- lspconfig.tsserver.setup{ capabilities = capabilities }

