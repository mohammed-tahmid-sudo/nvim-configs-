-- Enable both absolute and relative line numbers
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = ' '


-- Ensure packer.nvim is installed and loaded
vim.cmd [[packadd packer.nvim]]

-- Plugin Setup with packer.nvim
require('packer').startup(function(use)
  -- Let packer manage itself
  use 'wbthomason/packer.nvim'
  
  -- LSP configurations
  use 'neovim/nvim-lspconfig'
  
  -- Completion engine and sources
  use 'hrsh7th/nvim-cmp'               -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'           -- LSP completion source
  use 'hrsh7th/cmp-buffer'             -- Buffer completions
  use 'hrsh7th/cmp-path'               -- Filesystem paths completions
  
  -- Snippet support (optional but recommended)
  use 'L3MON4D3/LuaSnip'               -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'       -- Snippet completions
  use 'navarasu/onedark.nvim'

  use 'CRAG666/code_runner.nvim'

  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

  use {
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {}
  end
	}
  use {
  'devkvlt/floaty.nvim',
  config = function()
    require('floaty').setup({
      runners = {
        python = 'python3 {}',
        lua = 'lua {}',
        -- Add more language runners as needed
      }
    })
  end
  }


  use {
  'CRAG666/code_runner.nvim',
  requires = 'CRAG666/betterTerm.nvim',
  config = function()
    require('code_runner').setup({
      mode = 'float', -- Use floating window for output
      filetype = {
        python = "python3 -u",
        c = "gcc -o $fileNameWithoutExt $fileName && ./$fileNameWithoutExt",
        -- Add other filetypes as needed
      },
    })
  end
 }


  use {
  'Pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup({
      -- Your configuration options here
    })
  end
	}

end)


vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function()
    if vim.api.nvim_win_get_config(0).relative ~= "" then
      vim.api.nvim_buf_set_keymap(0, 'n', 'q', ':close<CR>', { noremap = true, silent = true })
    end
  end,
})



local wk = require("which-key")

wk.register({
  f = {
    name = "file", -- Group name displayed by which-key
    f = { ":Telescope find_files<CR>", "Find File" },
    r = { ":Telescope oldfiles<CR>", "Open Recent File" },
    n = { ":enew<CR>", "New File" },
  },
  b = {
    name = "buffer",
    l = { ":ls<CR>", "List Buffers" },
    n = { ":bnext<CR>", "Next Buffer" },
    p = { ":bprevious<CR>", "Previous Buffer" },
    d = { ":bdelete<CR>", "Delete Buffer" },
  },
}, { prefix = "<leader>" })



require('auto-save').setup({
  enabled = true, -- Start auto-save when the plugin is loaded
  execution_message = {
    message = function()
      return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
    end,
    dim = 0.18, -- Dim the color of the message
    cleaning_interval = 1250, -- Message cleaning interval in milliseconds
  },
  trigger_events = {"InsertLeave", "TextChanged"}, -- Events that trigger auto-save
  debounce_delay = 135, -- Delay before saving in milliseconds
  condition = function(buf)
    local fn = vim.fn
    local utils = require("auto-save.utils.data")
    if
      fn.getbufvar(buf, "&modifiable") == 1 and
      utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
      return true -- met condition(s), can save
    end
    return false -- can't save
  end,
  write_all_buffers = false, -- Write all buffers when the current one meets the condition
  on_off_commands = true, -- Create commands `ASToggle`, `ASOn`, and `ASOff`
  clean_command_line_interval = 0, -- Interval for cleaning command line
  debounce_delay = 135 -- Delay before save in milliseconds
})


require('lualine').setup({
  options = {
    theme = 'onedark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  }
})


-- LSP Setup
local lspconfig = require('lspconfig')

-- Python LSP using pyright
lspconfig.pyright.setup{}

-- C/C++ LSP using clangd
lspconfig.clangd.setup{}

-- Setup nvim-cmp for autocompletion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-S-Space>'] = cmp.mapping.complete(),  -- trigger completion
    ['<Up>']    = cmp.mapping.select_prev_item(),  -- select previous item
    ['<Down>']  = cmp.mapping.select_next_item(),  -- select next item
    ['<Tab>']   = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>']    = cmp.mapping.confirm({ select = true }), -- confirm selection
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },
  },
})


vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ';', 'l', { noremap = true, silent = true })

vim.api.nvim_create_augroup("file_saved_group", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = "file_saved_group",
  pattern = "*", -- Applies to all files, adjust as needed
  callback = function()
    print("File saved!")
  end,
})


-- Create a custom `:Run` command to execute the current file and show the output
vim.api.nvim_create_user_command('Run', function()
  local file = vim.fn.expand('%')  -- Get the current file's path
  local filetype = vim.bo.filetype -- Get the filetype to decide how to run it

  local output = ""

  -- Run different commands based on the file type
  if filetype == 'python' then
    -- If it's a Python file, run it with `python3` and capture the output
    output = vim.fn.system('python3 ' .. file)
  elseif filetype == 'c' then
    -- If it's a C file, compile and run it using gcc
    local exe = file:match("(.+)%..+$")  -- Get file name without extension
    vim.fn.system('gcc ' .. file .. ' -o ' .. exe)  -- Compile the C file
    output = vim.fn.system(exe)  -- Run the compiled executable
  else
    output = "Unsupported file type: " .. filetype
  end

  -- Print the output (or error) in the command line
  print(output)
end, {})

vim.cmd.colorscheme("onedark")
vim.api.nvim_set_keymap('i', '<C-Space>', '<Esc>', { noremap = true, silent = true })




function RunFile()
  local file = vim.fn.expand('%')  -- Get the current file's path
  local filetype = vim.bo.filetype   -- Get the filetype
  local cmd = nil

  if filetype == 'python' then
    cmd = { 'python3', file }
  elseif filetype == 'lua' then
    cmd = { 'lua', file }
  else
    print('No runner defined for filetype: ' .. filetype)
    return
  end

  -- Create a new buffer for the terminal
  local buf = vim.api.nvim_create_buf(false, true)

  -- Floating window dimensions and position
  local width = math.ceil(vim.o.columns * 0.8)
  local height = math.ceil(vim.o.lines * 0.5)
  local row = math.ceil((vim.o.lines - height) / 2)
  local col = math.ceil((vim.o.columns - width) / 2)

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
  }
  
  -- Open the floating window
  vim.api.nvim_open_win(buf, true, opts)
  
  -- Run the command in an interactive terminal within the buffer
  vim.fn.termopen(cmd, { cwd = vim.fn.getcwd() })
  
  -- Optional: set the buffer to terminal mode so you can interact with it
  vim.cmd("startinsert")
end

vim.api.nvim_set_keymap('n', '<Leader>r', ':lua RunFile()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'y', ':+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'yy', ':+yy', { noremap = true, silent = true })



