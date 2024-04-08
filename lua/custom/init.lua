-- Define a Lua function that performs the desired series of commands
_G.reformatTabs = function()
  vim.cmd('set ts=2 noet')
  vim.cmd('retab!')
  vim.cmd('set et ts=4')
  vim.cmd('retab')
end

-- Create a key binding that calls the reformatTabs function
vim.keymap.set('n', '<Leader>rt', ':lua reformatTabs()<CR>', {noremap = true, silent = true})

-- Dont continue comments when pressing enter
vim.api.nvim_exec2([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]], { })

-- Swap <C-i> and <C-o> in normal mode
vim.keymap.set('n', '<C-i>', '<C-o>', {noremap = true, silent = true})
vim.keymap.set('n', '<C-o>', '<C-i>', {noremap = true, silent = true})

-- Define ResCur function
function ResCur()
  if vim.fn.line("'\"") <= vim.fn.line("$") then
    -- vim.api.nvim_exec("normal! g`\"", false)
    vim.api.nvim_exec2("normal! g`\"", { })
    return 1
  end
end

-- Autocommand group for saving last known cursor position in file.
vim.cmd [[
  augroup resCur
    autocmd!
    autocmd BufWinEnter * lua ResCur()
  augroup END
]]

-- If one has a particular extension that one uses for binary files (such as exe,
-- bin, etc), you may find it helpful to automate the process with the following
-- bit of autocmds for your <.vimrc>.  Change that "*.bin" to whatever
-- comma-separated list of extension(s) you find yourself wanting to edit:

-- vim -b : edit binary using xxd-format!
-- vim.cmd [[
--     augroup Binary
--       au!
--       au BufReadPre  *.bin let &bin=1
--       au BufReadPost *.bin if &bin | %!xxd
--       au BufReadPost *.bin set ft=xxd | endif
--       au BufWritePre *.bin if &bin | %!xxd -r
--       au BufWritePre *.bin endif
--       au BufWritePost *.bin if &bin | %!xxd
--       au BufWritePost *.bin set nomod | endif
--     augroup END
-- ]]

vim.cmd [[
  nnoremap q: <nop>
  nnoremap Q <nop>
]]
