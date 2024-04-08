require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"

package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"


vim.api.nvim_set_keymap("n", "<leader>ww", "<cmd>lua require('telescope').extensions.whaler.whaler()<CR>", { noremap = true, silent = false })
-- vim.api.nvim_set_keymap("n",
--                         "<leader>wn",
-- 			"<cmd>lua require(\"telescope\").extensions.whaler.whaler({" ..
-- 			"    auto_file_explorer = true," ..
-- 			"    auto_cwd = false," ..
-- 			"    file_explorer_config = {plugin_name = \"telescope\", command = \"Telescope find_files\", prefix_dir = \" cwd=\"}," ..
-- 			"    theme = {previewer = true}," ..
-- 			"})<CR>",
--     			{ noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>lua require(\"nvim-navbuddy\").open()<CR>", { noremap = true, silent = false })


vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

require("dash").setup()
