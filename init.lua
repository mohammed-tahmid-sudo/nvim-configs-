vim.wo.number = true
vim.wo.relativenumber = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")

vim.g.sql_type_default = "sql"
vim.cmd([[let g:python_sql_highlight = 1]])

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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"morhetz/gruvbox",
			lazy = false,
			config = function()
				vim.o.background = "dark"
				vim.g.gruvbox_contrast_dark = "hard"
				vim.cmd([[colorscheme gruvbox]])
				vim.o.termguicolors = true
			end,
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim",
			},
			config = function()
				require("neo-tree").setup({})

				vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
				-- Toggle focus between Neo-tree and code
			end,
		},

		-- {
		-- 	"navarasu/onedark.nvim",
		-- 	priority = 1000, -- make sure to load this before all the other start plugins
		-- 	config = function()
		-- 		require("onedark").setup({
		-- 			style = "darker",
		-- 		})
		-- 		-- Enable theme
		-- 		require("onedark").load()
		-- 	end,
		-- },
		-- {
		-- 	"mcchrish/zenbones.nvim",
		-- 	dependencies = "rktjmp/lush.nvim",
		-- 	config = function()
		-- 		vim.cmd("colorscheme zenbones")
		-- 	end,
		-- },

		-- {
		-- 	"rose-pine/neovim",
		-- 	name = "rose-pine",
		-- 	config = function()
		-- 		vim.cmd("colorscheme rose-pine")
		-- 	end,
		-- },
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		},

		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = { "sql", "lua", "python", "javascript", "c", "cpp", "asm" }, -- add languages you need
					sync_install = false,
					auto_install = true,
					highlight = {
						enable = true, -- enable syntax highlighting
						additional_vim_regex_highlighting = false,
					},
					indent = { enable = true }, -- smarter indentation
				})
			end,
		},
		{
			"Pocco81/auto-save.nvim",
			config = function()
				require("auto-save").setup({
					enabled = true,
					execution_message = {
						message = function()
							return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
						end,
						dim = 0.18,
						cleaning_interval = 1250,
					},
					trigger_events = { "InsertLeave", "TextChanged" },
					condition = function(buf)
						local fn = vim.fn
						-- Check if buffer is modifiable and not in excluded filetypes
						local excluded_filetypes = {}
						local current_filetype = fn.getbufvar(buf, "&filetype")

						-- Simple helper function to check if value is in table
						local function is_in_table(value, table)
							for _, v in ipairs(table) do
								if v == value then
									return true
								end
							end
							return false
						end

						return fn.getbufvar(buf, "&modifiable") == 1
							and not is_in_table(current_filetype, excluded_filetypes)
					end,
					write_all_buffers = false,
					debounce_delay = 135,
				})
			end,
		},

		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

		{
			"tpope/vim-dispatch",
			cmd = { "Make", "Dispatch" },
		},

		{ "voldikss/vim-floaterm" },
		-- {
		-- 	"stevearc/conform.nvim",
		-- 	opts = {
		-- 		-- format_on_save = {
		-- 		-- 	timeout_ms = 500,
		-- 		-- 	lsp_fallback = true,
		-- 		-- },
		-- 		formatters_by_ft = {
		-- 			lua = { "stylua" },
		-- 			python = { "black" },
		-- 			c = { "clang-format" },
		-- 			cpp = { "clang-format" },
		-- 			javascript = { "prettier" },
		-- 			typescript = { "prettier" },
		-- 			java = { "google-java-format" },
		-- 			-- Add more
		-- 		},
		-- 	},
		-- },
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					java = { "google-java-format" },
				},
				formatters = {
					prettier = {
						prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
					},
					clang_format = {
						prepend_args = { "--style={IndentWidth: 4}" },
					},
					stylua = {
						prepend_args = { "--indent-width", "4" },
					},
				},
			},
		},

		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			-- or                              , branch = '0.1.x',
			dependencies = { "nvim-lua/plenary.nvim" },
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
		-- {
		-- 	"neovim/nvim-lspconfig",
		-- 	dependencies = { "saghen/blink.cmp" },
		--
		-- 	opts = {
		-- 		servers = {
		-- 			lua_ls = {},
		-- 		},
		-- 	},
		--
		-- 	config = function(_, opts)
		-- 		local blink = require("blink.cmp")
		-- 		-- local lspconfig = require("lspconfig")
		--
		-- 		for server, config in pairs(opts.servers) do
		-- 			config.capabilities = blink.get_lsp_capabilities(config.capabilities)
		-- 			lspconfig[server].setup(config)
		-- 		end
		-- 	end,
		-- },
		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },
			opts = {
				servers = {
					lua_ls = {},
					asm_lsp = {}, -- <---- add this
				},
			},
			config = function(_, opts)
				local blink = require("blink.cmp")

				-- Check if we're on Neovim 0.11+ with the new LSP config system
				if vim.lsp.config then
					-- New method for Neovim 0.11+
					for server, config in pairs(opts.servers) do
						-- Get capabilities from blink.cmp
						config.capabilities = blink.get_lsp_capabilities(config.capabilities or {})

						-- Set up server using the new vim.lsp.config API
						vim.lsp.config(server, config)
						vim.lsp.enable(server)
					end
				else
					-- Fallback for older Neovim versions
					local lspconfig = require("lspconfig")
					for server, config in pairs(opts.servers) do
						config.capabilities = blink.get_lsp_capabilities(config.capabilities or {})
						lspconfig[server].setup(config)
					end
				end
			end,
		},
		{ "mason-org/mason.nvim", config = true },
		{ "mason-org/mason-lspconfig.nvim", config = true },
		{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		-- UI + extras
		{
			"glepnir/lspsaga.nvim",
			config = function()
				require("lspsaga").setup({
					-- diagnostic = {
					-- 	on_insert = true,
					-- 	show_code_action = true,
					-- 	show_source = true,
					-- 	show_virtual_text = true, -- inline
					-- },
				})
			end,
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"nvim-lualine/lualine.nvim", -- statusline with LSP progress
			config = true,
		},
		{
			"folke/trouble.nvim", -- diagnostics list
			cmd = "TroubleToggle",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = true,
		},
		{
			"ray-x/lsp_signature.nvim", -- function signatures
			config = function()
				require("lsp_signature").setup()
			end,
		},

		{
			"saghen/blink.cmp",
			-- optional: provides snippets for the snippet source
			dependencies = { "rafamadriz/friendly-snippets" },

			-- use a release tag to download pre-built binaries
			version = "1.*",
			-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
			-- build = 'cargo build --release',
			-- If you use nix, you can build from source using latest nightly rust with:
			-- build = 'nix run .#build-plugin',

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
				-- 'super-tab' for mappings similar to vscode (tab to accept)
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- All presets have the following mappings:
				-- C-space: Open menu or open docs if already open
				-- C-n/C-p or Up/Down: Select next/previous item
				-- C-e: Hide menu
				-- C-k: Toggle signature help (if signature.enabled = true)
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap

				-- keymaps = "super-tab",
				keymap = {
					preset = "none", -- override defaults entirely
					["<CR>"] = { "accept", "fallback" }, -- Enter commits snippet or completion
					["<Tab>"] = { "snippet_forward", "select_next", "fallback" }, -- Tab → snippet jump or next item
					["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" }, -- Ctrl‑Tab → prev item/jump
					["<Esc>"] = { "hide", "fallback" },
				},
				completion = { list = { selection = "manual" } },

				appearance = {
					-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
					-- Adjusts spacing to ensure icons are aligned
					nerd_font_variant = "mono",
				},

				-- (Default) Only show the documentation popup when manually triggered
				-- completion = { documentation = { auto_show = false } },

				completion = { documentation = { auto_show = true } },

				-- Default list of enabled providers defined so that you can extend it
				-- elsewhere in your config, without redefining it, due to `opts_extend`
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},

				-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
				-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
				-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
				--
				-- See the fuzzy documentation for more information
				fuzzy = { implementation = "prefer_rust_with_warning" },
			},
			opts_extend = { "sources.default" },
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "gruvbox" } },

	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Theme Setup
vim.o.background = "dark" -- or "light" for light mode

-- Default options:
-- require("gruvbox").setup({
-- 	terminal_colors = true, -- add neovim terminal colors
-- 	undercurl = true,
-- 	underline = true,
-- 	bold = true,
-- 	italic = {
-- 		strings = true,
-- 		emphasis = true,
-- 		comments = true,
-- 		operators = false,
-- 		folds = true,
-- 	},
-- 	strikethrough = true,
-- 	invert_selection = false,
-- 	invert_signs = false,
-- 	invert_tabline = false,
-- 	inverse = true, -- invert background for search, diffs, statuslines and errors
-- 	contrast = "", -- can be "hard", "soft" or empty string
-- 	palette_overrides = {},
-- 	overrides = {},
-- 	dim_inactive = false,
-- 	transparent_mode = false,
-- })
-- vim.cmd("colorscheme gruvbox")

local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "file" }, -- group
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	{
		"<leader>fb",
		function()
			print("hello")
		end,
		desc = "Foobar",
	},
	{ "<leader>fn", desc = "New File" },
	{ "<leader>f1", hidden = true }, -- hide this keymap
	{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	{
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		-- Nested mappings are allowed and can be added in any order
		-- Most attributes can be inherited or overridden on any level
		-- There's no limit to the depth of nesting
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
})

vim.keymap.set("n", "<leader>F", function()
	require("conform").format({ async = true })
	-- require("conform").setup({
	-- 	-- enable on-save if you want
	-- 	format_on_save = {
	-- 		timeout_ms = 500,
	-- 		lsp_fallback = true,
	-- 	},
	--
	-- 	-- map filetypes to formatter keys
	-- 	formatters_by_ft = {
	-- 		lua = { "stylua" },
	-- 		python = { "black" },
	-- 		c = { "clang-format" },
	-- 		cpp = { "clang-format" },
	-- 		javascript = { "prettier" },
	-- 		typescript = { "prettier" },
	-- 		java = { "google-java-format" },
	-- 	},
	--
	-- 	-- explicit formatter definitions (use real cmd + args)
	-- 	formatters = {
	-- 		prettier = {
	-- 			cmd = "prettier",
	-- 			args = { "--stdin-filepath", "$FILENAME", "--tab-width", "4", "--use-tabs", "false" },
	-- 		},
	-- 		["clang-format"] = {
	-- 			cmd = "clang-format",
	-- 			-- use -style or a .clang-format file. this sets indent width explicitly:
	-- 			args = { "-assume-filename=$FILENAME", "-style={IndentWidth:4,TabWidth:4,UseTab:Never}" },
	-- 		},
	-- 		stylua = {
	-- 			cmd = "stylua",
	-- 			args = { "--stdin-filepath", "$FILENAME", "--indent-type", "Spaces", "--indent-width", "4" },
	-- 		},
	-- 		black = {
	-- 			cmd = "black",
	-- 			args = { "-", "--quiet" }, -- black uses 4-space by default; keep stdin mode
	-- 		},
	-- 		["google-java-format"] = {
	-- 			cmd = "google-java-format",
	-- 			args = { "-" },
	-- 		},
	-- 	},
	-- })

	print("Code formatted")
end)

vim.keymap.set("n", "<leader>t", function()
	vim.cmd(":FloatermNew")
end)

vim.keymap.set("n", "<leader>m", function()
	vim.cmd("FloatermNew --title=make make")
end, { desc = "Run make in Floaterm" })

vim.keymap.set("n", "<C-space>", function()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename_no_ext = vim.fn.expand("%:r")
	local has_makefile = vim.fn.filereadable("Makefile") == 1 or vim.fn.filereadable("makefile") == 1

	if ft == "c" or ft == "cpp" then
		if has_makefile then
			vim.cmd("FloatermNew --autoclose=0 --title=make make run")
		else
			if ft == "c" then
				-- vim.cmd(
				-- 	"FloatermNew --autoclose=0 --title=cc gcc "
				-- 		.. file
				-- 		.. " -o "
				-- 		.. filename_no_ext "`sdl2-config --cflags --libs`"
				-- 		.. " && ./"
				-- 		.. filename_no_ext
				-- )
				vim.cmd(
					"FloatermNew --autoclose=0 --title=cc gcc "
						.. file
						.. " -o "
						.. filename_no_ext
						.. " $(sdl2-config --cflags --libs)"
						.. " && ./"
						.. filename_no_ext
				)
			else -- cpp
				vim.cmd(
					"FloatermNew --autoclose=0 --title=cpp g++ "
						.. file
						.. " -o "
						.. filename_no_ext
						.. " && ./"
						.. filename_no_ext
				)
			end
		end
	elseif ft == "python" then
		vim.cmd("FloatermNew --autoclose=0 --title=python python3 " .. file)
	elseif ft == "java" then
		vim.cmd('FloatermNew --autoclose=0 --title=java sh -c "javac ' .. file .. " && java " .. filename_no_ext .. '"')
	elseif ft == "lua" then
		vim.cmd('FloatermNew --autoclose=0 --title=Lua sh -c "lua ' .. file)
	else
		print("No runner for filetype: " .. ft)
	end
end, { desc = "Run current file or make" })

-- vim.keymap.set("n", "<space-space>", function()
vim.keymap.set("n", "  ", function()
	local ft = vim.bo.filetype
	local file = vim.fn.expand("%")
	local filename_no_ext = vim.fn.expand("%:r")
	local has_makefile = vim.fn.filereadable("Makefile") == 1 or vim.fn.filereadable("makefile") == 1

	if ft == "c" or ft == "cpp" then
		-- if has_makefile then
		-- 	vim.cmd("FloatermNew --autoclose=0 --title=make make run")
		if ft == "c" then
			-- vim.cmd(
			-- 	"FloatermNew --autoclose=0 --title=cc gcc "
			-- 		.. file
			-- 		.. " -o "
			-- 		.. filename_no_ext "`sdl2-config --cflags --libs`"
			-- 		.. " && ./"
			-- 		.. filename_no_ext
			-- )
			vim.cmd(
				"FloatermNew --autoclose=0 --title=cc gcc "
					.. file
					.. " -o "
					.. filename_no_ext
					.. " $(sdl2-config --cflags --libs)"
					.. " && ./"
					.. filename_no_ext
			)
		else -- cpp
			vim.cmd(
				"FloatermNew --autoclose=0 --title=cpp g++ "
					.. file
					.. " -o "
					.. filename_no_ext
					.. " && ./"
					.. filename_no_ext
			)
			-- end
		end
	-- elseif ft == "python" then
	-- 	vim.cmd("FloatermNew --autoclose=0 --title=python python3 " .. file)
	-- elseif ft == "java" then
	-- 	vim.cmd('FloatermNew --autoclose=0 --title=java sh -c "javac ' .. file .. " && java " .. filename_no_ext .. '"')
	-- elseif ft == "lua" then
	-- 	vim.cmd('FloatermNew --autoclose=0 --title=Lua sh -c "lua ' .. file)
	else
		print("No runner for filetype: " .. ft)
	end
end, { desc = "Run current file or make" })

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", --[[other servers]]
	},
})

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	signs = true,
	underline = true,
	update_in_insert = true, -- <-- makes it run while typing
})

-- Lua
-- require("onedark").load()

vim.keymap.set("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
