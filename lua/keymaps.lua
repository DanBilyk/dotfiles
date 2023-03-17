local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

vim.g.mapleader = " "
-----------------------------------------------------------
-- НАВИГАЦИЯ
-----------------------------------------------------------
-- Отключаем стрелочки в Нормальном Режиме. Хардкор!
map('', '<up>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use hjkl, bro"<CR>', {noremap = true, silent = false})
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-----------------------------------------------------------
-- ПОИСК
-----------------------------------------------------------
-- Fuzzy Search. CTRL+a для поиска по файлам, CTRL+p для поиска по буфферам
map('n', '<leader>pf', [[ <cmd>lua require('telescope.builtin').find_files()<cr> ]], default_opts)
map('n', '<leader>pb', [[ <cmd>lua require('telescope.builtin').buffers()<cr> ]], default_opts)
-- <S-F5> Греповский поиск слова под курсором
map('n', '<S-F5>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Греповский поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-----------------------------------------------------------
-- ФАЙЛЫ
-----------------------------------------------------------
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<leader>t', ':TagbarToggle<CR>', default_opts)
-- Показ древа истори изменения undootree
map('n', "<leader>u", ':UndotreeToggle<CR>', default_opts)
-- Файлпикер vifm
map('n', "<leader>vf", ':Vifm<CR>', default_opts)
-- cheat.sh
map('n', '<leader>cs', ':Cheat<CR>', default_opts)
-- git
map('n', '<leader>gs', ':G<CR>', default_opts)
map('n', '<leader>gg', ':LazyGit<CR>', default_opts)
-----------------------------------------------------------
-----------------------------------------------------------
-- Перемещение выделенных блоков вверх/вниз
map('v', 'J', ":m '>+1<CR>gv=gv", default_opts)
map('v', 'K', ":m '<-2<CR>gv=gv", default_opts)
-- Прокрутка на пол страницы с центрированием
map('n', '<C-d>', '<C-d>zz', default_opts)
map('n', '<C-u>', '<C-u>zz', default_opts)
-- Поиск следующего с центрирование
map('n', 'n', 'nzzzv', default_opts)
map('n', 'N', 'Nzzzv', default_opts)
-- Замена выделенного без потери буфера обмена
map('x', '<leader>p', "\"_dp", default_opts)
-- КОпирование в системный буфер обмена
map('n', '<leader>y', "\"+y", default_opts)
map('v', '<leader>y', "\"+y", default_opts)
map('n', '<leader>Y', "\"+Y", default_opts)
-- Переключение между tmux сессиями 
map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>', default_opts)
