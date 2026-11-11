-- Plugins managed by the built-in package manager (vim.pack, nvim >= 0.12)
-- Update:  :lua vim.pack.update()
-- Remove:  delete from list, then :lua vim.pack.del({ 'name' })

-- Build hooks (must be defined before vim.pack.add to run on install)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  gh('nvim-tree/nvim-web-devicons'),
  gh('nvim-lualine/lualine.nvim'),
  { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' },
  gh('nvim-treesitter/nvim-treesitter-context'),
  gh('cpea2506/one_monokai.nvim'),
  -- completion
  gh('hrsh7th/nvim-cmp'),
  gh('hrsh7th/cmp-nvim-lsp'),
  gh('L3MON4D3/LuaSnip'),
  gh('saadparwaiz1/cmp_luasnip'),
  gh('rafamadriz/friendly-snippets'),
  -- editing / navigation
  gh('chrisgrieser/nvim-spider'),
  gh('lervag/vimtex'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),
  gh('stevearc/oil.nvim'),
  gh('christoomey/vim-tmux-navigator'),
  gh('itchyny/vim-qfedit'), -- Edit quickfix list freely
  -- lsp
  gh('williamboman/mason.nvim'),
  gh('williamboman/mason-lspconfig.nvim'),
  gh('neovim/nvim-lspconfig'),
  -- git / db / misc
  gh('tpope/vim-fugitive'),
  gh('tpope/vim-dadbod'),
  gh('tpope/vim-abolish'),
  gh('kristijanhusak/vim-dadbod-ui'),
  gh('kristijanhusak/vim-dadbod-completion'),
  gh('kdheepak/lazygit.nvim'),
  -- Start copilot with `:Copilot setup`
  -- { src = gh('github/copilot.vim'), version = 'release' },
})
