vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- clear search
vim.keymap.set("n", "<leader>q", ":bp|bd #<CR>", {noremap = true}) -- close buffer
vim.keymap.set('n', '<leader>cb', ':%bdelete|edit #|normal`"<CR>') -- close hidden buffers
vim.keymap.set('n', '<leader>gg', ':LazyGit<CR>') -- " setup mapping to call :LazyGit
