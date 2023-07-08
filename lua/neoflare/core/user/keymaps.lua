-- Load your keymappings here using "map"
local map = vim.api.nvim_set_keymap

map('n', '<leader>t', ':Neotree document_symbols<CR>', {noremap = true, silent = true})
map('n', '<leader>n', ':ToggleTerm<CR>', {noremap = true, silent = true})
