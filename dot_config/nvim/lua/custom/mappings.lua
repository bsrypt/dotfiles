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

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}
M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    --
    -- -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}
-- more keybinds!

return M
