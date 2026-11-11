vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
})

-- Show all diagnostics on current line in floating window
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { silent = true })
-- Go to next/prev diagnostic
vim.keymap.set('n', '<Leader>n', function() vim.diagnostic.jump({ count = 1, float = true }) end, { silent = true })
vim.keymap.set('n', '<Leader>p', function() vim.diagnostic.jump({ count = -1, float = true }) end, { silent = true })

-- Keymaps for every attached server
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp', { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client.name == 'pyright' then
      vim.keymap.set('n', '<Leader>ii', '<cmd>LspPyrightOrganizeImports<CR>', { buffer = ev.buf, silent = true })
    end
  end,
})

-- Defaults for all servers
vim.lsp.config('*', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Per-server overrides (merged with nvim-lspconfig's defaults)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})

vim.lsp.config('rust_analyzer', {
  -- Use rust-analyzer installed with rustup instead of mason
  cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
})

vim.lsp.config('pyright', {
  settings = {
    python = {
      analysis = { typeCheckingMode = 'off' },
    },
  },
  -- Use poetry virtualenv if the project has one
  before_init = function(_, config)
    local root = config.root_dir
    if not root then return end
    local res = vim.system({ 'poetry', 'env', 'info', '-p' }, { cwd = root, text = true }):wait()
    local env = vim.trim(res.stdout or '')
    if res.code == 0 and #env > 0 then
      config.settings.python = config.settings.python or {}
      config.settings.python.pythonPath = env .. '/bin/python'
    end
  end,
})

-- Mason installs servers; mason-lspconfig auto-enables installed ones
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
    "fortls",
    "omnisharp",
    "dockerls",
    "eslint",
    "html",
    "cssls",
    "bashls",
    "jsonls",
    "sqlls",
    "yamlls",
    "tflint",
  },
})

-- Not installed via mason
vim.lsp.enable('rust_analyzer')
