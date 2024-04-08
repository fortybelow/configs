---@type ChadrcConfig
local M = {}

M.ui = { theme = 'vscode_dark' }
M.plugins = "custom.plugins"

vim.api.nvim_create_autocmd({"BufEnter", "SourcePre"}, {
    pattern = "*",
    callback = function()
        local before = require('before')
        vim.keymap.set('n', '<C-h>', before.jump_to_last_edit, {})
        vim.keymap.set('n', '<C-l>', before.jump_to_next_edit, {})
    end,
})

return M
