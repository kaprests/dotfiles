require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- vim.opt.backspace = '2'
-- vim.opt.showcmd = true
-- vim.opt.laststatus = 2
-- vim.opt.autowrite = true
-- vim.opt.cursorline = true
-- vim.opt.autoread = true

-- Default settings, may be overridden by ftplugins
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.wildmenu = true
vim.api.nvim_set_option(
  "clipboard",
  "unnamed"
)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
-- vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.cmdheight = 1

-- Fix bad default color of telescope
vim.api.nvim_set_hl(0, 'NormalFloat', {link = 'Normal'})

