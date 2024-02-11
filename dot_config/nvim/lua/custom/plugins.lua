local overrides = require "custom.configs.overrides"
---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = overrides.copilot,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "copilot" },
      },
    },
  },
  {
    "smoka7/hop.nvim",
    cmd = { "HopWord", "HopLine", "HopLineStart", "HopWordCurrentLine" },
    opts = { keys = "etovxqpdygfblzhckisuran" },
    init = function()
      require("core.mappings").hop = {
        n = {
          ["<leader><leader>w"] = { "<CMD> HopWord <CR>", "Hint all words" },
          ["<leader><leader>t"] = { "<CMD> HopNodes <CR>", "Hint Tree" },
          ["<leader><leader>c"] = { "<CMD> HopLineStart<CR>", "Hint Columns" },
          ["<leader><leader>l"] = { "<CMD> HopWordCurrentLine<CR>", "Hint Line" },
        },
      }

      require("core.utils").load_mappings "hop"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle", "TodoTrouble" },
    opts = {},
    init = function()
      require("core.mappings").trouble = {
        plugin = true,
        n = {
          ["<leader>tt"] = { "<CMD>TroubleToggle<CR>", "Toggle diagnostics" },
          ["<leader>tl"] = { "<CMD>TroubleToggle loclist<CR>", "Current File diagnostics" },
          ["<leader>tw"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Workspace diagnostics" },
          ["<leader>tq"] = { "<CMD>TroubleToggle quickfix<CR>", "Quickfix diagnostics" },
        },
      }
      require("core.utils").load_mappings "trouble"
    end,
  },
  {
    "0oAstro/dim.lua",
    event = "LspAttach",
    config = function()
      require("dim").setup {}
    end,
  },
  {
    "overextended/fivem-lls-addon",
  },
  {
    "overextended/ox_lib",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    enabled = true,
  },
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        init = function()
          require("core.mappings").undo = {
            plugin = true,
            n = {
              ["<leader>fu"] = { "<CMD>Telescope undo<CR>", "Find undo" },
            },
          }

          require("core.utils").load_mappings "undo"
          require("telescope").load_extension "undo"
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      extensions_list = { "fzf" },
    },
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
    init = function()
      vim.g.code_action_menu_show_details = true
      vim.g.code_action_menu_show_diff = true
      vim.g.code_action_menu_show_action_kind = true
    end,
    config = function()
      dofile(vim.g.base46_cache .. "git")
    end,
  },
  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- },
}

return plugins
