local wezterm = require 'wezterm'
local module = {}

function module.public_helper()
	wezterm.log_error('FRESH CONFIG LOAD')
end


return module
