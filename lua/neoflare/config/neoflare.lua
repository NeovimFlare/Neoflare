local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
 vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "--single-branch",
  "https://github.com/folke/lazy.nvim.git",
  lazypath,
 })
end

vim.opt.runtimepath:prepend(lazypath)
vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.cmd([[
set termguicolors
set number
]])

require("lazy").setup("neoflare.core.plugins", {
 defaults = { lazy = true },
 install = { colorscheme = { "tokyonight" } },
 checker = { enabled = true },
 change_detection = {
  notify = false,
 },
 performance = {
  rtp = {
   disabled_plugins = {
    "gzip",
    "matchit",
    "matchparen",
    "netrwPlugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
   },
  },
 },
})
