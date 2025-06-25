-- Optimized nvim-web-devicons configuration with proper sizing
return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        -- Globally enable default icons
        default = true,
        -- Strictly disable unknown files
        strict = true,
        -- Color icons based on filetype
        color_icons = true,
        -- Override global icon with bigger/more visible variants where possible
        override = {
          default_icon = {
icon = "📁",
            color = "#6d8086",
            cterm_color = "66",
            name = "Default",
          },
        },
        -- Override by filename for consistent sizing
        override_by_filename = {
          ['.gitignore'] = {
            icon = '',
            color = '#f1502f',
            name = 'Gitignore'
          },
          ['README.md'] = {
            icon = '',
            color = '#519aba',
            name = 'Readme'
          },
          ['Makefile'] = {
            icon = '',
            color = '#427819',
            name = 'Makefile'
          },
          ['Dockerfile'] = {
            icon = '',
            color = '#0db7ed',
            name = 'Docker'
          },
          ['package.json'] = {
            icon = '',
            color = '#e8274b',
            name = 'PackageJson'
          },
        },
        -- Override by extension for better visual consistency
        override_by_extension = {
          ['log'] = {
            icon = '',
            color = '#81e043',
            name = 'Log'
          },
        },
      })
    end
  },
  
  {
    'onsails/lspkind.nvim',
    event = { "InsertEnter" },
    opts = {
      mode = 'symbol_text',
      preset = 'codicons',
      -- Enhanced symbol map with comprehensive LSP icons
      symbol_map = {
        Text = "󰉿",          -- Text/document icon
        Method = "󰆧",        -- Method/function icon
        Function = "󰊕",      -- Function icon
        Constructor = "",     -- Constructor icon
        Field = "󰜢",         -- Field/property icon
        Variable = "󰀫",      -- Variable icon
        Class = "󰠱",         -- Class icon
        Interface = "󰜰",      -- Interface icon
        Module = "",         -- Module/package icon
        Property = "󰜢",      -- Property icon
        Unit = "󰑭",          -- Unit/measurement icon
        Value = "󰎠",         -- Value icon
        Enum = "",          -- Enum icon
        Keyword = "󰌋",       -- Keyword icon
        Snippet = "󰩫",        -- Snippet icon
        Color = "󰏘",         -- Color icon
        File = "󰈙",          -- File icon
        Reference = "󰈇",     -- Reference icon
        Folder = "󰉋",        -- Folder icon
        EnumMember = "",     -- Enum member icon
        Constant = "󰏿",      -- Constant icon
        Struct = "󰙅",        -- Struct icon
        Event = "",          -- Event icon
        Operator = "󰆕",      -- Operator icon
        TypeParameter = "",  -- Type parameter icon
        Copilot = "󰚩",        -- Copilot icon
        -- Additional LSP-specific icons
        Array = "󰅪",         -- Array icon
        Boolean = "◩",        -- Boolean icon
        Key = "󰌋",           -- Key icon
        Namespace = "󰌗",     -- Namespace icon
        Null = "󰟢",          -- Null icon
        Number = "󰎠",        -- Number icon
        Object = "󰅩",        -- Object icon
        Package = "󰏗",       -- Package icon
        String = "󰀬",        -- String icon
      },
    },
    config = function(_, opts)
      require('lspkind').init(opts)
    end
  }
}
