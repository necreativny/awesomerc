local wibox = require('wibox')
local beautiful = require('beautiful')

local background = function(widget, bg_color, border_color, border_width, margin, border, padding)
	
	local container = wibox.widget {
		widget,
		widget = wibox.container.background
	}
	

	return container
end

return background