return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
      on_colors = function(colors)
        colors.bg = "#000000" -- pure black
      end,
      on_highlights = function(hl, c)
        hl.Normal = { bg = "#000000" }
        hl.NormalFloat = { bg = "#000000" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")

      -- make diagnostics pop on the right
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        underline = true,
        signs = true,
      })
    end,
  },
}
