require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.cursorline = true
-- vim.opt.autoread = true

vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.wildmenu = true
vim.api.nvim_set_option("clipboard","unnamed")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.shiftround = true
vim.opt.expandtab = true

-- Fix bad default color of telescope
vim.api.nvim_set_hl(0, 'NormalFloat', {link = 'Normal'})

