-- LSP config (native vim.lsp.config + vim.lsp.enable)
return {
	'neovim/nvim-lspconfig',
	event = { 'BufReadPre', 'BufNewFile' },
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		{ 'antosha417/nvim-lsp-file-operations', config = true },
		{ 'folke/neodev.nvim',                   opts = {} },
	},
	config = function()
		-- Mason install
		local ok_mason, mason = pcall(require, 'mason')
		local ok_mason_lsp, mason_lspconfig = pcall(require, 'mason-lspconfig')
		if ok_mason then mason.setup() end
		if ok_mason_lsp then
			mason_lspconfig.setup({ ensure_installed = { 'clangd', 'rust_analyzer', 'pylsp' } })
		end

		-- Capabilities
		local ok_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
		local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities()
			or vim.lsp.protocol.make_client_capabilities()

		-- Keymaps via LspAttach
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(ev)
				local buf = ev.buf
				local km = vim.keymap.set
				km('n', 'K', vim.lsp.buf.hover, { buffer = buf, silent = true })
				km('n', 'gd', vim.lsp.buf.definition, { buffer = buf, silent = true })
				km('n', 'gR', vim.lsp.buf.references, { buffer = buf, silent = true })
				km('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = buf, silent = true })
			end,
		})

		-- Mason
		mason_lspconfig.setup({
			ensure_installed = {
				'clangd',
				'rust_analyzer',
				'pylsp',
				'tsserver', -- JS/TS
				'asm_lsp',
			},
		})

		-- clangd config
		vim.lsp.config('clangd', {
			capabilities = capabilities,
			settings = {
				clangd = { fallbackFlags = { "-std=c11" } },
			},
		})
		vim.lsp.enable('clangd')

		-- rust_analyzer config
		vim.lsp.config('rust_analyzer', {
			capabilities = capabilities,
			settings = {
				['rust-analyzer'] = {
					cargo = { allFeatures = true },
					checkOnSave = { command = "clippy" },
				},
			},
		})
		vim.lsp.enable('rust_analyzer')

		-- pylsp config
		vim.lsp.config('pylsp', {
			capabilities = capabilities,
			settings = {
				pylsp = {
					plugins = {
						pycodestyle     = { enabled = false },
						pyflakes        = { enabled = false },
						pylint          = { enabled = false },
						mccabe          = { enabled = false },
						rope_completion = { enabled = true },
					},
				},
			},
		})
		vim.lsp.enable('pylsp')

		vim.lsp.config('asm_lsp', {
			capabilities = capabilities,
		})
		vim.lsp.enable('asm_lsp')

		-- JavaScript / TypeScript
		vim.lsp.config('tsserver', {
			capabilities = capabilities,
			settings = {
				typescript = { inlayHints = { includeInlayParameterNameHints = 'all' } },
				javascript = { inlayHints = { includeInlayParameterNameHints = 'all' } },
			},
		})

		vim.lsp.enable('tsserver')


	end,
}
