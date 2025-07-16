-- Random Theme Selection with 200+ themes
local themes = {
  -- Core Popular Themes
  "catppuccin", "rose-pine", "tokyonight", "nightfox", "kanagawa", "gruvbox-material",
  "everforest", "gruvbox", "dracula", "ayu", "nord", "darkplus", "vscode",
  "material", "github_dark", "github_dark_default", "github_dark_dimmed", "github_dark_high_contrast",
  "github_dark_colorblind", "github_light", "github_light_default", "github_light_high_contrast",
  
  -- Dark Themes Collection
  "calvera", "poimandres", "doom-one", "night-owl", "palenight", "oxocarbon",
  "aurora", "mellow", "falcon", "onedark", "monokai-pro", "fluoromachine",
  "zephyr", "iceberg", "sonokai", "tokyodark", "one", "space", "solarized",
  "deus", "sweetie", "citruszest", "juliana", "midnight", "bamboo", "edge",
  "hardhacker", "visual_studio_code", "caret", "cobalt2", "rasmus", "vimdark",
  "zenburn", "moonfly", "one_monokai", "paper", "noctishc", "codedark",
  "boo", "starry", "oxocarbon-lua", "solarized-lua", "codeschool", "bluloco",
  "xcode", "github-dark", "roshnivim-cs", "min-theme",
  
  -- Additional Premium Themes (from colorschemes.lua)
  "nordic", "onenord", "neovim-ayu", "base16", "colorbuddy", "lush", "melange",
  "primer", "moonlight", "nvcode", "oceanic-next", "tender", "nord-vim",
  "nightfly", "challenger-deep", "solarized8", "PaperColor", "forest-night",
  "gotham", "srcery", "vim-deus", "neodark", "kuroi", "vim-one",
  "dogrun", "synthwave84", "embark", "abstract", "pink-moon", "fahrenheit",
  "yowish", "scheakur", "afterglow", "deep-space", "two-firewatch",
  "hybrid-material", "vim-material", "rigel", "snazzy", "base16-vim",
  "hybrid", "seoul256", "jellybeans", "molokai", "wombat256",
  "railscasts", "awesome-vim-colorschemes",
  
  -- Modern Neovim-specific themes
  "oh-lucy", "onedarkpro", "gruvbox-baby", "tundra",
  "everblush", "noctis", "zephyrium", "adwaita", "themer",
  "lunar", "monochrome", "jellybeans-nvim", "minimal", "aquarium", "onebuddy", "nvim-hybrid",
  "blue-moon", "zenbones",
  
  -- Catppuccin variants
  "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
  
  -- Rose Pine variants
  "rose-pine-main", "rose-pine-moon", "rose-pine-dawn",
  
  -- Kanagawa variants
  "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus",
  
  -- Nightfox variants
  "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox",
  
  -- TokyoNight variants
  "tokyonight-night", "tokyonight-storm", "tokyonight-day", "tokyonight-moon",
  
  -- Light themes for variety
  "PaperColor", "vim-one-light", "onehalf", "onehalflight", "256_noir", "apprentice",
  "orbital", "happy_hacking", "acme", "mayansmoke", "iosvkem",
  
  -- Additional classic themes
  "desert", "murphy", "pablo", "peachpuff", "ron", "shine", "slate",
  "torte", "zellner", "blue", "darkblue", "default", "delek", "evening",
  "industry", "koehler", "morning", "elflord",
  
  -- More themes from your extensive collection
  "base16-default-dark", "base16-ocean", "primer_dark", "gruvbox.nvim",
  "dracula.nvim", "nord.nvim", "oxocarbon.nvim", "forest-night", "vim-colors-solarized",
  "vim-colors-xcode", "vim-github-dark", "vim-hybrid", "vim-snazzy",
  "vim-railscasts-theme", "vim-colorschemes", "vim-pink-moon", "vim-afterglow",
  "vim-deep-space", "vim-two-firewatch", "vim-hybrid-material", "vim-fahrenheit",
  "vim-scheakur", "vim-synthwave84", "vim-dogrun", "vim-gotham",
  "neodark.vim", "onedark.vim", "kuroi.vim", "yowish.vim", "rigel",
  "vim-deus", "srcery-vim", "papercolor-theme", "solarized8", "jellybeans.vim",
  "wombat256.vim", "seoul256.vim", "vim-hybrid", "base16-vim", "molokai",
  "tender.vim", "night-owl.nvim", "palenight.vim", "calvera-dark.nvim",
  "poimandres.nvim", "doom-one.nvim", "mellow.nvim", "falcon", "zephyr-nvim",
  "iceberg.vim", "sonokai", "tokyodark.nvim", "one-nvim", "space-nvim",
  "solarized.nvim", "nvim-deus", "sweetie.nvim", "citruszest.nvim",
  "nvim-juliana", "midnight.nvim", "bamboo.nvim", "edge", "theme-vim",
  "visual_studio_code", "caret.nvim", "cobalt2.nvim", "rasmus.nvim",
  "vimdark", "zenburn.nvim", "vim-moonfly-colors", "one_monokai.nvim",
  "vim-paper", "noctishc.nvim", "vim-code-dark", "boo-colorscheme-nvim",
  "starry.nvim", "sindrets-oxocarbon-lua.nvim", "nvim-solarized-lua",
  "codeschool.nvim", "bluloco.nvim", "nordic.nvim", "onenord.nvim",
  "neovim-ayu", "nvim-base16", "melange-nvim", "primer.nvim",
  "moonlight.nvim", "nvcode-color-schemes.vim", "oceanic-next",
  "nord-vim", "vim-nightfly-guicolors", "challenger-deep",
  "lifepillar-solarized8", "forest-night", "whatyouhide-gotham",
  "Yazeed1s-oh-lucy.nvim", "andersevenrud-nordic.nvim", "shaunsingh-oxocarbon.nvim",
  "onedarkpro.nvim", "gruvbox-baby", "nvim-tundra", "everblush",
  "noctis.nvim", "zephyrium", "adwaita.nvim", "themer.lua",
  "B4mbus-oxocarbon-lua.nvim", "lunar.nvim", "monochrome.nvim",
  "jellybeans-nvim", "minimal.nvim", "aquarium-vim", "onebuddy",
  "nvim-hybrid", "blue-moon", "zenbones.nvim", "FrenzyExists-aquarium-vim",
  "256noir", "Apprentice", "vim-orbital", "happy_hacking.vim",
  "acme-colors", "mayansmoke", "iosvkem"
}

-- Function to check if a theme is available
local function is_theme_available(theme_name)
  -- Check if it's a built-in theme
  local builtin_themes = {
    "default", "blue", "darkblue", "delek", "desert", "elflord", "evening",
    "industry", "koehler", "morning", "murphy", "pablo", "peachpuff",
    "ron", "shine", "slate", "torte", "zellner"
  }
  
  for _, builtin in ipairs(builtin_themes) do
    if builtin == theme_name then
      return true
    end
  end
  
  -- Try to check if theme is installed
  local success = pcall(function()
    vim.cmd.colorscheme(theme_name)
  end)
  
  return success
end

-- Set evening as the default theme (always available)
local theme = "evening"

-- Enable transparency by default
_G.theme_is_transparent = true
vim.g.transparent_enabled = true

-- Store the selected theme globally for other modules to access
_G.selected_theme = theme
_G.available_themes = themes

-- Function to get current theme info
function _G.get_theme_info()
  print("Current theme: " .. (_G.selected_theme or "unknown"))
  print("Total available themes: " .. #themes)
end

-- Function to switch theme manually
function _G.switch_theme(theme_name)
  if theme_name then
    -- Try to apply the theme
    local success, err = pcall(vim.cmd.colorscheme, theme_name)
    if success then
      _G.selected_theme = theme_name
      -- Reload lualine with new theme
      if package.loaded['lualine'] then
        package.loaded['lualine'] = nil
        require('lualine')
      end
      print("Switched to theme: " .. theme_name)
    else
      print("Failed to load theme '" .. theme_name .. "': " .. (err or "unknown error"))
      print("Available built-in themes: default, blue, darkblue, delek, desert, elflord, evening, industry, koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, zellner")
    end
  else
    -- Random theme - try multiple times to find a working one
    local attempts = 0
    local max_attempts = 10
    
    while attempts < max_attempts do
      local new_theme = themes[math.random(#themes)]
      local success, err = pcall(vim.cmd.colorscheme, new_theme)
      
      if success then
        _G.selected_theme = new_theme
        if package.loaded['lualine'] then
          package.loaded['lualine'] = nil
          require('lualine')
        end
        print("Randomly switched to theme: " .. new_theme)
        return
      end
      
      attempts = attempts + 1
    end
    
    -- If no random theme worked, fall back to evening
    print("No random theme could be loaded, falling back to evening")
    _G.selected_theme = "evening"
    vim.cmd.colorscheme("evening")
  end
end

-- Create vim commands
vim.api.nvim_create_user_command('ThemeInfo', function()
  _G.get_theme_info()
end, {})

vim.api.nvim_create_user_command('ThemeSwitch', function(opts)
  _G.switch_theme(opts.args ~= "" and opts.args or nil)
end, { nargs = '?' })

vim.api.nvim_create_user_command('ThemeRandom', function()
  _G.switch_theme()
end, {})

-- Apply selected theme with error handling
local success, err = pcall(vim.cmd.colorscheme, theme)
if not success then
  print("Failed to load theme '" .. theme .. "': " .. err)
  print("Falling back to default theme")
  vim.cmd.colorscheme("default")
  _G.selected_theme = "default"
else
  print("🎨 Random theme loaded: " .. theme .. (_G.theme_is_transparent and " (transparent)" or ""))
end

-- Apply transparency if enabled
if _G.theme_is_transparent then
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      local hl_groups = {
        "Normal",
        "NormalNC",
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Type",
        "Underlined",
        "Todo",
        "String",
        "Function",
        "Conditional",
        "Repeat",
        "Operator",
        "Structure",
        "LineNr",
        "NonText",
        "SignColumn",
        "CursorLineNr",
        "EndOfBuffer"
      }
      
      for _, group in ipairs(hl_groups) do
        vim.cmd(string.format("highlight %s guibg=NONE ctermbg=NONE", group))
      end
      
      -- Make floating windows transparent too
      vim.cmd("highlight NormalFloat guibg=NONE")
      vim.cmd("highlight FloatBorder guibg=NONE")
    end,
  })
  
  -- Apply transparency immediately
  vim.defer_fn(function()
    vim.cmd("doautocmd ColorScheme")
  end, 100)
end
