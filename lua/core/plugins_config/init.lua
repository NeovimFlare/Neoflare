vim.notify = require('notify')

require("nvim-tree").setup{}

require('nvim-treesitter').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("toggleterm").setup()

vim.api.nvim_set_keymap(
  'n',
  '<F12>',
  '<Cmd>lua require"stylish".ui_clock()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  '<F1>',
  "<Cmd>lua require'stylish'.ui_menu(vim.fn.menu_get(''), {kind=menu, prompt = 'Main Menu', experimental_mouse = true}, function(res) vim.cmd(res) end)<CR>",
  { noremap = true, silent = true }
)

vim.cmd [[
amenu Plugin.NeovimTree.Open :NvimTreeOpen | amenu Plugin.NeovimTree.Toggle :NvimTreeToggle | amenu Plugin.NeovimTree.Focus :NvimTreeFocus
amenu Plugin.ToggleTerm.Toggle :ToggleTerm
]]

require('lualine').setup {
  options = {
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
}

vim.cmd([[colorscheme catppuccin]])

-- Set up nvim-cmp. 
  local cmp = require'cmp'
require("luasnip.loaders.from_vscode").lazy_load()
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

require('alpha').setup(require'alpha.themes.dashboard'.config)

require('bufferline').setup()

 require("gitsigns").setup({
   signs = {
    add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = {
     hl = "GitSignsChange",
     text = "│",
     numhl = "GitSignsChangeNr",
     linehl = "GitSignsChangeLn",
    },
    delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = {
     hl = "GitSignsDelete",
     text = "‾",
     numhl = "GitSignsDeleteNr",
     linehl = "GitSignsDeleteLn",
    },
    changedelete = {
     hl = "GitSignsChange",
     text = "~",
     numhl = "GitSignsChangeNr",
     linehl = "GitSignsChangeLn",
    },
    untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
   },
  })


require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
})
  -- 


require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
})
  -- 


vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
	  "tsserver",
	  "lua_ls",
	  "pyright",
	  "clangd",
	  "tailwindcss",
	  "rust_analyzer",
  }
})

require("lspconfig").lua_ls.setup{}
require("lspconfig").pyright.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").tsserver.setup {}
