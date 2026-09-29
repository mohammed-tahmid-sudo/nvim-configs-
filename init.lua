
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd.colorschem("retrobox")
vim.opt.number = true
vim.opt.termguicolors = true

-- KEYMAPS --
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
	desc = "Find Files",
})
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })

-- Format code with conform.nvim using <leader>f
vim.keymap.set({ "n", "v" }, "<leader>F", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range" })

--KEYMAPSEND--

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- Setup lazy.nvim
require("lazy").setup({
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "neovim/nvim-lspconfig" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					objc = { "clang-format" },
					cuda = { "clang-format" },
				},
			})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"saghen/blink.cmp",
		-- Use a release tag to download pre-built binaries (saves you from needing Rust/Cargo installed)
		version = "*",
		dependencies = "rafamadriz/friendly-snippets", -- Optional: adds a massive collection of snippets

		opts = {
			keymap = {
				preset = "none", -- Disable presets to avoid overlapping keys

				-- Enter accepts the selected item
				["<CR>"] = { "select_and_accept", "fallback" },

				-- Tab goes down the suggestions list
				["<Tab>"] = { "select_next", "fallback" },

				-- Ctrl+Tab goes up the suggestions list
				["<S-Tab>"] = { "select_prev", "fallback" },

				-- Optional: Useful helpers to keep
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<Esc>"] = { "hide", "fallback" },
			},

			-- Added completion configuration block for visuals and ghost text
			completion = {
				-- Enable the ghost text preview (faded inline suggestions)
				ghost_text = { enabled = true },

				-- Customize the appearance of the main suggestion menu
				menu = {
					border = "rounded", -- Gives the popup a clean rounded border

					draw = {
						-- Enables native Treesitter syntax highlighting inside the menu
						treesitter = { "lsp" },

						-- Arranges columns nicely: Icon | Label Text | [Source Tag]
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "source_name" },
						},

						-- Wraps the source names in brackets like [LSP], [Path]
						components = {
							source_name = {
								width = { max = 30 },
								text = function(ctx)
									return "[" .. ctx.source_name .. "]"
								end,
								highlight = "BlinkCmpSource",
							},
						},
					},
				},

				-- Customize the documentation side-panel window
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded", -- Rounds the documentation window borders too
					},
				},
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
		-- Run the LSP setup logic directly inside the config function
		config = function(_, opts)
			-- 1. Set up blink.cmp first
			require("blink.cmp").setup(opts)

			-- 2. Configure clangd using the new native Neovim 0.11+ API
			-- (No need to pass capabilities manually; blink.cmp hooks into this automatically!)
			vim.lsp.config("clangd", {
				cmd = { "clangd" },
				-- Add any other custom clangd flags or settings here if needed
			})

			-- 3. Explicitly enable the server so it automatically triggers on C/C++ files
			vim.lsp.enable("clangd")
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				enabled = true,
				write_all_buffers = true,
				trigger_events = { "InsertLeave", "TextChanged" },
				debounce_delay = 135,
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					persist_buffer_sort = true,
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							separator = true,
						},
					},
				},
			})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }

			-- map('n', '<A-Left>', '<cmd>BufferLineCyclePrev<cr>', opts)
			-- map('n', '<A-Right>', '<cmd>BufferLineCycleNext<cr>', opts)
			-- map('n', '<A-h>', '<cmd>BufferLineCyclePrev<cr>', opts)
			-- map('n', '<A-l>', '<cmd>BufferLineCycleNext<cr>', opts)
			vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local nvim_tree = require("nvim-tree")
			local api = require("nvim-tree.api")

			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			nvim_tree.setup({
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
					update_root = true,
				},
			})

			-- Toggle the tree with <leader>e
			vim.keymap.set("n", "<leader>e", function()
				api.tree.toggle({ find_file = true, update_root = true, focus = true })
			end, { noremap = true, silent = true })

			-- -- Open file in a vertical split with <leader>v
			-- vim.keymap.set("n", "<leader>v", function()
			--   api.node.open.vertical()
			-- end, { noremap = true, silent = true })

			-- -- Open file in a horizontal split with <leader>h
			-- vim.keymap.set("n", "<leader>h", function()
			--   api.node.open.horizontal()
			-- end, { noremap = true, silent = true })
			-- Lua keymap
			vim.keymap.set("n", "<leader>fc", ":NvimTreeFocus<CR>")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup({
				keywords = {
					TODO = { icon = " ", color = "#317fbf" },
				},
			})
		end,
	},

	checker = { enabled = true },
})

require("nvim-treesitter").setup({
	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
	install_dir = vim.fn.stdpath("data") .. "/site",
})

require("nvim-treesitter").install({ "python", "lua", "vimdoc" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

local function open_terminal(command)
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.9)
	local height = math.floor(vim.o.lines * 0.9)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = math.floor((vim.o.lines - height) / 2),
		col = math.floor((vim.o.columns - width) / 2),
		style = "minimal",
		border = "rounded",
	})

	vim.api.nvim_set_hl(0, "RunTerminal", {
		bg = "#1d2021",
	})

	vim.api.nvim_win_set_option(win, "winhighlight", "Normal:RunTerminal")

	vim.fn.termopen(command or vim.o.shell, {
		on_exit = function()
			vim.schedule(function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end

				if vim.api.nvim_buf_is_valid(buf) then
					vim.api.nvim_buf_delete(buf, { force = true })
				end
			end)
		end,
	})

	vim.cmd("startinsert")
end

-- Space Space → run code
vim.keymap.set("n", "  ", function()
	local runfile = vim.fn.getcwd() .. "/runfile.sh"

	if vim.fn.filereadable(runfile) == 1 then
		open_terminal({
			"bash",
			"-c",
			"bash " .. vim.fn.shellescape(runfile) .. "; printf '\\nPress Enter to exit... '; read -r",
		})
	end
end)

-- Space T → normal terminal
vim.keymap.set("n", "<leader>t", function()
	open_terminal()
end)
