local overrides = require "custom.configs.overrides"
---@type NvPluginSpec[]
local plugins = {
  
  { "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" , "NvimTreeOpen"},
    opts = overrides.nvimtree,
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
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
          ["<leader>j"] = { "<CMD> HopWord <CR>", "Hint all words" },
        },
      }

      require("core.utils").load_mappings "hop"
    end,
  },
{
  "NeogitOrg/neogit",
  cmd = {"Neogit"},
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
},
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "Trouble", "TroubleToggle" },
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

      { "nvim-tree/nvim-web-devicons",            enabled = true },
      { "nvim-telescope/telescope-ui-select.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      extensions_list = { "fzf", "ui-select" },
    },
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      -- Main textobject prefixes
      -- around = 'a',
      -- inside = 'i',

      -- Next/last textobjects
      -- around_next = 'an',
      -- inside_next = 'in',
      -- around_last = 'al',
      -- inside_last = 'il',

      -- Move cursor to corresponding edge of `a` textobject
      -- goto_left = 'g[',
      -- goto_right = 'g]',
      require("mini.ai").setup()
      -- Add surrounding with sa (in visual mode or on motion).
      -- Delete surrounding with sd.
      -- Replace surrounding with sr.
      -- Find surrounding with sf or sF (move cursor right or left).
      -- Highlight surrounding with sh.
      require("mini.surround").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    init = function()
      require("core.mappings").todocomment = {
        plugin = true,
        n = {
          ["<leader>td"] = { "<CMD>TodoTelescope<CR>", "Todo/Fix/Fixme" },
        },
      }
      require("core.utils").load_mappings "todocomment"
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
