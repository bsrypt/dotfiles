local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- FIVEM
require("lspconfig").lua_ls.setup {
  on_attach = function(client, buf)
    local current_dir = vim.fn.getcwd() -- Get current working directory
    local found = false
    if vim.fn.filereadable(current_dir .. "/fxmanifest.lua") == 1 then
      found = true
    end
    client.config.settings.Lua.workspace.library[vim.fn.stdpath "data" .. "/lazy/fivem-lls-addon/library"] = found
    on_attach(client, buf)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "Lua5.4",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
