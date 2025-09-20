-- ~/.config/nvim/lua/myplugin.lua
return {
  "voldikss/vim-floaterm",
  config = function()
		vim.keymap.set("n", "<leader>t", "<cmd>FloatermNew<CR>", { desc = "Open Floating Terminal" })
  end,
}

