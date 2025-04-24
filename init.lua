--  i'm using packer and this is hole code base 



-- init.lua

-- 1) Leader & Basic Options
vim.g.mapleader = ' '
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true

-- 2) Random Theme Selection (before Packer)
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
else
  vim.cmd("colorscheme " .. theme)
end

-- 3) Packer Setup
vim.cmd [[packadd packer.nvim]]
require('packer').startup({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = "rounded" })
    end
  },
  function(use)

   -- Git integration

   use 'tpope/vim-fugitive'           -- core Git commands (:Git, :Gread, etc)
   use {
	   'lewis6991/gitsigns.nvim',       -- inline git diff signs
	   config = function()
		   require('gitsigns').setup()
	   end
   }




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

    -- UI + Themes (all your themes)
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
    use "sainnhe/gruvbox.nvim"
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
    }

    -- Telescope & Which-Key
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
      'folke/which-key.nvim',
      config = function() require('which-key').setup {} end
    }

    -- Floaterm (replaces floaty)
    use {
      'voldikss/vim-floaterm',
      config = function()
        vim.g.floaterm_width    = 0.8
        vim.g.floaterm_height   = 0.5
        vim.g.floaterm_wintype  = 'float'
        vim.g.floaterm_position = 'center'
        vim.g.floaterm_autoclose = 1
        vim.api.nvim_set_keymap('n', '<leader>t', ':FloatermToggle<CR>', { noremap = true, silent = true })
      end
    }

    -- Code Runner & Auto-save
    use {
      'CRAG666/code_runner.nvim',
      requires = 'CRAG666/betterTerm.nvim',
      config = function()
        require('code_runner').setup({
          mode = 'float',
          filetype = { python = "python3 -u", c = "gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt" },
        })
      end
    }
    use {
      'Pocco81/auto-save.nvim',
      config = function() require('auto-save').setup({}) end
    }
  end,
})

-- 4) Auto-command to open Telescope if starting in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == '.' then require('telescope.builtin').find_files() end
  end
})

-- 5) WhichKey Mappings

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


-- 6) LSP Setup
local lspconfig = require('lspconfig')
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}

-- 7) Completion Setup
local cmp = require'cmp'
cmp.setup({
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), ['<Up>'] = cmp.mapping.select_prev_item(),
    ['<Down>']   = cmp.mapping.select_next_item(), ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>']  = cmp.mapping.select_prev_item(), ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {{ name = 'nvim_lsp'}, { name = 'buffer'}, { name = 'path'}, { name = 'luasnip'}},
})

-- 8) Auto-save notification
vim.api.nvim_create_augroup("file_saved_group", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "file_saved_group",
  pattern = "*",
  callback = function() print("File saved!") end,
})

-- 9) Run Command for Executing Code
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

-- 10) Floating Terminal Runner via Floaterm
function RunFile()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  local cmd
  if ft == 'python' then cmd = 'FloatermNew --autoclose=1 python3 ' .. file
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
vim.api.nvim_set_keymap('n', 'C-space', ':lua RunFile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', 'w', { noremap = true, silent = true })


