require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "ruby",
    "python",
    "vim",
    "fortran",
    "sql",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "json",
    "yaml",
    "css",
    "markdown",
    "bash",
    "fish",
    "dockerfile",
    "gitignore",
  },

  -- Install parsers synchronously (only applied to 'ensure_installed')
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>", -- ctrl space
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>", -- backspace
    }
  }
}
