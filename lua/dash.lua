-- local actions = { ["NVIMRC"]="e ~/.config/nvim/init.lua", ["FIND-FILES"]="Tele find_files", ["OLDFILES"]="Tele oldfiles", ["LAST-SESSION"]="echo 'Nothing!'" }
-- local hls = { Error='[░▒]', Function='[▓█▄▀▐▌]', Bruh='\\zs.*\\ze', BruhRev='[]' }
-- local header = {
--     "","", "", "", "", "",
--     [[                                                                                             NVIMRC              ]],
--     [[                                                                                                                   ]],
--     [[                                                                                                                   ]],
--     [[                                                                                           FIND-FILES            ]],
--     [[                                                                                                                   ]],
--     [[                                                                                                                   ]],
--     [[                                                                                            OLDFILES             ]],
--     [[                                                                                                                   ]],
--     [[                                                                                                                   ]],
--     [[                                                                                            SESSIONS             ]]
-- }
--
-- return {
-- 	setup = vim.schedule_wrap(function()
-- 		local arg = vim.fn.argv(0)
-- 		if arg and (vim.fn.isdirectory(arg) ~= 0) or arg == "" then
-- 			Do = function(word) vim.cmd(actions[word] or 'echo "Aaaaah!"') end
-- 			local gc = vim.opt.guicursor:get()
-- 			vim.cmd.edit("bruh")
-- 			vim.opt.guicursor = "n:block-Normal"
--
--       for hl, pt in pairs(hls) do
--         vim.fn.matchadd(hl, pt)
--       end
--
-- 			vim.cmd [[hi Bruh guibg=#a9b665 guifg=black gui=bold]]
-- 			vim.cmd [[hi BruhRev guifg=#a9b665 gui=bold]]
-- 			vim.api.nvim_put(header, "l", true, true)
-- 			vim.cmd [[silent! setl nonu nornu nobl acd ft=dashboard bh=wipe bt=nofile]]
--
-- 			vim.keymap.set('n', '<LeftMouse>', '<LeftMouse><Cmd>lua Do(vim.fn.expand("<cword>"))<CR>', { buffer=0 })
-- 			vim.opt.statusline = "%#Function#%=󰕮 Dash%="
--
-- 			local image = require("image").from_file("/home/vagrant/Neovim-mark.svg.png", { x=30, y=5, height=25 })
-- 			image:render()
-- 			vim.api.nvim_create_autocmd("BufLeave", {once=true, callback=function()
--         for hl, _ in pairs(hls) do
--           vim.fn.matchdelete(hl)
--         end
-- 				image:clear()
-- 				vim.opt.guicursor = gc
-- 			end })
-- 		end
-- 	end)
-- }

return {
	setup = vim.schedule_wrap(function()
		local arg = vim.fn.argv(0)
		if arg and (vim.fn.isdirectory(arg) ~= 0) or arg == "" then
			vim.cmd [[Telescope oldfiles]]
		end
	end)
}
