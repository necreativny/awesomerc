local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')
local beautiful = require('beautiful')

local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/wibar/tray/'




local systray = wibox.widget{
	visible = false,
	widget = wibox.widget.systray,
}

local toggle_button = wibox.widget{
	image = gears.color.recolor_image(icon_dir..'left-arrow.svg', beautiful.color3),
	widget = wibox.widget.imagebox,
}
toggle_button:buttons(
	gears.table.join(
		awful.button(
			{}, 1,
			nil,
			function()
				if systray.visible then
					systray.visible = false
					toggle_button:set_image(icon_dir..'left-arrow.svg')
				else
					systray.visible = true
					toggle_button:set_image(icon_dir..'right-arrow.svg')
				end
			end
		)
	)
)

local l = wibox.layout.fixed.horizontal(
	systray,
	toggle_button
)

local tray = wibox.container.margin({widget = l})
tray.top = 5.5;	tray.bottom = tray.top


return tray
