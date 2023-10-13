local wibox = require('wibox')
local beautiful = require('beautiful')

local naughty = require('naughty')
local gears = require('gears')
local print_table = require('lib.print_table')


local function make_button(args)
	-- local tmp = args.widget
	-- args.widget = nil

	local bg_settings = beautiful.background
	
	-- naughty.notify({message=print_table(args.widget)})
	-- naughty.notify({message=gears.debug.dump_return(args)})
	for k,v in pairs(args) do
		bg_settings[k] = v
		-- naughty.notify({message='klsf'..k..v})
	end
	-- naughty.notify({message=print_table(bg_settings.widget)})
	local background = wibox.widget{
		{
			{
				bg_settings.widget,
				margins = bg_settings.padding,
				widget = wibox.container.margin
			},
			bg = bg_settings.bg,
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