vim.keymap.set("n", "<MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<MiddleMouse>", "<Nop>")

vim.keymap.set("n", "<2-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<2-MiddleMouse>", "<Nop>")

vim.keymap.set("n", "<3-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<3-MiddleMouse>", "<Nop>")

vim.keymap.set("n", "<4-MiddleMouse>", "<Nop>")
vim.keymap.set("i", "<4-MiddleMouse>", "<Nop>")

vim.keymap.set("n", "g/", ":noh<CR>")

vim.keymap.set('n', '<leader>rn', function()
	vim.lsp.buf.rename()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>t", function()
	vim.cmd(":FloatermNew")
end)

vim.keymap.set("n", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<C-l>", ":tabnext<CR>")
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")

local cmp = require("cmp")
local copilot_cmp = require("copilot_cmp")

-- cmp.setup({
--   mapping = {
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if copilot_cmp.is_visible() then
--         copilot_cmp.accept()
--       else
--         fallback()
--       end
--     end, { "i", "s" }),
--   },
-- })

vim.keymap.set("i", "<Tab>", function()
  local copilot = require("copilot.suggestion")
  if copilot.is_visible() then
    copilot.accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
  end
end, { noremap = true, silent = true })

