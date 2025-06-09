-- Random Theme Selection with 100+ themes
local themes = {
  -- Core Popular Themes
  "catppuccin", "rose-pine", "tokyonight", "nightfox", "kanagawa", "gruvbox-material",
  "everforest", "gruvbox", "dracula", "ayu", "nord", "darkplus", "vscode",
  "material", "github_dark", "github_dark_default", "github_dark_dimmed", "github_dark_high_contrast",
  
  -- Dark Themes Collection
  "calvera", "poimandres", "doom-one", "night-owl", "palenight", "oxocarbon",
  "aurora", "mellow", "falcon", "onedark", "monokai-pro", "fluoromachine",
  "zephyr", "iceberg", "sonokai", "tokyodark", "one", "space", "solarized",
  "deus", "sweetie", "citruszest", "juliana", "midnight", "bamboo", "edge",
  "hardhacker", "visual_studio_code", "caret", "cobalt2", "rasmus", "vimdark",
  "zenburn", "moonfly", "one_monokai", "paper", "noctishc", "codedark",
  "boo", "starry", "oxocarbon-lua", "solarized-lua", "codeschool", "bluloco",
  "xcode", "github-dark", "roshni", "min-theme",
  
  -- Additional Premium Themes
  "nordic", "onenord", "neovim-ayu", "base16-default-dark", "melange",
  "primer_dark", "moonlight", "oceanic-next", "tender", "nord-vim",
  "nightfly", "challenger_deep", "solarized8", "PaperColor", "forest-night",
  "gotham", "srcery", "vim-deus", "neodark", "onedark", "kuroi", "vim-one",
  "dogrun", "synthwave84", "embark", "abstract", "pink-moon", "fahrenheit",
  "yowish", "scheakur", "afterglow", "deep-space", "two-firewatch",
  "hybrid-material", "vim-material", "rigel", "snazzy", "base16-ocean",
  "hybrid", "seoul256", "jellybeans", "solarized", "molokai", "wombat256",
  "railscasts",
  
  -- Modern Neovim-specific themes
  "oh-lucy", "oxocarbon", "onedarkpro", "gruvbox-baby", "tundra",
  "everblush", "noctis", "zephyrium", "adwaita", "lunar", "monochrome",
  "jellybeans-nvim", "minimal", "aquarium", "onebuddy", "nvim-hybrid",
  "blue-moon", "zenbones", "tokyonight-night", "tokyonight-storm",
  "tokyonight-day", "tokyonight-moon",
  
  -- Catppuccin variants
  "catppuccin-latte", "catppuccin-frappe", "catppuccin-macchiato", "catppuccin-mocha",
  
  -- Rose Pine variants
  "rose-pine-main", "rose-pine-moon", "rose-pine-dawn",
  
  -- Kanagawa variants
  "kanagawa-wave", "kanagawa-dragon", "kanagawa-lotus",
  
  -- Nightfox variants
  "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox",
  
  -- Light themes for variety
  "PaperColor", "vim-one-light", "onehalflight", "256_noir", "apprentice",
  "orbital", "happy_hacking", "acme", "mayansmoke", "iosvkem",
  
  -- Additional classic themes
  "desert", "murphy", "pablo", "peachpuff", "ron", "shine", "slate",
  "torte", "zellner", "blue", "darkblue", "default", "delek", "evening",
  "industry", "koehler", "morning", "elflord"
}

math.randomseed(os.time())
local theme = themes[math.random(#themes)]

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
    -- Check if theme exists in our list
    local found = false
    for _, t in ipairs(themes) do
      if t == theme_name then
        found = true
        break
      end
    end
    
    if found then
      _G.selected_theme = theme_name
      vim.cmd.colorscheme(theme_name)
      -- Reload lualine with new theme
      if package.loaded['lualine'] then
        package.loaded['lualine'] = nil
        require('lualine')
      end
      print("Switched to theme: " .. theme_name)
    else
      print("Theme '" .. theme_name .. "' not found in available themes")
    end
  else
    -- Random theme
    local new_theme = themes[math.random(#themes)]
    _G.selected_theme = new_theme
    vim.cmd.colorscheme(new_theme)
    if package.loaded['lualine'] then
      package.loaded['lualine'] = nil
      require('lualine')
    end
    print("Randomly switched to theme: " .. new_theme)
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
  print("🎨 Random theme loaded: " .. theme)
end
