------------------------
-- Basic Options
vim.opt.clipboard = 'unnamedplus'
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = ' '

-- Packer Setup
vim.cmd [[packadd packer.nvim]]
require('packer').startup({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = "rounded" })
    end
  },
  function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- LSP & Completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- UI + Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim", as = "rose-pine" }
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim"
    use "rebelot/kanagawa.nvim"
    use "sainnhe/gruvbox-material"
    use "sainnhe/everforest"
    use "morhetz/gruvbox"
    use { "dracula/vim", as = "dracula" }
    use "ayu-theme/ayu-vim"
    use "shaunsingh/nord.nvim"
    use "lunarvim/darkplus.nvim"
    use "Mofiqul/vscode.nvim"
    use "marko-cerovac/material.nvim"
    use "projekt0n/github-nvim-theme"
    use "yashguptaz/calvera-dark.nvim"
    use "olivercederborg/poimandres.nvim"
    use { "bluz71/vim-nightfly-colors", as = "nightfly" }
    use "tomasr/molokai"
    use "jacoborus/tender.vim"
    use "savq/melange-nvim"
    use { "pineapplegiant/spaceduck", as = "spaceduck" }
    use "rmehri01/onenord.nvim"
    use "AlexvZyl/nordic.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "NTBBloodbath/doom-one.nvim"
    use "oxfist/night-owl.nvim"
    use "drewtempelmeyer/palenight.vim"
    use "Shatur/neovim-ayu"
    use "nyoom-engineering/oxocarbon.nvim"
    use "ray-x/aurora"
    use "kvrohit/mellow.nvim"
    use "fenetikm/falcon"
    use "navarasu/onedark.nvim"
    use "loctvl842/monokai-pro.nvim"
    use "maxmx03/fluoromachine.nvim"
    use "glepnir/zephyr-nvim"
    use "cocopon/iceberg.vim"
    use "sainnhe/sonokai"
    use "tiagovla/tokyodark.nvim"
    use "Th3Whit3Wolf/one-nvim"
    use "Th3Whit3Wolf/space-nvim"
    use "shaunsingh/solarized.nvim"
    use "romgrk/doom-one.vim"
    use "theniceboy/nvim-deus"
    use "NTBBloodbath/sweetie.nvim"
    use "glepnir/oceanic-material"
    use "zootedb0t/citruszest.nvim"
    use "mvpopuk/inspired-github.vim"
    use "kaiuri/nvim-juliana"
    use "dasupradyumna/midnight.nvim"
    use "ribru17/bamboo.nvim"
    use "sainnhe/edge"
    use "hardhackerlabs/theme-vim"
    use "askfiy/visual_studio_code"
    use "projekt0n/caret.nvim"
    use "lalitmee/cobalt2.nvim"
    use "kvrohit/rasmus.nvim"
    use "ldelossa/vimdark"
    use "phha/zenburn.nvim"
    use "bluz71/vim-moonfly-colors"
    use "cpea2506/one_monokai.nvim"
    use "yorickpeterse/vim-paper"
    use "iagorrr/noctishc.nvim"
    use "tomasiser/vim-code-dark"
    use "rockerBOO/boo-colorscheme-nvim"
    use "ray-x/starry.nvim"
    use "sindrets/oxocarbon-lua.nvim"
    use "ishan9299/nvim-solarized-lua"
    use "adisen99/codeschool.nvim"
    use "uloco/bluloco.nvim"
    use "arzg/vim-colors-xcode"
    use "vv9k/vim-github-dark"
    use "shaeinst/roshnivim-cs"
    use "datsfilipe/min-theme.nvim"

    -- Lualine Status Bar
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      config = function()
        local lualine_themes = {
          ["gruvbox-material"] = "gruvbox",
          everforest = "everforest",
          darkplus = "onedark",
          github_dark = "auto",
          material = "material",
          vscode = "vscode",
          ayu = "ayu_dark",
          dracula = "dracula",
          catppuccin = "catppuccin",
          tokyonight = "tokyonight",
          nightfox = "nightfox",
          kanagawa = "kanagawa",
          onedark = "onedark",
          nord = "nord",
          ["doom-one"] = "doom-one",
          poimandres = "poimandres",
          ["rose-pine"] = "rose-pine",
          spaceduck = "spaceduck",
          onenord = "onenord",
          nordic = "nordic",
          melange = "auto",
          nightfly = "nightfly",
          oxocarbon = "auto",
          aurora = "auto",
          mellow = "auto",
          falcon = "auto",
          iceberg = "auto",
          sonokai = "sonokai",
          tokyodark = "tokyodark",
          one = "onedark",
          space = "auto",
          deus = "auto",
          sweetie = "auto",
          citruszest = "auto",
          juliana = "auto",
          midnight = "auto",
          bamboo = "bamboo",
          edge = "edge",
          hardhacker = "auto",
          ["vs-code"] = "vscode",
          caret = "auto",
          cobalt2 = "auto",
          rasmus = "auto",
          vimdark = "auto",
          zenburn = "zenburn",
          moonfly = "moonfly",
          one_monokai = "auto",
          paper = "auto",
          noctishc = "auto",
          codedark = "codedark",
          boo = "auto",
          starry = "auto",
          ["oxocarbon-lua"] = "auto",
          ["solarized-lua"] = "solarized",
          codeschool = "auto",
          bluloco = "auto",
          xcode = "auto",
          ["github-dark"] = "auto",
          roshni = "auto",
          ["min-theme"] = "auto",
        }
        lualine.setup({
          options = {
            theme = lualine_themes[theme] or "auto",  -- Uses your selected random theme
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
            icons_enabled = true,
          },
          sections = {
            lualine_a = { { 'mode', upper = false } },
            lualine_b = {
              { 'branch', icon = '' },
              { 'diff',
                colored = true,
                diff_color = {
                  added = { fg = "#98be65" },
                  modified = { fg = "#ecbe7b" },
                  removed = { fg = "#ff6c6b" },
                },
                symbols = { added = '+', modified = '~', removed = '-' },
              },
              { 'diagnostics',
                sources = { 'nvim_lsp' },
                symbols = { error = ' ', warn  = ' ', info  = ' ', hint  = ' ' },
              },
            },
            lualine_c = { { 'filename', path = 1 } },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
          },
          extensions = { 'fugitive' },
        })
      end
    }

    -- Telescope, Which-Key & Floating Runners
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup {}
      end
    }
    use {
      'devkvlt/floaty.nvim',
      config = function()
        require('floaty').setup({
          runners = {
            python = 'python3 {}',
            lua = 'lua {}',
          }
        })
      end
    }
    use {
      'CRAG666/code_runner.nvim',
      requires = 'CRAG666/betterTerm.nvim',
      config = function()
        require('code_runner').setup({
          mode = 'float',
          filetype = {
            python = "python3 -u",
            c = "gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt",
          },
        })
      end
    }
    use {
      'Pocco81/auto-save.nvim',
      config = function()
        require('auto-save').setup({})
      end
    }
  end
})

-- Auto-command to open Telescope if starting in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == '.' then
      require('telescope.builtin').find_files()
    end
  end
})

-- WhichKey Mappings
local wk = require("which-key")
wk.register({
  f = {
    name = "file",
    f = { ":Telescope find_files<CR>", "Find File" },
    r = { ":Telescope oldfiles<CR>", "Recent File" },
    n = { ":enew<CR>", "New File" },
  },
  b = {
    name = "buffer",
    l = { ":ls<CR>", "List Buffers" },
    n = { ":bnext<CR>", "Next Buffer" },
    p = { ":bprevious<CR>", "Previous Buffer" },
    d = { ":bdelete<CR>", "Delete Buffer" },
  },
}, { prefix = "<leader>" })

-- LSP Setup
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}

-- Completion Setup
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-S-Space>'] = cmp.mapping.complete(),
    ['<Up>']    = cmp.mapping.select_prev_item(),
    ['<Down>']  = cmp.mapping.select_next_item(),
    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>']    = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
})

-- Auto-save notification on file write
vim.api.nvim_create_augroup("file_saved_group", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "file_saved_group",
  pattern = "*",
  callback = function()
    print("File saved!")
  end,
})

-- Run Command for Executing Code
vim.api.nvim_create_user_command('Run', function()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  local output = ""
  if ft == 'python' then
    output = vim.fn.system('python3 ' .. file)
  elseif ft == 'c' then
    local exe = file:match("(.+)%..+$")
    vim.fn.system('gcc ' .. file .. ' -o ' .. exe)
    output = vim.fn.system(exe)
  else
    output = "Unsupported file type: " .. ft
  end
  print(output)
end, {})

-- Floating Terminal Runner
function RunFile()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  local cmd

  if ft == 'python' then
    cmd = 'python3 ' .. file
  elseif ft == 'lua' then
    cmd = 'lua ' .. file
  elseif ft == 'c' then
    local exe = vim.fn.expand('%:r')
    cmd = 'gcc ' .. file .. ' -o ' .. exe .. ' && ./' .. exe
  else
    print('No runner defined for filetype: ' .. ft)
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.ceil(vim.o.columns * 0.8)
  local height = math.ceil(vim.o.lines * 0.5)
  local row = math.ceil((vim.o.lines - height) / 2)
  local col = math.ceil((vim.o.columns - width) / 2)
  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  }
  local win = vim.api.nvim_open_win(buf, true, opts)
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', { noremap = true, silent = true })
  vim.fn.termopen(cmd, { cwd = vim.fn.getcwd() })
  vim.cmd("startinsert")
end

vim.api.nvim_set_keymap('n', '<c-space>', ':lua RunFile()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'y', ':+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yy', ':+yy', { noremap = true, silent = true })

-- Random Theme Selection
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

if theme == "github_dark" then
  require("github-theme").setup({ theme_style = "dark" })
elseif theme == "ayu" then
  vim.g.ayucolor = "dark"
  vim.cmd("colorscheme ayu")
else
  vim.cmd("colorscheme " .. theme)
end

vim.notify("Random theme: " .. theme)

-- Adjust lualine theme based on random theme
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
  local lualine_themes = {
    ["gruvbox-material"] = "gruvbox",
    everforest = "everforest",
    darkplus = "onedark",
    github_dark = "auto",
    material = "material",
    vscode = "vscode",
    ayu = "ayu_dark",
    dracula = "dracula",
    catppuccin = "catppuccin",
    tokyonight = "tokyonight",
    nightfox = "nightfox",
    kanagawa = "kanagawa",
    onedark = "onedark",
    nord = "nord",
    ["doom-one"] = "doom-one",
    poimandres = "poimandres",
    ["rose-pine"] = "rose-pine",
    spaceduck = "spaceduck",
    onenord = "onenord",
    nordic = "nordic",
    melange = "auto",
    nightfly = "nightfly",
    oxocarbon = "auto",
    aurora = "auto",
    mellow = "auto",
    falcon = "auto",
    iceberg = "auto",
    sonokai = "sonokai",
    tokyodark = "tokyodark",
    one = "onedark",
    space = "auto",
    deus = "auto",
    sweetie = "auto",
    citruszest = "auto",
    juliana = "auto",
    midnight = "auto",
    bamboo = "bamboo",
    edge = "edge",
    hardhacker = "auto",
    ["vs-code"] = "vscode",
    caret = "auto",
    cobalt2 = "auto",
    rasmus = "auto",
    vimdark = "auto",
    zenburn = "zenburn",
    moonfly = "moonfly",
    one_monokai = "auto",
    paper = "auto",
    noctishc = "auto",
    codedark = "codedark",
    boo = "auto",
    starry = "auto",
    ["oxocarbon-lua"] = "auto",
    ["solarized-lua"] = "solarized",
    codeschool = "auto",
    bluloco = "auto",
    xcode = "auto",
    ["github-dark"] = "auto",
    roshni = "auto",
    ["min-theme"] = "auto",
  }
  lualine.setup({
    options = {
      theme = lualine_themes[theme] or "auto"
    }
  })
end

