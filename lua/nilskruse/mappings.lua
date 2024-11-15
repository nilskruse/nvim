vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_set_keymap('n', '<C-p>', ':bn<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<Up>', '<Nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<Down>', '<Nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<Left>', '<Nop>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('', '<Right>', '<Nop>', { noremap = true, silent = true})

