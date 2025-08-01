-- Custom commands and functions

-- Run Command for Executing Code
vim.api.nvim_create_user_command('Run', function()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  if ft == 'python' then
    print(vim.fn.system('python3 ' .. file))
  elseif ft == 'c' then
    local exe = file:match("(.+)%..+$")
    vim.fn.system('gcc ' .. file .. ' -o ' .. exe)
    print(vim.fn.system(exe))
  else
    print('Unsupported file type: ' .. ft)
  end
end, {})

-- Floating Terminal Runner via Floaterm
function RunFile()
  local file = vim.fn.expand('%')
  local ft = vim.bo.filetype
  local cmd
  if ft == 'python' then
    cmd = 'FloatermNew --autoclose=0 python3 ' .. file
  elseif ft == 'lua' then
    cmd = 'FloatermNew --autoclose=1 lua ' .. file
  elseif ft == 'c' then
    local exe = vim.fn.expand('%:r')
    cmd = 'FloatermNew --autoclose=0 sh -c "gcc ' .. file .. '  -std=c23 -o ' .. exe .. ' && ./' .. exe .. '"'
  elseif ft == 'cpp' then
    local exe = vim.fn.expand('%:r')
    cmd = 'FloatermNew --autoclose=0 sh -c "g++ ' .. file .. '  -Wall -std=c++23  -o ' .. exe .. ' && ./' .. exe .. '"'
  elseif ft == 'javascript' then
    cmd = 'FloatermNew --autoclose=0 node ' .. file
  else
    print('No runner for filetype: ' .. ft)
    return
  end
  vim.cmd(cmd)
end


