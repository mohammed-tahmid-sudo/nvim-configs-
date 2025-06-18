-- Editor enhancement plugins
return {
  -- 🎯 Auto-pairing plugin - automatically closes brackets, quotes, etc.
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      local autopairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      
      autopairs.setup({
        -- Basic configuration
        check_ts = true,
        ts_config = {
          lua = {'string', 'source'},
          javascript = {'string', 'template_string'},
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        disable_in_macro = true,  -- disable when recording or executing a macro
        disable_in_visualblock = false, -- disable when insert after visual block mode
        disable_in_replace_mode = true,
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        enable_moveright = true,
        enable_afterquote = true,  -- add bracket pairs after quote
        enable_check_bracket_line = true,  --- check bracket in same line
        enable_bracket_in_quote = true, --
        enable_abbr = false, -- trigger abbreviation
        break_undo = true, -- switch for basic rule break undo sequence
        check_comma = true,
        map_cr = true,
        map_bs = true,  -- map the <BS> key
        map_c_h = false,  -- Map the <C-h> key to delete a pair
        map_c_w = false, -- map <c-w> to delete a pair if possible
      })

      -- Add custom rules for better auto-pairing
      autopairs.add_rules({
        -- Add spaces inside curly braces for functions
        Rule(' ', ' ')
          :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
          end),
        
        -- Auto-add semicolon for some languages
        Rule('', ';')
          :with_move(function(opts) return opts.char == ';' end)
          :with_pair(function() return false end)
          :with_cr(function() return false end)
          :use_key(';')
          :replace_endpair(function() return '' end),

        -- HTML/JSX tag auto-completion
        Rule('<', '>')
          :with_pair(cond.before_regex('%a'))
          :with_move(function(opts) return opts.char == '>' end),
      })

      -- Integration with nvim-cmp (if you have it)
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },

  -- 🌈 Rainbow brackets - colorful matching brackets
  {
    'HiPhish/rainbow-delimiters.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')
      
      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },

  -- ✨ Better text objects and movements
  {
    'echasnovski/mini.surround',
    version = '*',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('mini.surround').setup({
        -- Add custom surroundings to be used on top of builtin ones. For more
        -- information with examples, see `:h MiniSurround.config`.
        custom_surroundings = nil,

        -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
        highlight_duration = 500,

        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = 'sa', -- Add surrounding in Normal and Visual modes
          delete = 'sd', -- Delete surrounding
          find = 'sf', -- Find surrounding (to the right)
          find_left = 'sF', -- Find surrounding (to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'sr', -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`

          suffix_last = 'l', -- Suffix to search with "prev" method
          suffix_next = 'n', -- Suffix to search with "next" method
        },

        -- Number of lines within which surrounding is searched
        n_lines = 20,

        -- Whether to respect selection type:
        -- - Place surroundings on separate lines in linewise mode.
        -- - Place surroundings on each line in blockwise mode.
        respect_selection_type = false,

        -- How to search for surrounding (first inside current line, then inside
        -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
        -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
        -- see `:h MiniSurround.config`.
        search_method = 'cover',

        -- Whether to disable showing non-error feedback
        silent = false,
      })
    end
  },

  -- 📏 Indent guides for better code structure visualization
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = false,
        injected_languages = false,
        highlight = { "Function", "Label" },
        priority = 500,
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
}

