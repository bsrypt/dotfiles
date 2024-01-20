---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-j>"] = {":m .-2 <CR>==", "move down the current line"},
    ["<A-k>"] = {":m .+1 <CR>==", "move up the current line"},
    ["<C-d>"] = {"<C-d>zz"},
    ["<C-u>"] = {"<C-u>zz"},
  },
  i = {
    ["<A-j>"] = {"<Esc>:m .-2<CR>==gi", "move down the current line"},
    ["<A-k>"] = {"<Esc>:m .+1<CR>==gi", "move up the current line"}
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["<A-j>"] = {":m '>+1<CR>gv=gv", "move down the current line"},
    ["<A-k>"] = {":m '<-2<CR>gv=gv", "move up the current line"}
  },
}

-- more keybinds!

return M
