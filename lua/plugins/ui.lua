-- UI and interface plugins
return {
  -- Beautiful tab/buffer line with file icons
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      -- Ensure devicons is loaded first
      require('nvim-web-devicons').setup()
      
      require('bufferline').setup({
        options = {
          mode = "buffers",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          
          -- Optimized visual settings for better icon spacing
          indicator = {
            icon = ' ▎',
            style = 'icon',
          },
          buffer_close_icon = ' ',
          modified_icon = ' ●',
          close_icon = ' ',
          left_trunc_marker = ' ',
          right_trunc_marker = ' ',
          
          -- Enhanced icon display
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          
          -- Better tab spacing for larger icons
          separator_style = "slope",
          always_show_bufferline = true,
          tab_size = 22,  -- Increased for better icon display
          max_name_length = 20,  -- Slightly increased
          truncate_names = true,
          
          -- Enhanced diagnostics with proper spacing
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return icon .. count
          end,
          
          -- Enhanced color icons
          color_icons = true,
          get_element_icon = function(element)
            local devicons = require('nvim-web-devicons')
            local icon, hl = devicons.get_icon(element.name, element.extension, { default = true })
            return icon, hl
          end,
          
          -- Custom formatting for better visual consistency
          name_formatter = function(opts)
            return opts.name:gsub("%.%w+$", "")
          end,
        }
      })
      
      -- 🎯 Tab navigation keymaps
      local opts = { noremap = true, silent = true, desc = "Buffer navigation" }
      
      -- Tab navigation with Tab and Shift+Tab
      vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
      vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
      
      -- Additional buffer management
      vim.keymap.set('n', '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', opts)
      vim.keymap.set('n', '<leader>bc', '<Cmd>bdelete<CR>', opts)
      
      -- Direct buffer access (Alt + number)
      for i = 1, 9 do
        vim.keymap.set('n', '<A-' .. i .. '>', '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>', opts)
      end
    end,
  },
  -- Lualine Status Bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local theme = _G.selected_theme or "auto"
      local lualine_themes = {
        -- Core Popular Themes
        ["gruvbox-material"] = "gruvbox",
        everforest = "everforest",
        darkplus = "onedark",
        github_dark = "github_dark",
        github_dark_default = "github_dark",
        github_dark_dimmed = "github_dark",
        github_dark_high_contrast = "github_dark",
        material = "material",
        vscode = "vscode",
        ayu = "ayu_dark",
        dracula = "dracula",
        catppuccin = "catppuccin",
        ["catppuccin-latte"] = "catppuccin",
        ["catppuccin-frappe"] = "catppuccin",
        ["catppuccin-macchiato"] = "catppuccin",
        ["catppuccin-mocha"] = "catppuccin",
        tokyonight = "tokyonight",
        ["tokyonight-night"] = "tokyonight",
        ["tokyonight-storm"] = "tokyonight",
        ["tokyonight-day"] = "tokyonight",
        ["tokyonight-moon"] = "tokyonight",
        nightfox = "nightfox",
        dayfox = "nightfox",
        dawnfox = "nightfox",
        duskfox = "nightfox",
        nordfox = "nightfox",
        terafox = "nightfox",
        carbonfox = "nightfox",
        kanagawa = "kanagawa",
        ["kanagawa-wave"] = "kanagawa",
        ["kanagawa-dragon"] = "kanagawa",
        ["kanagawa-lotus"] = "kanagawa",
        onedark = "onedark",
        nord = "nord",
        ["nord-vim"] = "nord",
        ["doom-one"] = "doom-one",
        poimandres = "poimandres",
        ["rose-pine"] = "rose-pine",
        ["rose-pine-main"] = "rose-pine",
        ["rose-pine-moon"] = "rose-pine",
        ["rose-pine-dawn"] = "rose-pine",
        onenord = "onenord",
        nordic = "nordic",
        gruvbox = "gruvbox",
        
        -- Dark Themes Collection
        calvera = "auto",
        ["night-owl"] = "auto",
        palenight = "palenight",
        oxocarbon = "auto",
        ["oxocarbon-lua"] = "auto",
        aurora = "auto",
        mellow = "auto",
        falcon = "auto",
        ["monokai-pro"] = "molokai",
        fluoromachine = "auto",
        zephyr = "auto",
        iceberg = "iceberg",
        sonokai = "sonokai",
        tokyodark = "auto",
        one = "onelight",
        space = "auto",
        solarized = "solarized_dark",
        ["solarized-lua"] = "solarized_dark",
        solarized8 = "solarized_dark",
        deus = "auto",
        sweetie = "auto",
        citruszest = "auto",
        juliana = "auto",
        midnight = "auto",
        bamboo = "auto",
        edge = "edge",
        hardhacker = "auto",
        visual_studio_code = "vscode",
        caret = "auto",
        cobalt2 = "auto",
        rasmus = "auto",
        vimdark = "auto",
        zenburn = "zenburn",
        moonfly = "moonfly",
        one_monokai = "molokai",
        paper = "auto",
        noctishc = "auto",
        codedark = "codedark",
        boo = "auto",
        starry = "auto",
        codeschool = "auto",
        bluloco = "auto",
        xcode = "auto",
        ["github-dark"] = "github_dark",
        roshni = "auto",
        ["min-theme"] = "auto",
        
        -- Additional Premium Themes
        ["neovim-ayu"] = "ayu_dark",
        ["base16-default-dark"] = "base16",
        ["base16-ocean"] = "base16",
        melange = "auto",
        primer_dark = "auto",
        moonlight = "auto",
        ["oceanic-next"] = "oceanicnext",
        tender = "auto",
        nightfly = "nightfly",
        challenger_deep = "auto",
        PaperColor = "PaperColor",
        ["forest-night"] = "auto",
        gotham = "auto",
        srcery = "auto",
        ["vim-deus"] = "auto",
        neodark = "auto",
        kuroi = "auto",
        ["vim-one"] = "onelight",
        ["vim-one-light"] = "onelight",
        dogrun = "auto",
        synthwave84 = "auto",
        embark = "auto",
        abstract = "auto",
        ["pink-moon"] = "auto",
        fahrenheit = "auto",
        yowish = "auto",
        scheakur = "auto",
        afterglow = "auto",
        ["deep-space"] = "auto",
        ["two-firewatch"] = "auto",
        ["hybrid-material"] = "auto",
        ["vim-material"] = "material",
        rigel = "auto",
        snazzy = "auto",
        hybrid = "auto",
        seoul256 = "seoul256",
        jellybeans = "jellybeans",
        ["jellybeans-nvim"] = "jellybeans",
        molokai = "molokai",
        wombat256 = "wombat",
        railscasts = "auto",
        
        -- Modern Neovim-specific themes
        ["oh-lucy"] = "auto",
        onedarkpro = "onedark",
        ["gruvbox-baby"] = "gruvbox",
        tundra = "auto",
        everblush = "auto",
        noctis = "auto",
        zephyrium = "auto",
        adwaita = "auto",
        lunar = "auto",
        monochrome = "auto",
        minimal = "auto",
        aquarium = "auto",
        onebuddy = "onelight",
        ["nvim-hybrid"] = "auto",
        ["blue-moon"] = "auto",
        zenbones = "auto",
        
        -- Light themes
        onehalflight = "onelight",
        ["256_noir"] = "auto",
        apprentice = "auto",
        orbital = "auto",
        happy_hacking = "auto",
        acme = "auto",
        mayansmoke = "auto",
        iosvkem = "auto",
        
        -- Classic vim themes
        desert = "auto",
        murphy = "auto",
        pablo = "auto",
        peachpuff = "auto",
        ron = "auto",
        shine = "auto",
        slate = "auto",
        torte = "auto",
        zellner = "auto",
        blue = "auto",
        darkblue = "auto",
        default = "auto",
        delek = "auto",
        evening = "auto",
        industry = "auto",
        koehler = "auto",
        morning = "auto",
        elflord = "auto"
      }
      require('lualine').setup({
        options = {
          theme              = lualine_themes[theme] or "auto",
  	  section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled      = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            {
              'branch',
              icon = ' ',
              fmt = function(str)
                return str:len() > 15 and str:sub(1, 15) .. '…' or str
              end
            },
            {
              'diff',
              colored = true,
              symbols = {
                added = ' ',
                modified = ' ',
                removed = ' '
              },
              diff_color = {
                added = { fg = '#98be65' },
                modified = { fg = '#51afef' },
                removed = { fg = '#ff6c6b' },
              },
            },
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              symbols = {
                error = ' ',
                warn = ' ',
                info = ' ',
                hint = ' '
              },
              diagnostics_color = {
                error = { fg = '#ff6c6b' },
                warn = { fg = '#ECBE7B' },
                info = { fg = '#51afef' },
                hint = { fg = '#98be65' },
              },
            },
          },
          lualine_c = {
            {
              'filename',
              path = 1,
              symbols = {
                modified = ' ●',
                readonly = ' ',
                unnamed = ' Untitled',
                newfile = ' New',
              },
              fmt = function(str)
                -- Add file icon with proper spacing
                local devicons = require('nvim-web-devicons')
                local filename = vim.fn.expand('%:t')
                local extension = vim.fn.expand('%:e')
                local icon, _ = devicons.get_icon(filename, extension, { default = true })
                if icon and filename ~= '' then
                  return icon .. '  ' .. str
                end
                return '  ' .. str
              end
            }
          },
          lualine_x = {
            {
              'encoding',
              fmt = function(str)
                return str == 'utf-8' and '' or str
              end
            },
            {
              'fileformat',
              symbols = {
                unix = ' ',
                dos = ' ',
                mac = ' ',
              }
            },
            {
              'filetype',
              icon_only = false,
              colored = true,
              icon = { align = 'left' }
            }
          },
          lualine_y = { 'progress' },
          lualine_z = {
            {
              'location',
              icon = ' ',
            },
            {
              function()
                return ' ' .. vim.fn.line('$') .. 'L'
              end
            },
            {
              function()
                local words = vim.fn.wordcount().words or 0
                return '󰈭 ' .. words .. 'W'
              end
            }
          },
        },
        extensions = { 'fugitive' },
      })
    end
  },

  -- Telescope & Which-Key
  {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'folke/which-key.nvim',
    config = function() 
      require('which-key').setup() 
    end
  },
}

