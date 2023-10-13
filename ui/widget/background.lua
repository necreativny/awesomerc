local wibox = require('wibox')
local beautiful = require('beautiful')


local function make_button(args)
	local bg_settings = beautiful.background
	for k,v in pairs(args) do
		bg_settings[k] = v
	end
	local background = wibox.widget{
		{
			bg_settings.widget,
			bg = bg_settings.bg..bg_settings.opacity_hex,
			shape = bg_settings.shape,
			border_color = bg_settings.border,
			border_width = bg_settings.border_width,
			widget = wibox.container.background
		},
		margins = bg_settings.margin,
		widget = wibox.container.margin
	}
	return background
end


return make_button