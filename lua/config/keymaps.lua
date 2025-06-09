-- Key mappings

-- WhichKey Mappings
require("which-key").add({
  -- File
  { "<leader>f",  group = "file" },
  { "<leader>ff", ":Telescope find_files<CR>",  desc = "Find File",   remap = false },
  { "<leader>fr", ":Telescope oldfiles<CR>",    desc = "Recent File", remap = false },
  { "<leader>fn", ":enew<CR>",                  desc = "New File",   remap = false },

  -- Buffer
  { "<leader>b",  group = "buffer" },
  { "<leader>bl", ":ls<CR>",                    desc = "List Buffers", remap = false },
  { "<leader>bn", ":bnext<CR>",                 desc = "Next Buffer",  remap = false },
  { "<leader>bp", ":bprevious<CR>",             desc = "Prev Buffer",  remap = false },
  { "<leader>bd", ":bdelete<CR>",               desc = "Delete Buffer", remap = false },

  -- Git
  { "<leader>g",  group = "git" },
  { "<leader>gs", ":Git status<CR>",             desc = "Git Status",   remap = false },
  { "<leader>ga", ":Git add .<CR>",              desc = "Git Add All",  remap = false },
  { "<leader>gc", ":Git commit<CR>",             desc = "Git Commit",   remap = false },
  { "<leader>gp", ":Git push<CR>",               desc = "Git Push",     remap = false },
  { "<leader>gl", ":Git pull<CR>",               desc = "Git Pull",     remap = false },
  { "<leader>gb", ":Git blame<CR>",              desc = "Git Blame",    remap = false },
}, {
  mode = "n",
  noremap = true,
  silent = true,
})

-- Additional key mappings
vim.api.nvim_set_keymap('n', '<C-Space>', ':lua RunFile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', 'b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', 'w', { noremap = true, silent = true })

