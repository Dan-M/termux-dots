-- Plugins --
require('plugins')
-- run packer when plugins change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
    autocmd BufWritePost plugins.lua source <afile> | PackerClean
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Globals --
local g = vim.g
g.mapleader = ' '

g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

vim.cmd [[colorscheme catppuccin]]

-- Options --
local opt = vim.opt
opt.clipboard = { "unnamedplus" }
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.expandtab = true
opt.hidden = true -- background buffers

-- Key maps --
-- helper
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- hop multi line f/t motions
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>", {})
map('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, hint_offset = -1 })<cr>", {})
map('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, hint_offset = 1 })<cr>", {})

-- Telescope
map('n', '<leader>t', '<cmd>:Telescope<cr>', {})
map('n', '<leader>f', '<cmd>:Telescope find_files theme=dropdown<cr>', {})
map('n', '<leader>b', '<cmd>:Telescope buffers theme=dropdown<cr>', {})
map('n', '<leader>s', '<cmd>:Telescope live_grep theme=dropdown<cr>', {})

