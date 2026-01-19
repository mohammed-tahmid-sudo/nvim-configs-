return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>F",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
		},
	},
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			rust = { "rustfmt" },
			python = { "black" },
			lua = { "stylua" },
			javascript = { "prettier" },

		},
	},
}
