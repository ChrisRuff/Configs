local g = vim.g
local M = {}

g.mapleader = ","

M.general = {
  n = {
    ["<C-p>"] = { "<cmd>Telescope find_files<CR>", "Find File" },
    ["<C-t>"] = { "<cmd>Telescope live_grep<CR>", "Live Grep"},
    ["]"] = { "n", "Next search result"},
    ["["] = { "N", "Previous search result"},
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = { "<cmd> DapContinue <CR>", "Start or Continue" },
    ["<leader>dr"] = { "<cmd> DapRestart <CR>", "Restart" },
    ["<leader>ds"] = { "<cmd> DapStop <CR>", "Stop" },
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" },
    ["<leader>de"] = { "<cmd> DapStepOver <CR>", "Step Over" },
    ["<leader>di"] = { "<cmd> DapStepInto <CR>", "Step Into" },
    ["<leader>do"] = { "<cmd> DapStepOut <CR>", "Step Out" },
  },
}

return M
