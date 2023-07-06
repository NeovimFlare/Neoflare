return {
  { "MunifTanjim/nui.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "github/copilot.vim" },
{
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    {
      "<A-s>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "<A-S>",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "t",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "T",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
  },
  { "sunjon/stylish.nvim", event="VeryLazy" },
  { "nvim-telescope/telescope.nvim",},
  { "rebelot/kanagawa.nvim", event = "VimEnter" },
  { "lukas-reineke/indent-blankline.nvim", event="VimEnter" },
   {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
	"lua-language-server",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    event = "VimEnter",
  },
  { "rafi/awesome-vim-colorschemes", event = "VimEnter" },
  { "akinsho/bufferline.nvim", event = "VimEnter",},
  { "nvim-lualine/lualine.nvim", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons", dependencies = {'tpope/vim-fugitive'},
  },
  {"nvim-treesitter/nvim-treesitter", event = "VimEnter"
  },
  {
    'hapless12/alpha',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },

  },
{
 "lewis6991/gitsigns.nvim",
 event = "BufReadPre",
},
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
   },
  {
 "hrsh7th/nvim-cmp",
 event = "InsertEnter",
 dependencies = {
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "L3MON4D3/LuaSnip",
  "onsails/lspkind-nvim",
  }
 },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        },
      },
    },
    {"L3MON4D3/LuaSnip", event = "VeryLazy"},
 {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
},
  { "folke/trouble.nvim", event = "VimEnter" },
  {
    "FeiyouG/command_center.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    event = "VimEnter",
  },
  { "nvim-treesitter/nvim-treesitter", event = "VimEnter" },
  { "ray-x/navigator.lua", event = "VimEnter" },
  {
    "akinsho/toggleterm.nvim",
    event = "VimEnter",
  },
  { 'rcarriga/nvim-notify', event = "VimEnter",
  },
  { "catppuccin/nvim", name = "catppuccin", event = "VimEnter",
  },
  { "EdenEast/nightfox.nvim", event = "VimEnter" },
  { "ellisonleao/gruvbox.nvim", event = "VimEnter" },
  {
    "mbbill/undotree",
    cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
    event = "VimEnter",
  },
  { "NvChad/nvim-colorizer.lua", ft = { "css" }, event = "VimEnter" },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    event = "VimEnter",
  },
  { "folke/tokyonight.nvim", event = "VimEnter" },
}
