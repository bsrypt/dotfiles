---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"
M.ui = {
  theme = "radium",
  theme_toggle = { "radium", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    separator_style = "block",
    overriden_modules = function(modules)
      local modes = {
        ["n"] = { "NORMAL", "St_NormalMode" },
        ["no"] = { "NORMAL (no)", "St_NormalMode" },
        ["nov"] = { "NORMAL (nov)", "St_NormalMode" },
        ["noV"] = { "NORMAL (noV)", "St_NormalMode" },
        ["noCTRL-V"] = { "NORMAL", "St_NormalMode" },
        ["niI"] = { "NORMAL i", "St_NormalMode" },
        ["niR"] = { "NORMAL r", "St_NormalMode" },
        ["niV"] = { "NORMAL v", "St_NormalMode" },
        ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
        ["ntT"] = { "NTERMINAL (ntT)", "St_NTerminalMode" },

        ["v"] = { "VISUAL", "St_VisualMode" },
        ["vs"] = { "V-CHAR (Ctrl O)", "St_VisualMode" },
        ["V"] = { "V-LINE", "St_VisualMode" },
        ["Vs"] = { "V-LINE", "St_VisualMode" },
        [""] = { "V-BLOCK", "St_VisualMode" },

        ["i"] = { "INSERT", "St_InsertMode" },
        ["ic"] = { "INSERT (completion)", "St_InsertMode" },
        ["ix"] = { "INSERT completion", "St_InsertMode" },

        ["t"] = { "TERMINAL", "St_TerminalMode" },

        ["R"] = { "REPLACE", "St_ReplaceMode" },
        ["Rc"] = { "REPLACE (Rc)", "St_ReplaceMode" },
        ["Rx"] = { "REPLACEa (Rx)", "St_ReplaceMode" },
        ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
        ["Rvc"] = { "V-REPLACE (Rvc)", "St_ReplaceMode" },
        ["Rvx"] = { "V-REPLACE (Rvx)", "St_ReplaceMode" },

        ["s"] = { "SELECT", "St_SelectMode" },
        ["S"] = { "S-LINE", "St_SelectMode" },
        [""] = { "S-BLOCK", "St_SelectMode" },
        ["c"] = { "COMMAND", "St_CommandMode" },
        ["cv"] = { "COMMAND", "St_CommandMode" },
        ["ce"] = { "COMMAND", "St_CommandMode" },
        ["r"] = { "PROMPT", "St_ConfirmMode" },
        ["rm"] = { "MORE", "St_ConfirmMode" },
        ["r?"] = { "CONFIRM", "St_ConfirmMode" },
        ["x"] = { "CONFIRM", "St_ConfirmMode" },
        ["!"] = { "SHELL", "St_TerminalMode" },
      }

      local sep = "█"
      modules[1] = (function()
        if not (vim.api.nvim_get_current_win() == vim.g.statusline_winid) then
          return ""
        end
        local m = vim.api.nvim_get_mode().mode
        local current_mode = "%#" .. modes[m][2] .. "#" .. " 󰊠 " .. modes[m][1]
        local mode_sep1 = "%#" .. modes[m][2] .. "Sep" .. "#" .. sep

        return current_mode .. mode_sep1 .. "%#ST_EmptySpace#"
      end)()
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
