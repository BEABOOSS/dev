local wezterm = require("wezterm")
local act = wezterm.action
local funcs = require("funcs")
-- module to be exported
local module = {}

-- updates the bar when switching workspace to the current active workspace
wezterm.on("update-right-status", function(window, pane)
	window:set_right_status(window:active_workspace())
end)

function module.apply_to_config(config)
	-- SET UP KEYBINDS HERE --
	-- config.color_scheme = 'Batman'
	config.enable_tab_bar = false
	config.font = "JetBrains Mono Nerd Font

	config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
	config.keys = {
		-- CTRL-SHIFT-l activates the debug overlay
		{ key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action_callback(function(win, pane)
				print("from within the action callback")
			end),
		},
		{
			key = "a",
			mods = "LEADER|ALT",
			action = act.SendKey({ key = "a", mods = "CTRL" }),
		},
		{

			key = "v",
			mods = "LEADER",
			action = wezterm.action.SwitchToWorkspace({
				spawn = {
					cwd = "/home/beabs/personal/dev",
					args = { "nvim", "/home/beabs/personal/dev" },
				},
			}),
		},
		{

			key = "w",
			mods = "LEADER",
			action = wezterm.action.SwitchToWorkspace({
				spawn = {
					cwd = "/home/beabs/personal/dev/env/.config/wezterm/",
					args = { "nvim", "/home/beabs/personal/dev/env/.config/wezterm/" },
				},
			}),
		},
		{
			key = "9",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
		},
	}

	config.unix_domains = {
		{
			name = "unix-wezterm",
		},
	}
	config.default_gui_startup_args = { "connect", "unix-wezterm" }
end

return module
