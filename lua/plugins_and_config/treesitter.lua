return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "cpp", "python", "lua", "javascript" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      playground = { enable = true },
    }

    require('nvim-treesitter.install').update({ with_sync = true })

    vim.api.nvim_set_keymap(
      'n',
      '<leader>tp',
      ':TSPlaygroundToggle<CR>',
      { noremap = true, silent = true }
    )
  end,
}

