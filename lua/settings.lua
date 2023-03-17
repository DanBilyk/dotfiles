local opt = vim.opt

-----------------------------------------------------------
-- ОБЩИЕ ОПЦИИ
-----------------------------------------------------------
opt.mouse = 'a'              --Включит мышь
opt.encoding = 'utf-8'       --Кодировка
opt.showcmd = true           --Отображение команд
vim.cmd([[
filetype indent plugin on
syntax enable
]])
opt.swapfile = false         --Не создаем свап файлы
opt.backup = false
vim.cmd[[colorscheme gruvbox-baby]]
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opt.undofile = true
--opt.clipboard = autoselect
vim.g.clipboard = xclip
opt.laststatus = 0
opt.scrolloff = 8           --расстояние до верхнего/нижнего края
opt.colorcolumn =  '80'     --Расположение цветной колонки
opt.updatetime = 50
opt.incsearch = true
opt.hlsearch = false
opt.autoread = true
opt.smartindent = true

-----------------------------------------------------------
-- ВИЗУАЛЬНЫЕ ОПЦИИ
-----------------------------------------------------------
opt.number = true            --Номер строк сбоку
opt.relativenumber = true    --Относительная нумерация
opt.wrap = false             --Длинные линии будет видно
opt.expandtab = true         --???
opt.tabstop = 4              --1 tab = 4 пробела
opt.softtabstop = 4
opt.smartindent = true
opt.shiftwidth = 4           --Смещаем на 4 пробела
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.shm = 'I'

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- identline
vim.g.indentLine_char = '┊'
vim.g.indentLine_setConceal = 0

-- 2 spaces for selected filetypes
vim.cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]


-- remove line lenght marker for selected filetypes
vim.cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

opt.cursorline = true        -- Подсветка строки с курсором
opt.termguicolors = true

-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
vim.g.tagbar_compact = 1
vim.g.tagbar_sort = 0

vim.g.python3_host_prog = '/usr/bin/python3'

-----------------------------------------------------------
-- НАСТРОЙКИ ПОИСКА
-----------------------------------------------------------
-- Будет игнорировать размер букв при поиске
opt.ignorecase = true        --Игнорировать размер букв
opt.smartcase = true         --Игнор прописных буквj

-----------------------------------------------------------
-- ПОЛЕЗНЫЕ ФИШКИ
-----------------------------------------------------------
-- Подсвечивает на доли секунды скопированную часть текста
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)

-----------------------------------------------------------
-- НАСТРОЙКИ ПЛАГИНОВ
-----------------------------------------------------------
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
},
}

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require'nvim-treesitter.configs'.setup {
    -- Парсеры, которые мы собираемся использовать
    ensure_installed = { "lua", "python", "bash", "help"},
    sync_install = false,
    auto_install = true,
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
require("gruvbox-baby.colors").config()

--require('nvim-cheat')
vim.g.cheat_default_window_layout = 'vertical_split'

-- require('lualine').setup()
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox_dark',
        component_separators = '',
        section_separators = '',
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
}
local custom_gruvbox = require'lualine.themes.gruvbox'
