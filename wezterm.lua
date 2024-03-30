local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Icy Dark (base16)"
--config.color_scheme = 'Mono Cyan (Gogh)'

config.font = wezterm.font_with_fallback({ "Intel One Mono", "PlemolJP Console NF" })
config.font_size = 18
config.line_height = 1.1

config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.3,
}

config.window_background_opacity = 1
config.window_padding = {
	left = 30,
	right = 30,
	top = 30,
	bottom = 30,
}

---------------------------------------------------------------------------
-- Shortcut
---------------------------------------------------------------------------
local act = wezterm.action

config.leader = { key = "w", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "t",
		mods = "CTRL",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "h",
		mods = "LEADER|CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER|CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = "LEADER|CTRL",
		action = wezterm.action.PaneSelect,
	},
}

return config
