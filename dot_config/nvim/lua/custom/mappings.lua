---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<A-k>"] = { ":m .-2 <CR>==", "move up the current line" },
    ["<A-j>"] = { ":m .+1 <CR>==", "move down the current line" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
  },
  i = {
    ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "move up the current line" },
    ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "move down the current line" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "move up the current line" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "move down the current line" },
  },
}
-- local builtin = require('telescope.builtin')
M.lspconfig = {
  n = {
    ["<leader>ca"] = { vim.lsp.buf.code_action, "[C]ode [A]ction" },
    ["<leader>rn"] = { vim.lsp.buf.rename, "[R]e[n]ame" },
    ["<leader>gd"] = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "[G]oto [D]efinition",
    },
    ["<leader>gr"] = {
      function()
      require("telescope.builtin").lsp_references()
      end,
      "[G]oto [R]eferences",
    },
    ["<leader>gi"] = {
      function()
      require("telescope.builtin").lsp_implementations()
      end,
      "[G]oto [I]mplementation",
    },
    ["<leader>gt"] = {
      function()
      require("telescope.builtin").lsp_type_definitions()
      end,
      "[G]oto [T]ype",
    },
    ["<leader>ds"] = {
      function()
      require("telescope.builtin").lsp_document_symbols()
      end,
      "[D]ocument [S]ymbols",
    },
    ["<leader>ws"] = {
      function()
      require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      "[W]orkspace [S]ymbols",
    },
  },
}
-- more keybinds!

return M
