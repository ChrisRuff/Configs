local config = require("core.utils").load_config()

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local xpr = {noremap = true, expr = true}

-- Colemak Keybindings {{{
----------------------
map('n', 'n', 'h', opts)
map('x', 'n', 'h', opts)
map('o', 'n', 'h', opts)
map('n', 'e', 'j', opts)
map('x', 'e', 'j', opts)
map('o', 'e', 'j', opts)
map('n', 'i', 'k', opts)
map('x', 'i', 'k', opts)
map('o', 'i', 'k', opts)
map('n', 'o', 'l', opts)
map('x', 'o', 'l', opts)
map('o', 'o', 'l', opts)

-- Colemak Insert
map('n', 'h', 'i', opts)
map('n', 'H', 'I', opts)
map('x', 'h', 'i', opts)
map('x', 'H', 'I', opts)
map('o', 'h', 'i', opts)
map('o', 'H', 'I', opts)

-- window & tab controls
map('n', '<leader>ss', ':sp<space>', opts)
map('n', '<leader>vs', ':vsp<space>', opts)
-- tab controls -- ctrl-t makes a new tab
map('n', '<C-t>', '<Esc>:tabnew<CR>', opts) -- Check collision!
-- shift T turn a split window into a tab
map('n', '<S-T>', '<Esc><C-w>T', opts) -- Check collision!
map('n', 'te', ':tabnext<CR>', opts)
map('n', 'tn', ':tabprev<CR>', opts)
map('n', 'th', ':tabfirst<CR>', opts)
map('n', 'ti', ':tablast<CR>', opts)

map('n', '<S-e>', '3j', opts)
map('n', '<S-i>', '3k', opts)
