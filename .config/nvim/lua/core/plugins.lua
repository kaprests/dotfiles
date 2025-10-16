local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    colorscheme "one_monokai"
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
  }
  use "cpea2506/one_monokai.nvim"
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use { "chrisgrieser/nvim-spider" }
  use 'lervag/vimtex'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- lsp
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
  use 'stevearc/oil.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-dadbod'
  use 'tpope/vim-abolish'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'ThePrimeagen/vim-be-good'
  use 'ThePrimeagen/git-worktree.nvim'
  -- Start copilot with `:Copilot setup`
  --use {'github/copilot.vim', branch = 'release' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  --
  ---- nvim v0.7.2
  use({
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  use 'christoomey/vim-tmux-navigator'
--  use { 'christoomey/vim-tmux-navigator', config = function()
--          local nvim_tmux_nav = require('vim-tmux-navigator')
--          nvim_tmux_nav.setup {
--              disable_when_zoomed = true -- defaults to false
--          }
--          vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
--          vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
--          vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
--          vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
--          vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
--          vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
--      end
--  }
  use 'itchyny/vim-qfedit' -- Edit quickfix list freely
  if packer_bootstrap then
    require('packer').sync()
  end
end)
