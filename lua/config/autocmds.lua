-- Auto-commands

-- 🔭 Auto-command to open Telescope if starting in a directory 🔭
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    
    -- Check if no arguments (nvim) or if argument is a directory
    if arg == '' or arg == '.' or (arg and vim.fn.isdirectory(arg) == 1) then
      -- Small delay to ensure everything is loaded
      vim.defer_fn(function()
        -- Check if Telescope is available
        local ok, telescope = pcall(require, 'telescope.builtin')
        if ok then
          telescope.find_files({
            prompt_title = '🔍 Find Files',
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
            hidden = true,
          })
        else
          print('📁 Opened directory, but Telescope not available')
        end
      end, 100)
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

-- Aggressively disable C-style indenting for C/C++ files
vim.api.nvim_create_augroup("disable_c_indent", { clear = true })
vim.api.nvim_create_autocmd({"FileType", "BufEnter", "BufWinEnter"}, {
  group = "disable_c_indent",
  pattern = {"c", "cpp", "h", "hpp"},
  callback = function()
    vim.bo.cindent = false
    vim.bo.smartindent = false
    vim.bo.autoindent = true
    vim.bo.indentexpr = ""
  end,
})

