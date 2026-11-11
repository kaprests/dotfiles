-- nvim-treesitter (main branch): only installs parsers/queries.
-- Highlighting, indent and selection are handled by Neovim itself.
local ts = require('nvim-treesitter')

ts.install({
  "c", "lua", "rust", "ruby", "python", "vim", "fortran", "sql",
  "javascript", "typescript", "tsx", "html", "json", "yaml", "css",
  "markdown", "bash", "fish", "dockerfile", "gitignore",
})

local function enable(buf)
  if pcall(vim.treesitter.start, buf) then
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('user_treesitter', { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then return end
    if vim.treesitter.language.add(lang) then
      enable(ev.buf)
    elseif vim.tbl_contains(ts.get_available(), lang) then
      -- auto_install replacement: install missing parser, then enable
      ts.install(lang):await(function()
        if vim.api.nvim_buf_is_valid(ev.buf) then enable(ev.buf) end
      end)
    end
  end,
})

-- Incremental selection (built-in `an`/`in` in 0.12), on the old keys
vim.keymap.set('n', '<C-space>', 'van', { remap = true, desc = 'Start node selection' })
vim.keymap.set('x', '<C-space>', 'an', { remap = true, desc = 'Expand node selection' })
vim.keymap.set('x', '<BS>', 'in', { remap = true, desc = 'Shrink node selection' })
