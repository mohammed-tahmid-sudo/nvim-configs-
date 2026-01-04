return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      -- optional customization
      ui = {
        border = "rounded",
        colors = {
          normal_bg = "#1e222a",
        },
      },
      lightbulb = {
        enable = true,
        sign = true,
        virtual_text = false,
      },
      symbol_in_winbar = {
        enable = true,
        separator = "  ",
      },
    })

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- LSP Saga keybindings
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)          -- find references & definitions
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)            -- hover docs
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- code actions
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)             -- rename symbol
    keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)      -- symbols outline
  end
}

