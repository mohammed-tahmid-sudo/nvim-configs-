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
}

