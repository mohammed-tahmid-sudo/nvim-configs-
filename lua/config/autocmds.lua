-- Auto-commands

-- Auto-command to open Telescope if starting in a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == '.' then
      require('telescope.builtin').find_files()
    end
  end
})

-- Auto-save notification
vim.api.nvim_create_augroup("file_saved_group", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "file_saved_group",
  pattern = "*",
  callback = function()
    print("File saved!")
  end,
})

