vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Автоустановка пакетного менеджера
  use 'wbthomason/packer.nvim'
  ---------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  ---------------------------------------------------------
  -- Тема в стиле gruvbox-baby
  use 'luisiacc/gruvbox-baby'
  ---------------------------------------------------------
  -- МОДУЛИ РЕДАКТОРА
  ---------------------------------------------------------
  -- Структура классов и функций в файле
  use 'majutsushi/tagbar'
  -- Древо изменений
  use 'mbbill/undotree'
  -- Файл пикер vifm
  use 'vifm/vifm.vim'
  -- Статусная строка
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}
-- identline
use 'Yggdroot/indentLine'
-- cheet.sh
use {
  'RishabhRD/nvim-cheat.sh',
  requires = {{'RishabhRD/popfix'}},
  as = "nvim-cheat",
}
-- git integration
use 'tpope/vim-fugitive'
use 'kdheepak/lazygit.nvim'
-- floating windows
use 'voldikss/vim-floaterm'

  ---------------------------------------------------------
  -- ПОИСК
  ---------------------------------------------------------
  -- Наш FuzzySearch
  use { 'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} },
      config = function() 
      require'telescope'.setup {}
  end, }
  ---------------------------------------------------------
  -- LSP И АВТОДОПОЛНЯЛКИ
  ---------------------------------------------------------
  -- Collection of configurations for built-in LSP client
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Линтер, работает для всех языков
--  use 'dense-analysis/ale'
  ---------------------------------------------------------
  -- РАЗНОЕ
  ---------------------------------------------------------
  -- Даже если включена русская раскладка, то nvim-команды будут работать
  use 'powerman/vim-plugin-ruscmd'
end)
