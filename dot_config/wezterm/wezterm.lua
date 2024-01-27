-- Pull in the wezterm API
local wezterm = require 'wezterm'
local COLORS = require 'theme'
-- This table will hold the configuration.
local config = {}
config.keys = {
  {
    key = ">",
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "?",
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
}
--wezterm.on('window-config-reloaded', function(window, pane)
function detect_host_os()
  -- package.config:sub(1,1) returns '\' for windows and '/' for *nix.
  if package.config:sub(1,1) == '\\' then
    return 'windows'
  else
    -- uname should be available on *nix systems.
    local check = io.popen('uname -s')
    local result = check:read('*l'); check:close()

    if result == 'Darwin' then
      return 'macos'
    else
      return 'linux'
    end
  end
end
local OS = detect_host_os()
local FONT = 16.0
if OS == 'windows' then
  FONT = 12.0
end
if OS == 'macos' then
   config.set_environment_variables = {
    PATH = '/usr/bin/:' .. os.getenv('PATH')
  }
end
--window:toast_notification('wezterm', 'reloaded', nil, 4000)
--end)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end
-- config.font = wezterm.font 'JetBrainsMono NF'
function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end
config.font = wezterm.font_with_fallback {
	{family = 'JetBrainsMono NF', scale = 1.0}  }
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.cell_width = 1.0
config.font_size = FONT
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Gnome"
config.use_fancy_tab_bar = false
config.window_background_opacity = 1.0
config.win32_system_backdrop = 'Mica'
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab.tab_index + 1
    title = wezterm.truncate_right(title, max_width - 2)
    return {
      { Text = " "},
      { Text = title },
      { Text = " " },
    }
  end
)
config.tab_bar_style = {
	window_hide = wezterm.format({
		{ Foreground = { Color = COLORS.success[9] } },
		{ Background= { Color=COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost .. ""  },
	}),
	window_hide_hover = wezterm.format({
		{ Foreground = { Color = COLORS.success[10] } },
		{ Background= { Color=COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost_outline .. "" },
	}),
	window_maximize = wezterm.format({
		{ Foreground = { Color = COLORS.danger[9] } },
		{ Background= { Color= COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost .. "" },
	}),
  window_maximize_hover = wezterm.format({
		{ Foreground = { Color = COLORS.danger[10] } },
		{ Background= { Color= COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost_outline .."" },
	}),
	window_close = wezterm.format({
		{ Foreground = { Color = COLORS.error[9] } },
		{ Background= { Color= COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost .. " " },
	}),
	window_close_hover = wezterm.format({
		{ Foreground = { Color = COLORS.error[10] } },
		{ Background= { Color= COLORS.base[1]} },
		{ Text = "" .. wezterm.nerdfonts.md_ghost_outline .. " " },
	}),
}
config.window_padding = {
  left = 6,
  right = 4,
  top = 0,
  bottom = 0,
}

config.colors = {
  ansi = {
    COLORS.base[12],
    COLORS.error[11],
    COLORS.base[8],
    COLORS.base[11],
    COLORS.primary[11],
    COLORS.base[11],
    COLORS.success[11],
    COLORS.base[12]
  },
  brights = {
    COLORS.base[8],
    COLORS.base[11],
    COLORS.base[11],
    COLORS.primary[11],
    COLORS.info[11],
    COLORS.success[11],
    COLORS.info[11],
    COLORS.base[12]
  },
  foreground = COLORS.base[11],
  background = COLORS.base[1],

  cursor_bg = COLORS.primary[6],
  cursor_fg = COLORS.primary[12],
  cursor_border = COLORS.primary[8],

  selection_fg = COLORS.primary[11],
  selection_bg = COLORS.primary[3],

  scrollbar_thumb = COLORS.base[3],
  split = COLORS.base[6],

  tab_bar = {
    background = COLORS.base[1],
    active_tab = {
      bg_color = COLORS.primary[6],
      fg_color = COLORS.primary[11],
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false
    },
    inactive_tab = {
      bg_color = COLORS.base[1],
      fg_color = COLORS.base[11],
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false
    },
    inactive_tab_hover = {
      bg_color = COLORS.base[5],
      fg_color = COLORS.base[12],
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false
    },
    new_tab = {
      bg_color = COLORS.base[4],
      fg_color = COLORS.base[11],
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false
    },
    new_tab_hover = {
      bg_color = COLORS.base[5],
      fg_color = COLORS.base[12],
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false
    }
  }
}

config.default_prog = { 'fish' }
return config
