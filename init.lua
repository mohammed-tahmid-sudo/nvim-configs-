vim.wo.number = true
vim.wo.relativenumber = true
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")

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

		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
		{ "voldikss/vim-floaterm" },
		{
			"stevearc/conform.nvim",
			opts = {
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					java = { "google-java-format" },
					-- Add more
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
		{
			"neovim/nvim-lspconfig",
			dependencies = { "saghen/blink.cmp" },

			opts = {
				servers = {
					lua_ls = {},
				},
			},

			config = function(_, opts)
				local blink = require("blink.cmp")
				local lspconfig = require("lspconfig")

				for server, config in pairs(opts.servers) do
					config.capabilities = blink.get_lsp_capabilities(config.capabilities)
					lspconfig[server].setup(config)
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
				require("lspsaga").setup({})
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
					["<C-Tab>"] = { "snippet_backward", "select_prev", "fallback" }, -- Ctrl‑Tab → prev item/jump
					["<Esc>"] = { "hide", "fallback" },
				},
				completion = { list = { selection = "manual" } },

				appearance = {
					-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
					-- Adjusts spacing to ensure icons are aligned
					nerd_font_variant = "mono",
				},

				-- (Default) Only show the documentation popup when manually triggered
				completion = { documentation = { auto_show = false } },

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
	install = { colorscheme = { "gruvbox" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Theme Setup
vim.o.background = "dark" -- or "light" for light mode

-- Default options:
require("gruvbox").setup({
	terminal_colors = true, -- add neovim terminal colors
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.cmd("colorscheme gruvbox")

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
	print("Code formatted")
end)

vim.keymap.set("n", "<leader>t", function()
	vim.cmd(":FloatermNew")
end)
