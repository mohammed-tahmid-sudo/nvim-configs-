-- UI and interface plugins
return {
  -- 📑 Beautiful tab/buffer line with file icons 📑
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
          
          -- 🎨 Essential visual settings
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          buffer_close_icon = '✗',
          modified_icon = '●',
          close_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          
          -- 📁 DISABLE ICONS
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          
          -- 🏷️ Simple tab behavior
          separator_style = "thin",
          always_show_bufferline = true,
          
          -- 🎯 Enable diagnostics
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          
          -- 🎨 DISABLE COLOR ICONS
          color_icons = false,
          
          -- Custom icon handling
          get_element_icon = function(element)
            local devicons = require('nvim-web-devicons')
            local icon, hl = devicons.get_icon(element.name, element.extension, { default = true })
            return icon, hl
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
          lualine_a = { 
            { 
              'mode', 
              upper = false,
              fmt = function(str)
                local mode_map = {
                  ['NORMAL'] = '🚀 ' .. str,
                  ['INSERT'] = '✏️ ' .. str,
                  ['VISUAL'] = '👁️ ' .. str,
                  ['V-LINE'] = '📝 ' .. str,
                  ['V-BLOCK'] = '🧱 ' .. str,
                  ['COMMAND'] = '⚡ ' .. str,
                  ['SELECT'] = '🎯 ' .. str,
                  ['S-LINE'] = '📋 ' .. str,
                  ['S-BLOCK'] = '🗃️ ' .. str,
                  ['REPLACE'] = '🔄 ' .. str,
                  ['V-REPLACE'] = '🔃 ' .. str,
                  ['EX'] = '⚙️ ' .. str,
                  ['MORE'] = '➕ ' .. str,
                  ['CONFIRM'] = '✅ ' .. str,
                  ['SHELL'] = '🐚 ' .. str,
                  ['TERM'] = '💻 ' .. str,
                }
                return mode_map[str] or '🌟 ' .. str
              end
            } 
          },
          lualine_b = {
            { 
              'branch', 
              icon = '🌿',
              fmt = function(str)
                if str == '' then return '🚫 No Branch' end
                return '🌿 ' .. str
              end
            },
            { 
              'diff', 
              colored = true, 
              symbols = { 
                added = '✅ ', 
                modified = '🔄 ', 
                removed = '❌ ' 
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
                error = '🚨 ',
                warn = '⚠️ ',
                info = 'ℹ️ ',
                hint = '💡 '
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
                modified = ' 📝',
                readonly = ' 🔒',
                unnamed = '📄 Untitled',
                newfile = '✨ New',
              },
              fmt = function(str)
                local devicons = require('nvim-web-devicons')
                local filename = vim.fn.expand('%:t')
                local extension = vim.fn.expand('%:e')
                local icon, color = devicons.get_icon(filename, extension, { default = true })
                if icon then
                  return icon .. ' ' .. str
                end
                return '📄 ' .. str
              end
            } 
          },
          lualine_x = { 
            {
              'encoding',
              fmt = function(str)
                local encoding_icons = {
                  ['utf-8'] = '🌐 UTF-8',
                  ['utf-16'] = '🌍 UTF-16',
                  ['latin1'] = '🇱 Latin1',
                  ['ascii'] = '🔤 ASCII',
                }
                return encoding_icons[str] or '📝 ' .. str
              end
            },
            {
              'fileformat',
              fmt = function(str)
                local format_icons = {
                  unix = '🐧 Unix',
                  dos = '🪟 DOS',
                  mac = '🍎 Mac',
                }
                return format_icons[str] or '📋 ' .. str
              end
            },
            {
              'filetype',
              colored = true,
              icon_only = false,
              fmt = function(str)
                local devicons = require('nvim-web-devicons')
                local filename = vim.fn.expand('%:t')
                local extension = vim.fn.expand('%:e')
                local icon, color = devicons.get_icon(filename, extension, { default = true })
                if icon then
                  return icon .. ' ' .. str
                end
                return '📄 ' .. str
              end
            }
          },
          lualine_y = { 
            {
              'progress',
              fmt = function(str)
                return '📊 ' .. str
              end
            }
          },
          lualine_z = { 
            {
              'location',
              fmt = function(str)
                return '📍 ' .. str
              end
            },
            {
              function()
                local line_count = vim.fn.line('$')
                if line_count < 1000 then
                  return '📄 ' .. line_count .. 'L'
                elseif line_count < 10000 then
                  return '📖 ' .. line_count .. 'L'
                else
                  return '📚 ' .. line_count .. 'L'
                end
              end
            },
            {
              function()
                local words = vim.fn.wordcount().words or 0
                if words < 100 then
                  return '✏️ ' .. words .. 'W'
                elseif words < 1000 then
                  return '📝 ' .. words .. 'W'
                else
                  return '📖 ' .. words .. 'W'
                end
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

