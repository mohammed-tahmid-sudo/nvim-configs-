-- -- Status line (Gruvbox)
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local gruvbox = require("lualine.themes.gruvbox")

--     -- extra dark background
--     local darker_bg = "#FFFFFF"

--     local custom_gruvbox = vim.tbl_deep_extend("force", gruvbox, {
--       normal  = { c = { bg = darker_bg } },
--       insert  = { c = { bg = darker_bg } },
--       visual  = { c = { bg = darker_bg } },
--       replace = { c = { bg = darker_bg } },
--       command = { c = { bg = darker_bg } },
--     })

--     require("lualine").setup({
--       options = {
--         theme = custom_gruvbox,
--         section_separators = "",
--         component_separators = "",
--       },
--     })
--   end
-- }



return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup()
  end
}

