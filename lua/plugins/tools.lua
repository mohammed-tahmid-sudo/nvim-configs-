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
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require('conform').setup({
        -- 🚀 Formatters by filetype 🚀
        formatters_by_ft = {
          -- 🌐 Web Development
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
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
          python = { "black", "isort" },
          
          -- 🌙 Lua
          lua = { "stylua" },
          
          -- 🦀 Rust
          rust = { "rustfmt" },
          
          -- 🐹 Go
          go = { "gofumpt", "goimports" },
          
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
          
          -- 📊 Data formats
          xml = { "xmlformat" },
          sql = { "sqlformat" },
          
          -- 🔤 Other languages
          dart = { "dart_format" },
          kotlin = { "ktlint" },
          swift = { "swift_format" },
          
          -- 📝 Fallback for any filetype
          ["*"] = { "codespell" },
          ["_"] = { "trim_whitespace" },
        },
        
        -- 💫 Format on save configuration 💫
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_fallback = true,
        },
        
        -- 🎯 Custom formatters 🎯
        formatters = {
          -- Example of customizing a formatter
          prettier = {
            prepend_args = { "--tab-width", "2" },
          },
          black = {
            prepend_args = { "--line-length", "88" },
          },
          shfmt = {
            prepend_args = { "-i", "2" },
          },
        },
      })
      
      -- 🗝️ Additional keymaps 🗝️
      vim.keymap.set({ "n", "v" }, "<leader>F", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
      
      -- 📋 Show formatter info
      vim.keymap.set("n", "<leader>ci", "<cmd>ConformInfo<cr>", { desc = "Show conform info" })
    end,
  },
}

