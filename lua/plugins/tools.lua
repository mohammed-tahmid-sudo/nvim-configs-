-- Development tools and utilities
return {
  -- Floaterm
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width    = 0.8
      vim.g.floaterm_height   = 0.5
      vim.g.floaterm_wintype  = 'float'
      vim.g.floaterm_position = 'center'
      vim.g.floaterm_autoclose = 1
      vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>', { noremap = true, silent = true })
    end
  },

  -- Code Runner & Auto-save
  {
    'CRAG666/code_runner.nvim',
    dependencies = 'CRAG666/betterTerm.nvim',
    config = function()
      require('code_runner').setup({
        mode = 'float',
        filetype = { 
          python = "python3 -u", 
          c = "gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt" 
        },
      })
    end
  },
  {
    'Pocco81/auto-save.nvim',
    config = function() 
      require('auto-save').setup() 
    end
  },

  -- 🎨 Code Formatter - conform.nvim 🎨
  {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    config = function()
      local conform = require('conform')
      
      conform.setup({
        -- 🚀 Formatters by filetype 🚀
        formatters_by_ft = {
          -- 🌐 Web Development
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          
          -- 🐍 Python
          python = { "isort", "black" },
          
          -- 🌙 Lua
          lua = { "stylua" },
          
          -- 🦀 Rust
          rust = { "rustfmt" },
          
          -- 🐹 Go
          go = { "goimports", "gofumpt" },
          
          -- 🔧 C/C++
          c = { "clang_format" },
          cpp = { "clang_format" },
          
          -- ☕ Java
          java = { "google-java-format" },
          
          -- 💎 Ruby
          ruby = { "rubocop" },
          
          -- 🐘 PHP
          php = { "php_cs_fixer" },
          
          -- 🌈 Shell
          sh = { "shfmt" },
          bash = { "shfmt" },
          zsh = { "shfmt" },
          fish = { "fish_indent" },
          
          -- 📊 Data formats
          xml = { "xmlformat" },
          sql = { "sqlformat" },
          toml = { "taplo" },
          
          -- 🔤 Other languages
          dart = { "dart_format" },
          kotlin = { "ktlint" },
          swift = { "swift_format" },
          elixir = { "mix" },
          zig = { "zigfmt" },
          
          -- 📝 Fallback - only whitespace trimming
          ["_"] = { "trim_whitespace" },
        },
        
        -- 💫 Format on save configuration 💫
        format_on_save = function(bufnr)
          -- Skip format on save for specific filetypes
          local disable_filetypes = { "c", "cpp", "sql" }
          local filetype = vim.bo[bufnr].filetype
          
          if vim.tbl_contains(disable_filetypes, filetype) then
            return
          end
          
          return {
            timeout_ms = 1000,
            lsp_fallback = true,
          }
        end,
        
        -- 🎯 Custom formatters 🎯
        formatters = {
          prettier = {
            prepend_args = { "--tab-width", "2", "--single-quote", "true" },
          },
          black = {
            prepend_args = { "--line-length", "88", "--fast" },
          },
          shfmt = {
            prepend_args = { "-i", "2", "-ci" },
          },
          stylua = {
            prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
        },
      })
      
      -- 🗝️ Format keymap - <leader>F 🗝️
      vim.keymap.set({ "n", "v" }, "<leader>F", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 2000,
        })
        print("✨ Code formatted!")
      end, { desc = "📐 Format code" })
      
      -- 📋 Show formatter info
      vim.keymap.set("n", "<leader>ci", "<cmd>ConformInfo<cr>", { desc = "ℹ️ Show formatter info" })
      
      -- 🔧 Format selection in visual mode
      vim.keymap.set("v", "<leader>f", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 2000,
          range = {
            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
          },
        })
        print("✨ Selection formatted!")
      end, { desc = "📐 Format selection" })
    end,
  },
}

