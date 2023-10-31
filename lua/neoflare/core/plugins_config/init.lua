
vim.notify = require('notify')



require("neo-tree").setup({
        source_selector = {
            winbar = true,
            statusline = true
        }
    })

require('nvim-treesitter').setup()

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("toggleterm").setup()
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = '',
    section_separators = { right = '', left = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
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
    lualine_a = {'mode',},
    lualine_b = {'branch', 'diff',},
    lualine_c = {'filetype', 'filename'},
    lualine_x = {},
    lualine_y = {'diagnostics'},
    lualine_z = {'location',},
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
 }
}
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

local function get_diagnostic_label(props)
    local icons = {
        Error = "",
        Warn = "",
        Info = "",
        Hint = "",
    }

    local label = {}
    for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, {severity = vim.diagnostic.severity[string.upper(severity)]})
        if n > 0 then
            local fg = "#" .. string.format("%06x", vim.api.nvim_get_hl_by_name("DiagnosticSign" .. severity, true)["foreground"])
            table.insert(label, {icon .. " " .. n .. " ", guifg = fg})
        end
    end
    return label
end

require("incline").setup({
  debounce_threshold = { falling = 500, rising = 250 },
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local diagnostics = get_diagnostic_label(props)
    local modified = vim.api.nvim_buf_get_option(props.buf, "modified") and "bold,italic" or "None"
    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

    local buffer = {
        { filetype_icon, guifg = color },
        { " " },
        { filename, gui = modified },
    }

    if #diagnostics > 0 then
        table.insert(diagnostics, { "| ", guifg = "grey" })
    end
    for _, buffer_ in ipairs(buffer) do
        table.insert(diagnostics, buffer_)
    end
    return diagnostics
  end,
})

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

require("ibl").setup({})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
	  "tsserver",
	  "lua_ls",
	  "pyright",
	  "clangd",
	  "tailwindcss",
	  "rust_analyzer",
	  "html",
  }
})

require('neoconf').setup({})

require("lspconfig").lua_ls.setup{}
require("lspconfig").pyright.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").tailwindcss.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").html.setup {}
