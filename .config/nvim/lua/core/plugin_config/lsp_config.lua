require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "pyright", "tsserver", "fortls" },
}

vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
})

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)
-- Go to next diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>',
  { noremap = true, silent = true }
)
-- Go to prev diagnostic (if there are multiple on the same line, only shows
-- one at a time in the floating window)
vim.api.nvim_set_keymap(
  'n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>',
  { noremap = true, silent = true }
)

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}
require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    -- Use rust-analyzer installed with rustup instead
    -- of installing with mason-lspconfig
    'rustup', 'run', 'stable', 'rust-analyzer',
  }
}
require("lspconfig").pyright.setup {
  on_attach = (
    function()
      on_attach()
      vim.keymap.set("n", "<Leader>ii", "<cmd>PyrightOrganizeImports<CR>", {
        silent = true,
        noremap = true,
      })
    end
  ),
  capabilities = capabilities,
  analysis = {
    typeCheckingMode = "off",
  },
  on_new_config = function(config, root_dir)
    local env = vim.trim(vim.fn.system('cd "' .. root_dir .. '"; poetry env info -p 2>/dev/null'))
    if string.len(env) > 0 then
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end
}
require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
require("lspconfig").fortls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
