-- Load your keymappings here using "map"
local map = vim.api.nvim_set_keymap

map('n', '<leader>t', ':Neotree<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':ToggleTerm<CR>', {noremap = true, silent = true})
map('n', '<leader>z', ':Neoconf<CR>', {noremap = true, silent = true})
map('n', '<leader>x', ':Neoconf local<CR>', {noremap = true, silent = true})
map('n', '<leader>m', ':Neoconf global<CR>', {noremap = true, silent = true})
map('n', '<leader>v', ':Neoconf ls<CR>', {noremap = true, silent = true})
map('n', '<leader>b', ':Neoconf show<CR>', {noremap = true, silent = true})
