-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration
local config = {}

--[[
config.font = wezterm.font("Iosevka Semibold Extended")
base = 32e
scale = 1.3
ratio = 1.06
--]]
--[[
config.font = wezterm.font("Iosevka Semibold")
base = 34
scale = 1.3
ratio = 1.16
--]]
--[[
config.font = wezterm.font("comic mono")
base = 32
scale = 1.3
ratio = 0.93
--]]
--
--config.font = wezterm.font("Jetbrains Mono NL Light")
--config.font = wezterm.font("Jetbrains Mono")
--config.font = wezterm.font("Jetbrains Mono NL Semibold")
--config.font = wezterm.font("JetBrains Mono NL", { weight = "Bold" })
config.font = wezterm.font("JetbrainsMonoNL NFM")
base = 26.7
scale = 1.33
ratio = 1.08
--]]
--[[
config.font = wezterm.font("IBM Plex Mono")
base = 32
scale = 1
ratio = 1
--]]
--[[
config.font = wezterm.font("Source Code Pro")
base = 32
scale = 1
ratio = 1
--]]
--[[
config.font = wezterm.font("input mono", { weight = "Regular" })
base = 31
scale = 1/0.8
ratio = 1
--]]
--[[
config.font = wezterm.font("roboto mono")
base = 30
scale = 1.42
ratio = 1.06
--]]
--[[
config.font = wezterm.font("hack")
base = 32
scale = 1.25
ratio = 1
--]]
--[[
config.font = wezterm.font("monocraft")
base = 32
scale = 1.05
ratio = 1/1.08
config.freetype_load_flags = "NO_HINTING"
config.freetype_load_target = "Mono"
--config.freetype_render_target = "None"
--]]
--[[	too bunched up on one line
config.font = wezterm.font("Fira Code")
base = 31
scale = 1.25
ratio = 1.05
--]]
--[[
config.font = wezterm.font("ibm plex mono")
base = 31
scale = 1/0.75
ratio = 1.08
--]]
--[[
config.font = wezterm.font("iosevka")
base = 34
scale = 1/0.8
ratio = 1.16
--]]
--[[
config.font = wezterm.font("Terminus")
base = 999
scale = 1--.05
ratio = 1.05
--]]

-- variables for smart font sizing
display_scale = 1.5
cols = 100
rows = 30
base = base * 1
scale = scale * 1 / ((rows / 24 + cols / 80) / 2)
ratio = ratio * 1

config.alternate_buffer_wheel_scroll_speed = 1
config.animation_fps = 60
--config.dpi = 160
config.font_size = base * scale / display_scale
config.cell_width = ratio / scale / cols * 80
config.line_height = 1 / ratio / scale / rows * 24
config.default_cursor_style = "SteadyUnderline"
--config.default_prog = { '/usr/bin/fish', '-l', '-c', 'yazi' }
--config.enable_scroll_bar = true
config.enable_tab_bar = false
--config.font_size = 12.5
--config.freetype_load_target = "Light"
--config.front_end = "Software"
config.hide_tab_bar_if_only_one_tab = false
config.initial_rows = rows
config.initial_cols = cols
--config.integrated_title_button_style = "Windows"
--config.window_background_opacity = 0.9
--config.kde_window_background_blur = true
config.show_tabs_in_tab_bar = true
config.tab_and_split_indices_are_zero_based = true
--config.tab_bar_at_bottom = true
--config.text_background_opacity = 1
--config.use_resize_increments = true
config.window_decorations = "TITLE | RESIZE"
config.window_padding = { left = "0cell", right = "0cell", top = "0cell", bottom = "0cell" }
config.enable_wayland = true

--config.color_scheme_dirs = { '/home/daa/.config/wezterm/colors' }
--config.color_scheme = 'dark'
--config.color_scheme = 'light'
--config.color_scheme = 'Alabaster'
--config.color_scheme = "Catppuccin Latte"
--config.color_scheme = 'Catppuccin Frappe'
--config.color_scheme = 'Catppuccin Macchiato'
--config.color_scheme = "Catppuccin Mocha"
--config.color_scheme = 'Harmonic16 Light (base16)'
--config.color_scheme = 'Abernathy'
--config.color_scheme = 'Windows 10 Light (base16)'
--config.color_scheme = 'deep'
--config.color_scheme = 'PaperColor Light (base16)'
--
wezterm.on("window-config-reloaded", function(window)
	local appearance = window:get_appearance()
	if appearance:find("Dark") then
		window:set_config_overrides({ color_scheme = "Catppuccin Mocha" })
	else
		window:set_config_overrides({ color_scheme = "Catppuccin Latte" })
	end
end)

config.colors = {
	--
	--	foreground = '#ffffff',
	--	foreground = '#000000',
	--	background = '#000000',
	--	background = '#ffffff',
	--[[
--	background = '#ffffff',
	cursor_bg = '#ffffff',
	cursor_fg = '#000000',
--	cursor_border = '#ffffff',
	compose_cursor = '#bbbbbb',
	selection_fg = '#000000',
	selection_bg = '#7f7f7f',
--	scrollbar_thumb = '#000000',
--	split = '#444444',


-- generated carefully from hpluv color picker (visit hsluv website)



        ansi =
        {       '#000000', -- black
                '#e9b07b', -- red
                '#34d2b0', -- green
                '#a6c76c', -- yellow
                '#d3abf9', -- blue
                '#fe9fc6', -- magenta
                '#60c8ef', -- cyan
                '#bbbbbb', -- white
        },
        brights =
        {       '#5e5e5e', -- bright black
                '#faa5a0', -- bright red
                '#74ce8b', -- bright green
                '#cdbc65', -- bright yellow
                '#a1bafc', -- bright blue
                '#f2a0e6', -- bright magenta
                '#10d0d4', -- bright cyan
                '#ffffff', -- bright white
        },




--[[	indexed = 
	{	{ [1] = '#ff0000' },
		{ [2] = '#ff0000' },
		-- etc etc		
	},
--[[
	-- Since: 20220319-142410-0fcdea07
	-- When the IME, a dead key or a leader key are being processed and are effectively
	-- holding input pending the result of input composition, change the cursor
	-- to this color to give a visual cue about the compose state.
	compose_cursor = 'orange',

	-- Colors for copy_mode and quick_select
	-- available since: 20220807-113146-c2fee766
	-- In copy_mode, the color of the active text is:
	-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
	-- 2. selection_* otherwise
	copy_mode_active_highlight_bg = { Color = '#000000' },
	-- use `AnsiColor` to specify one of the ansi color palette values
	-- (index 0-15) using one of the names "Black", "Maroon", "Green",
	--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
	-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
	copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
	copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
	copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },
--[[
	quick_select_label_bg = { Color = 'peru' },
	quick_select_label_fg = { Color = '#ffffff' },
	quick_select_match_bg = { AnsiColor = 'Navy' },
	quick_select_match_fg = { Color = '#ffffff' },
--]]
}

--[[
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)
--]]
--[[
wezterm.on("window-focus-changed", function()
  os.execute('xdotool search -classname org.wezfurlong.wezterm | xargs -I{} xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id {}')
end)
--]]

--[[
local dimmer = { brightness = 0.01 }

config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
		source = {
			File = '/home/daa/Pictures/71936516_p0.jpg',
		},
		hsb = dimmer,
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0.1 },
	}
}
--]]

local act = wezterm.action

-- keybinds
config.keys = {
	-- disable the default 'activate panel' actions tied to the ctrl + shift + arrow keys
	{ key = "LeftArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "DownArrow", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },

	-- disable the default 'adjust pane size' actions tied to the ctrl + shift + alt + arrow keys
	{ key = "LeftArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "RightArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "UpArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "DownArrow", mods = "CTRL|SHIFT|ALT", action = wezterm.action.DisableDefaultAssignment },

	-- enable ctrl + backspace to erase a word backwards
	{ key = "Backspace", mods = "CTRL", action = act.SendKey({ key = "w", mods = "CTRL" }) },
}

-- custom shell: spawn xonsh in login mode
config.default_prog = { "/home/daa/.local/xonsh-env/bin/xonsh", "-l" }

return config
