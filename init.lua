-- init.lua

-- 1) Leader & Basic Options
vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

-- 2) Random Theme Selection
local themes = {
  "catppuccin", "rose-pine", "tokyonight", "nightfox", "kanagawa", "gruvbox-material",
  "everforest", "gruvbox", "dracula", "ayu", "nord", "darkplus", "vscode",
  "material", "github_dark", "calvera", "poimandres", "nightfly", "molokai",
  "tender", "melange", "spaceduck", "onenord", "nordic", "doom-one", "night-owl",
  "palenight", "oxocarbon", "aurora", "mellow", "falcon", "onedark",
  "solarized", "monokai-pro", "fluoromachine", "zephyr", "iceberg", "sonokai",
  "tokyodark", "one", "space", "deus", "sweetie", "citruszest", "juliana",
  "midnight", "bamboo", "edge", "hardhacker", "vs-code", "caret", "cobalt2",
  "rasmus", "vimdark", "zenburn", "moonfly", "one_monokai", "paper",
  "noctishc", "codedark", "boo", "starry", "oxocarbon-lua", "solarized-lua",
  "codeschool", "bluloco", "xcode", "github-dark", "roshni", "min-theme"
}
math.randomseed(os.time())
local theme = themes[math.random(#themes)]

-- 3) Lazy.nvim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Git integration
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },

  -- LSP & Completion
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  
  -- Copilot
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -- Themes
  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "rose-pine/neovim", name = "rose-pine", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "morhetz/gruvbox", lazy = true },
  { "dracula/vim", name = "dracula", lazy = true },
  { 
    "ayu-theme/ayu-vim", 
    lazy = true,
    config = function()
      vim.g.ayucolor = "dark"
    end
  },
  { "shaunsingh/nord.nvim", lazy = true },
  { "lunarvim/darkplus.nvim", lazy = true },
  { "Mofiqul/vscode.nvim", lazy = true },
  { "marko-cerovac/material.nvim", lazy = true },
  {
    "projekt0n/github-nvim-theme",
    name = "github_dark",
    lazy = true,
    config = function()
      require("github-theme").setup({ theme_style = "dark" })
    end
  },
  { "yashguptaz/calvera-dark.nvim", lazy = true },
  { "olivercederborg/poimandres.nvim", lazy = true },
  { "NTBBloodbath/doom-one.nvim", lazy = true },
  { "oxfist/night-owl.nvim", lazy = true },
  { "drewtempelmeyer/palenight.vim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  { "ray-x/aurora", lazy = true },
  { "kvrohit/mellow.nvim", lazy = true },
  { "fenetikm/falcon", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "loctvl842/monokai-pro.nvim", lazy = true },
  { "maxmx03/fluoromachine.nvim", lazy = true },
  { "glepnir/zephyr-nvim", lazy = true },
  { "cocopon/iceberg.vim", lazy = true },
  { "sainnhe/sonokai", lazy = true },
  { "tiagovla/tokyodark.nvim", lazy = true },
  { "Th3Whit3Wolf/one-nvim", lazy = true },
  { "Th3Whit3Wolf/space-nvim", lazy = true },
  { "shaunsingh/solarized.nvim", lazy = true },
  { "theniceboy/nvim-deus", lazy = true },
  { "NTBBloodbath/sweetie.nvim", lazy = true },
  { "zootedb0t/citruszest.nvim", lazy = true },
  { "kaiuri/nvim-juliana", lazy = true },
  { "dasupradyumna/midnight.nvim", lazy = true },
  { "ribru17/bamboo.nvim", lazy = true },
  { "sainnhe/edge", lazy = true },
  { "hardhackerlabs/theme-vim", lazy = true },
  { "askfiy/visual_studio_code", lazy = true },
  { "projekt0n/caret.nvim", lazy = true },
  { "lalitmee/cobalt2.nvim", lazy = true },
  { "kvrohit/rasmus.nvim", lazy = true },
  { "ldelossa/vimdark", lazy = true },
  { "phha/zenburn.nvim", lazy = true },
  { "bluz71/vim-moonfly-colors", lazy = true },
  { "cpea2506/one_monokai.nvim", lazy = true },
  { "yorickpeterse/vim-paper", lazy = true },
  { "iagorrr/noctishc.nvim", lazy = true },
  { "tomasiser/vim-code-dark", lazy = true },
  { "rockerBOO/boo-colorscheme-nvim", lazy = true },
  { "ray-x/starry.nvim", lazy = true },
  { "sindrets/oxocarbon-lua.nvim", lazy = true },
  { "ishan9299/nvim-solarized-lua", lazy = true },
  { "adisen99/codeschool.nvim", lazy = true },
  { "uloco/bluloco.nvim", lazy = true },
  { "arzg/vim-colors-xcode", lazy = true },
  { "vv9k/vim-github-dark", lazy = true },
  { "shaeinst/roshnivim-cs", lazy = true },
  { "datsfilipe/min-theme.nvim", lazy = true },

  -- Lualine Status Bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine_themes = {
        ["gruvbox-material"] = "gruvbox",
        everforest  = "everforest",
        darkplus    = "onedark",
        github_dark = "auto",
        material    = "material",
        vscode      = "vscode",
        ayu         = "ayu_dark",
        dracula     = "dracula",
        catppuccin  = "catppuccin",
        tokyonight  = "tokyonight",
        nightfox    = "nightfox",
        kanagawa    = "kanagawa",
        onedark     = "onedark",
        nord        = "nord",
        ["doom-one"] = "doom-one",
        poimandres  = "poimandres",
        ["rose-pine"] = "rose-pine",
        spaceduck   = "spaceduck",
        onenord     = "onenord",
        nordic      = "nordic",
      }
      require('lualine').setup({
        options = {
          theme              = lualine_themes[theme] or "auto",
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled      = true,
        },
        sections = {
          lualine_a = { { 'mode', upper = false } },
          lualine_b = {
            { 'branch', icon = '' },
            { 'diff', colored = true, symbols = { added = '+', modified = '~', removed = '-' } },
            { 'diagnostics', sources = { 'nvim_lsp' } },
          },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
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

  -- Floaterm
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_width    = 0.8
      vim.g.floaterm_height   = 0.5
      vim.g.floaterm_wintype  = 'float'
      vim.g.floaterm_position = 'center'
      vim.g.floaterm_autoclose = 1
      vim.keymap.set('n', '<leader>t', ':FloatermToggle<CR>', { noremap = true, silent = true })
    end
  },

  -- Code Runner & Auto-save
  {
    'CRAG666/code_runner.nvim',
    dependencies = 'CRAG666/betterTerm.nvim',
    config = function()
      require('code_runner').setup({
        mode = 'float',
        filetype = { python = "python3 -u", c = "gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt" },
      })
    end
  },
  {
    'Pocco81/auto-save.nvim',
    config = function() 
      require('auto-save').setup() 
    end
  },
})

-- 4) Apply selected theme
vim.cmd.colorscheme(theme)

-- 5) Auto-command to open Telescope if starting in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == '.' then require('telescope.builtin').find_files() end
  end
})

-- 6) WhichKey Mappings
require("which-key").add({
  -- File
  { "<leader>f",  group = "file"                   },
  { "<leader>ff", ":Telescope find_files<CR>",  desc = "Find File",   remap = false },
  { "<leader>fr", ":Telescope oldfiles<CR>",    desc = "Recent File", remap = false },
  { "<leader>fn", ":enew<CR>",                  desc = "New File",     remap = false },

  -- Buffer
  { "<leader>b",  group = "buffer"                 },
  { "<leader>bl", ":ls<CR>",                    desc = "List Buffers", remap = false },
  { "<leader>bn", ":bnext<CR>",                 desc = "Next Buffer",  remap = false },
  { "<leader>bp", ":bprevious<CR>",             desc = "Prev Buffer",  remap = false },
  { "<leader>bd", ":bdelete<CR>",               desc = "Delete Buffer",remap = false },

  -- Git
  { "<leader>g",  group = "git"                    },
  { "<leader>gs", ":Git status<CR>",             desc = "Git Status",   remap = false },
  { "<leader>ga", ":Git add .<CR>",              desc = "Git Add All",  remap = false },
  { "<leader>gc", ":Git commit<CR>",             desc = "Git Commit",   remap = false },
  { "<leader>gp", ":Git push<CR>",               desc = "Git Push",     remap = false },
  { "<leader>gl", ":Git pull<CR>",               desc = "Git Pull",     remap = false },
  { "<leader>gb", ":Git blame<CR>",              desc = "Git Blame",    remap = false },
}, {
  mode   = "n",
  noremap = true,
  silent = true,
})

-- 7) LSP Setup
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}

-- 8) Enhanced Completion Setup with Copilot
local cmp = require'cmp'
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
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
})

-- 9) Auto-save notification
vim.api.nvim_create_augroup("file_saved_group", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "file_saved_group",
  pattern = "*",
  callback = function() print("File saved!") end,
})

-- 10) Run Command for Executing Code
vim.api.nvim_create_user_command('Run', function()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  if ft == 'python' then print(vim.fn.system('python3 ' .. file))
  elseif ft == 'c' then
    local exe = file:match("(.+)%..+$")
    vim.fn.system('gcc ' .. file .. ' -o ' .. exe)
    print(vim.fn.system(exe))
  else
    print('Unsupported file type: ' .. ft)
  end
end, {})

-- 11) Floating Terminal Runner via Floaterm
function RunFile()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  local cmd
  if ft == 'python' then cmd = 'FloatermNew --autoclose=0 python3 ' .. file
  elseif ft == 'lua' then cmd = 'FloatermNew --autoclose=1 lua ' .. file
  elseif ft == 'c' then
    local exe = vim.fn.expand('%:r')
    cmd = 'FloatermNew --autoclose=1 sh -c "gcc ' .. file .. ' -o ' .. exe .. ' && ./' .. exe .. '"'
  else
    print('No runner for filetype: ' .. ft)
    return
  end
  vim.cmd(cmd)
end
vim.api.nvim_set_keymap('n', '<C-Space>', ':lua RunFile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', 'w', { noremap = true, silent = true })
