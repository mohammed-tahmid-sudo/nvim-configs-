-- Enhanced Completion Setup with Copilot
local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'copilot', priority = 100 },
    { name = 'nvim_lsp', priority = 90 },
    { name = 'luasnip', priority = 80 },
    { name = 'buffer', priority = 70 },
    { name = 'path', priority = 60 },
  }),
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 60,
      ellipsis_char = '…',
      show_labelDetails = true,
      
      -- Enhanced formatting with better icons
      before = function (entry, vim_item)
        -- Add source name with enhanced icons
        vim_item.menu = ({
          copilot = '󰚩  [Copilot]',
          nvim_lsp = '  [LSP]',
          luasnip = '󰩫  [Snippet]',
          buffer = '  [Buffer]',
          path = '  [Path]',
        })[entry.source.name]
        
        -- Add file type icons for file-related completions
        if entry.source.name == 'path' then
          local devicons = require('nvim-web-devicons')
          local icon = devicons.get_icon(vim_item.word)
          if icon then
            vim_item.kind = icon .. ' ' .. vim_item.kind
          end
        end
        
        return vim_item
      end
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
})

