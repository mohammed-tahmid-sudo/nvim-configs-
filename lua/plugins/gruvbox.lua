return {
    {
        "morhetz/gruvbox",
        config = function()
            vim.o.background = "dark"        -- must be "dark"
            vim.o.termguicolors = true       -- true colors
            vim.g.gruvbox_contrast_dark = "hard"  -- extra dark
            vim.g.gruvbox_italic = 1
            vim.g.gruvbox_bold = 1
            vim.cmd("colorscheme gruvbox")
        end
    }
}

