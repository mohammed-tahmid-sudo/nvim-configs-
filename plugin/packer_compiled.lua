-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/tahmid/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?.lua;/home/tahmid/.cache/nvim/packer_hererocks/2.1.1720049189/share/lua/5.1/?/init.lua;/home/tahmid/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?.lua;/home/tahmid/.cache/nvim/packer_hererocks/2.1.1720049189/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tahmid/.cache/nvim/packer_hererocks/2.1.1720049189/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  aurora = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/aurora",
    url = "https://github.com/ray-x/aurora"
  },
  ["auto-save.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/auto-save.nvim",
    url = "https://github.com/Pocco81/auto-save.nvim"
  },
  ["ayu-vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/ayu-vim",
    url = "https://github.com/ayu-theme/ayu-vim"
  },
  ["bamboo.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/bamboo.nvim",
    url = "https://github.com/ribru17/bamboo.nvim"
  },
  ["betterTerm.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/betterTerm.nvim",
    url = "https://github.com/CRAG666/betterTerm.nvim"
  },
  ["bluloco.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/bluloco.nvim",
    url = "https://github.com/uloco/bluloco.nvim"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim",
    url = "https://github.com/rockerBOO/boo-colorscheme-nvim"
  },
  ["calvera-dark.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/calvera-dark.nvim",
    url = "https://github.com/yashguptaz/calvera-dark.nvim"
  },
  ["caret.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/caret.nvim",
    url = "https://github.com/projekt0n/caret.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["citruszest.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/citruszest.nvim",
    url = "https://github.com/zootedb0t/citruszest.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["cobalt2.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/cobalt2.nvim",
    url = "https://github.com/lalitmee/cobalt2.nvim"
  },
  ["code_runner.nvim"] = {
    config = { "\27LJ\2\n±\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rfiletype\1\0\2\6c8gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt\vpython\15python3 -u\1\0\2\rfiletype\0\tmode\nfloat\nsetup\16code_runner\frequire\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["codeschool.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/codeschool.nvim",
    url = "https://github.com/adisen99/codeschool.nvim"
  },
  ["darkplus.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/darkplus.nvim",
    url = "https://github.com/lunarvim/darkplus.nvim"
  },
  ["doom-one.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/doom-one.vim",
    url = "https://github.com/romgrk/doom-one.vim"
  },
  dracula = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/dracula",
    url = "https://github.com/dracula/vim"
  },
  edge = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/edge",
    url = "https://github.com/sainnhe/edge"
  },
  everforest = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  falcon = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/falcon",
    url = "https://github.com/fenetikm/falcon"
  },
  ["fluoromachine.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/fluoromachine.nvim",
    url = "https://github.com/maxmx03/fluoromachine.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["inspired-github.vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/inspired-github.vim",
    url = "https://github.com/mvpopuk/inspired-github.vim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¢\t\0\0\b\1#\00025\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\4\0-\5\0\0008\5\5\0\14\0\5\0X\6\1€'\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4=\4\f\0035\4\14\0004\5\3\0005\6\r\0>\6\1\5=\5\15\0044\5\4\0005\6\16\0>\6\1\0055\6\17\0005\a\18\0=\a\19\6>\6\2\0055\6\20\0005\a\21\0=\a\22\6>\6\3\5=\5\23\0044\5\3\0005\6\24\0>\6\1\5=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4=\4 \0035\4!\0=\4\"\3B\1\2\1K\0\1\0\0\0\15extensions\1\2\0\0\rfugitive\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\fsources\0\fsymbols\1\0\3\nadded\6+\fremoved\6-\rmodified\6~\1\2\2\0\tdiff\fcolored\2\fsymbols\0\1\2\1\0\vbranch\ticon\bîœ¥\14lualine_a\1\0\6\14lualine_c\0\14lualine_z\0\14lualine_x\0\14lualine_y\0\14lualine_b\0\14lualine_a\0\1\2\1\0\tmode\nupper\1\foptions\1\0\3\rsections\0\foptions\0\15extensions\0\25component_separators\1\0\2\tleft\bî‚±\nright\bî‚³\23section_separators\1\0\2\tleft\bî‚°\nright\bî‚²\ntheme\tauto\1\0\4\ntheme\0\23section_separators\0\25component_separators\0\18icons_enabled\2\nsetup\flualine\frequire\1\0\20\16github_dark\tauto\rmaterial\rmaterial\vvscode\vvscode\rdarkplus\fonedark\tnord\tnord\bayu\rayu_dark\fdracula\fdracula\15everforest\15everforest\21gruvbox-material\fgruvbox\rkanagawa\rkanagawa\rnightfox\rnightfox\15tokyonight\15tokyonight\14rose-pine\14rose-pine\15catppuccin\15catppuccin\fonedark\fonedark\rdoom-one\rdoom-one\vnordic\vnordic\fonenord\fonenord\14spaceduck\14spaceduck\15poimandres\15poimandres\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["mellow.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/mellow.nvim",
    url = "https://github.com/kvrohit/mellow.nvim"
  },
  ["midnight.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/midnight.nvim",
    url = "https://github.com/dasupradyumna/midnight.nvim"
  },
  ["min-theme.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/min-theme.nvim",
    url = "https://github.com/datsfilipe/min-theme.nvim"
  },
  ["monokai-pro.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/monokai-pro.nvim",
    url = "https://github.com/loctvl842/monokai-pro.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["night-owl.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/night-owl.nvim",
    url = "https://github.com/oxfist/night-owl.nvim"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["noctishc.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/noctishc.nvim",
    url = "https://github.com/iagorrr/noctishc.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-deus"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nvim-deus",
    url = "https://github.com/theniceboy/nvim-deus"
  },
  ["nvim-juliana"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nvim-juliana",
    url = "https://github.com/kaiuri/nvim-juliana"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-solarized-lua"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/nvim-solarized-lua",
    url = "https://github.com/ishan9299/nvim-solarized-lua"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oceanic-material"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/oceanic-material",
    url = "https://github.com/glepnir/oceanic-material"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/one-nvim",
    url = "https://github.com/Th3Whit3Wolf/one-nvim"
  },
  ["one_monokai.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/one_monokai.nvim",
    url = "https://github.com/cpea2506/one_monokai.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["oxocarbon-lua.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/oxocarbon-lua.nvim",
    url = "https://github.com/sindrets/oxocarbon-lua.nvim"
  },
  ["oxocarbon.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/oxocarbon.nvim",
    url = "https://github.com/nyoom-engineering/oxocarbon.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["palenight.vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/palenight.vim",
    url = "https://github.com/drewtempelmeyer/palenight.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["poimandres.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/poimandres.nvim",
    url = "https://github.com/olivercederborg/poimandres.nvim"
  },
  ["rasmus.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/rasmus.nvim",
    url = "https://github.com/kvrohit/rasmus.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  ["solarized.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/solarized.nvim",
    url = "https://github.com/shaunsingh/solarized.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["space-nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/space-nvim",
    url = "https://github.com/Th3Whit3Wolf/space-nvim"
  },
  ["starry.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/starry.nvim",
    url = "https://github.com/ray-x/starry.nvim"
  },
  ["sweetie.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/sweetie.nvim",
    url = "https://github.com/NTBBloodbath/sweetie.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["theme-vim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/theme-vim",
    url = "https://github.com/hardhackerlabs/theme-vim"
  },
  ["tokyodark.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/tokyodark.nvim",
    url = "https://github.com/tiagovla/tokyodark.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-colors-xcode"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-colors-xcode",
    url = "https://github.com/arzg/vim-colors-xcode"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n»\2\0\0\6\0\15\2\0296\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:FloatermToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\vcenter\22floaterm_position\nfloat\21floaterm_wintype\20floaterm_height\19floaterm_width\6g\bvimµæÌ™\19™³¦ÿ\3\1€€€ÿ\3\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-github-dark"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-github-dark",
    url = "https://github.com/vv9k/vim-github-dark"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  },
  ["vim-paper"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vim-paper",
    url = "https://github.com/yorickpeterse/vim-paper"
  },
  vimdark = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vimdark",
    url = "https://github.com/ldelossa/vimdark"
  },
  visual_studio_code = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/visual_studio_code",
    url = "https://github.com/askfiy/visual_studio_code"
  },
  ["vscode.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["zenburn.nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/zenburn.nvim",
    url = "https://github.com/phha/zenburn.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/tahmid/.local/share/nvim/site/pack/packer/start/zephyr-nvim",
    url = "https://github.com/glepnir/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¢\t\0\0\b\1#\00025\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\4\0-\5\0\0008\5\5\0\14\0\5\0X\6\1€'\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\4=\4\f\0035\4\14\0004\5\3\0005\6\r\0>\6\1\5=\5\15\0044\5\4\0005\6\16\0>\6\1\0055\6\17\0005\a\18\0=\a\19\6>\6\2\0055\6\20\0005\a\21\0=\a\22\6>\6\3\5=\5\23\0044\5\3\0005\6\24\0>\6\1\5=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4=\4 \0035\4!\0=\4\"\3B\1\2\1K\0\1\0\0\0\15extensions\1\2\0\0\rfugitive\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\fsources\0\fsymbols\1\0\3\nadded\6+\fremoved\6-\rmodified\6~\1\2\2\0\tdiff\fcolored\2\fsymbols\0\1\2\1\0\vbranch\ticon\bîœ¥\14lualine_a\1\0\6\14lualine_c\0\14lualine_z\0\14lualine_x\0\14lualine_y\0\14lualine_b\0\14lualine_a\0\1\2\1\0\tmode\nupper\1\foptions\1\0\3\rsections\0\foptions\0\15extensions\0\25component_separators\1\0\2\tleft\bî‚±\nright\bî‚³\23section_separators\1\0\2\tleft\bî‚°\nright\bî‚²\ntheme\tauto\1\0\4\ntheme\0\23section_separators\0\25component_separators\0\18icons_enabled\2\nsetup\flualine\frequire\1\0\20\16github_dark\tauto\rmaterial\rmaterial\vvscode\vvscode\rdarkplus\fonedark\tnord\tnord\bayu\rayu_dark\fdracula\fdracula\15everforest\15everforest\21gruvbox-material\fgruvbox\rkanagawa\rkanagawa\rnightfox\rnightfox\15tokyonight\15tokyonight\14rose-pine\14rose-pine\15catppuccin\15catppuccin\fonedark\fonedark\rdoom-one\rdoom-one\vnordic\vnordic\fonenord\fonenord\14spaceduck\14spaceduck\15poimandres\15poimandres\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n»\2\0\0\6\0\15\2\0296\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\1\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:FloatermToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\23floaterm_autoclose\vcenter\22floaterm_position\nfloat\21floaterm_wintype\20floaterm_height\19floaterm_width\6g\bvimµæÌ™\19™³¦ÿ\3\1€€€ÿ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: code_runner.nvim
time([[Config for code_runner.nvim]], true)
try_loadstring("\27LJ\2\n±\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\rfiletype\1\0\2\6c8gcc -o $fileNameWithoutExt && ./$fileNameWithoutExt\vpython\15python3 -u\1\0\2\rfiletype\0\tmode\nfloat\nsetup\16code_runner\frequire\0", "config", "code_runner.nvim")
time([[Config for code_runner.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: auto-save.nvim
time([[Config for auto-save.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14auto-save\frequire\0", "config", "auto-save.nvim")
time([[Config for auto-save.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
