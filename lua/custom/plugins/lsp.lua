return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require 'custom.config.lsp'
    end,
    cmd = { 'LspInfo', 'LspInstall', 'LspUninstall' },
  },
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta',     lazy = true },
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>lf',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = 'Lsp Format buffer',
      },
    },
    config = function()
      require 'custom.config.conform'
    end,
  },
  { 'patricorgi/vim-snakemake', ft = 'Snakefile' },
  {
    'ray-x/lsp_signature.nvim',
    ft = { 'python', 'cpp' },
    main = 'lsp_signature',
    opts = {
      hint_enable = false, -- disable hints as it will crash in some terminal
    },
    specs = {
      {
        'folke/noice.nvim',
        optional = true,
        opts = {
          lsp = {
            signature = { enabled = false },
            hover = { enabled = false },
          },
        },
      },
    },
  },
}
