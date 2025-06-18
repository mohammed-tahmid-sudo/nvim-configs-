-- 🔭 Enhanced Telescope Configuration 🔭
local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Setup Telescope with enhanced configuration
telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "▶ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.95,
      height = 0.85,
      preview_cutoff = 120,
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = {
      "node_modules",
      ".git/",
      ".vscode/",
      "build/",
      "dist/",
      "target/",
      "*.lock",
      "*.tmp",
      "__pycache__/",
      "*.pyc",
      ".pytest_cache/",
      ".coverage",
    },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    path_display = { "truncate" },
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-u>"] = false,  -- Clear prompt
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["dd"] = actions.delete_buffer,
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      hidden = true,
      previewer = false,
      layout_config = {
        width = 0.8,
        height = 0.6,
      },
      prompt_title = "🔍 Find Files",
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    live_grep = {
      theme = "ivy",
      prompt_title = "🔎 Live Grep",
      results_title = "📄 Search Results",
      layout_config = {
        height = 0.4,
      },
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
      prompt_title = "📋 Open Buffers",
      layout_config = {
        width = 0.7,
        height = 0.6,
      },
      sort_lastused = true,
      sort_mru = true,
    },
    oldfiles = {
      theme = "dropdown",
      previewer = false,
      prompt_title = "📚 Recent Files",
      layout_config = {
        width = 0.8,
        height = 0.6,
      },
    },
    help_tags = {
      theme = "ivy",
      prompt_title = "❓ Help Tags",
      results_title = "📖 Help Documentation",
    },
    keymaps = {
      theme = "dropdown",
      prompt_title = "⌨️  Keymaps",
      layout_config = {
        width = 0.9,
        height = 0.8,
      },
    },
    commands = {
      theme = "dropdown",
      prompt_title = "⚡ Commands",
      layout_config = {
        width = 0.7,
        height = 0.6,
      },
    },
    grep_string = {
      theme = "ivy",
      prompt_title = "🔍 Find Word",
      results_title = "📄 Search Results",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})

-- Load extensions
pcall(telescope.load_extension, 'fzf')

-- 🎯 Custom telescope functions 🎯

-- Enhanced find files with git awareness
local function find_files_enhanced()
  local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true")
  
  if is_git_repo then
    builtin.git_files({
      prompt_title = "🌿 Git Files",
      show_untracked = true,
    })
  else
    builtin.find_files({
      prompt_title = "🔍 Find Files",
      hidden = true,
    })
  end
end

-- Project-wide search with live preview
local function live_grep_enhanced()
  builtin.live_grep({
    prompt_title = "🔎 Search in Project",
    results_title = "📄 Matches",
    additional_args = function()
      return {"--hidden", "--glob", "!**/.git/*"}
    end
  })
end

-- Search in current buffer
local function current_buffer_fuzzy_find()
  builtin.current_buffer_fuzzy_find({
    prompt_title = "🔍 Search in Current Buffer",
    theme = "ivy",
  })
end

-- 🎯 Global telescope functions 🎯
_G.telescope_enhanced = {
  find_files = find_files_enhanced,
  live_grep = live_grep_enhanced,
  current_buffer_search = current_buffer_fuzzy_find,
}

-- 🚀 Auto-open telescope for directory navigation 🚀
local function auto_open_telescope()
  local arg = vim.fn.argv(0)
  
  -- Check if opened with no arguments, with '.', or with a directory
  if arg == '' or arg == '.' or (arg and vim.fn.isdirectory(arg) == 1) then
    -- Ensure we're in the correct directory
    if arg and arg ~= '' and arg ~= '.' then
      vim.cmd('cd ' .. arg)
    end
    
    -- Small delay to ensure everything is loaded properly
    vim.defer_fn(function()
      local ok, _ = pcall(require, 'telescope.builtin')
      if ok then
        find_files_enhanced()
      else
        print('📁 Directory opened, but Telescope not ready yet')
      end
    end, 150)
  end
end

-- Setup autocmd for auto-opening
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = auto_open_telescope,
  desc = "Auto-open telescope when starting with directory"
})

