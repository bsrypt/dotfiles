---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-k>"] = {":m .-2 <CR>==", "move up the current line"},
    ["<A-j>"] = {":m .+1 <CR>==", "move down the current line"},
    ["<C-d>"] = {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"}
  },
  i = {
    ["<A-k>"] = {"<Esc>:m .-2<CR>==gi", "move up the current line"},
    ["<A-j>"] = {"<Esc>:m .+1<CR>==gi", "move down the current line"}
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<A-k>"] = {":m '<-2<CR>gv=gv", "move up the current line"},
    ["<A-j>"] = {":m '>+1<CR>gv=gv", "move down the current line"}
  },
}


M.lspconfig = {
  n = {["<leader>ca"] = { "<CMD>CodeActionMenu<CR>", "Code Action Menu" }}
}
-- more keybinds!

return M
