-- File Manager with web-devicons
return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
      { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Focus File Explorer" },
      { "<leader>tf", "<cmd>NvimTreeFindFile<cr>", desc = "Find Current File" },
    },
    config = function()
      -- Disable netrw at the very start
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      
      require('nvim-tree').setup({
        -- 🎨 Core Settings
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        reload_on_bufenter = false,
        select_prompts = false,
        sort_by = "name",
        
        -- 📁 View Configuration
        view = {
          cursorline = true,
          debounce_delay = 15,
          centralize_selection = false,
          width = 35,
          side = "left",
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        
        -- 🚀 Performance
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = {},
        },
        system_open = {
          cmd = "",
          args = {},
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        
        -- 🔍 Filters
        filters = {
          git_ignored = false,
          dotfiles = false,
          git_clean = false,
          no_buffer = false,
          custom = { "node_modules", "\\.cache" },
          exclude = {},
        },
        
        -- 📂 Filesystem Watchers
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
          ignore_dirs = {},
        },
        
        -- 🎯 Git Integration
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          show_on_open_dirs = true,
          disable_for_dirs = {},
          timeout = 400,
        },
        
        -- 🔧 Actions
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          expand_all = {
            max_folder_discovery = 300,
            exclude = {},
          },
          file_popup = {
            open_win_config = {
              col = 1,
              row = 1,
              relative = "cursor",
              border = "shadow",
              style = "minimal",
            },
          },
          open_file = {
            quit_on_open = false,
            eject = true,
            resize_window = true,
            window_picker = {
              enable = true,
              picker = "default",
              chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
        
        -- 🗑️ Trash
        trash = {
          cmd = "gio trash",
        },
        
        -- Live Filter
        live_filter = {
          prefix = "Filter: ",
          always_show_folders = true,
        },
        
        -- 🎨 Tab
        tab = {
          sync = {
            open = false,
            close = false,
            ignore = {},
          },
        },
        
        -- 📝 Notify
        notify = {
          threshold = vim.log.levels.INFO,
          absolute_path = true,
        },
        
        -- 🎨 UI Configuration
        ui = {
          confirm = {
            remove = true,
            trash = true,
            default_yes = false,
          },
        },
        
        -- 🎯 Experimental Features
        experimental = {},
        
        -- 📊 Log
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
          },
        },
        
        -- 🎨 Renderer Configuration - THE ICON POWERHOUSE! 🎨
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = true,
          full_name = false,
          highlight_diagnostics = true,
          highlight_opened_files = "all",
          highlight_modified = "all",
          root_folder_label = ":~:s?$?/..?",
          indent_width = 2,
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
          
          -- 🎯 MAXIMUM ICONS CONFIGURATION 🎯
          icons = {
            webdev_colors = true,
            git_placement = "before",
            modified_placement = "after",
            diagnostics_placement = "signcolumn",
            bookmarks_placement = "signcolumn",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
              modified = true,
              diagnostics = true,
              bookmarks = true,
            },
            
            -- Optimized icon configuration with proper sizing
            glyphs = {
              default = "",
              symlink = "",
              bookmark = " ",
              modified = "●",
              
              -- Folder Icons with consistent sizing
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = " ",
                open = " ",
                empty = " ",
                empty_open = " ",
                symlink = " ",
                symlink_open = " ",
              },
              
              -- Git Status Icons with proper sizing
              git = {
                unstaged = " ",
                staged = " ",
                unmerged = " ",
                renamed = " ",
                untracked = " ",
                deleted = " ",
                ignored = " ",
              },
            },
          },
          
          -- 📝 Special Files
          special_files = { 
            "Cargo.toml", 
            "Makefile", 
            "README.md", 
            "readme.md",
            "package.json",
            "docker-compose.yml",
            "Dockerfile",
            ".gitignore",
            ".env",
            "LICENSE",
            "CHANGELOG.md",
            "TODO.md",
            "pyproject.toml",
            "requirements.txt",
            "pom.xml",
            "build.gradle",
            "CMakeLists.txt",
          },
          
          -- 🔤 Symlink Destination
          symlink_destination = true,
        },
      })
      
      -- 🎯 Enhanced Keymaps
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      
      -- Additional useful mappings
      vim.keymap.set('n', '<leader>tr', '<cmd>NvimTreeRefresh<cr>', { desc = 'Refresh Tree' })
      vim.keymap.set('n', '<leader>tc', '<cmd>NvimTreeCollapse<cr>', { desc = 'Collapse Tree' })
      vim.keymap.set('n', '<leader>tg', '<cmd>NvimTreeFindFileToggle<cr>', { desc = 'Find & Toggle' })
      
      -- Auto-commands for better integration
      local api = require('nvim-tree.api')
      
      -- Auto-close nvim-tree when it's the last window
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
          end
        end
      })
      
      -- Open nvim-tree on startup if no files specified
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function(data)
          -- buffer is a directory
          local directory = vim.fn.isdirectory(data.file) == 1
          
          if directory then
            vim.cmd.cd(data.file)
            require("nvim-tree.api").tree.open()
          end
        end
      })
    end,
  },
}

