local menubar = require('menubar')
local wibox = require('wibox')
local gears = require('gears')
local awful = require('awful')



local desktop_dir = '/usr/share/applications/'

local apps = {
	terminal,
	explorer,
	'firefox',
	--'blender',
	'telegramdesktop',
	'viber',
	'htop',
	'discord',
	'micro',
	'nnn'
}



local l = wibox.layout.fixed.horizontal()

for _, app in pairs(apps) do
	local app_desktop_info = menubar.utils.parse_desktop_file(desktop_dir..app..'.desktop')
	local icon_dir = menubar.utils.lookup_icon(app_desktop_info['Icon'])
	local cmd = app_desktop_info['Exec']
	if string.sub(cmd, -2, -2) == '%' then
		cmd = string.sub(cmd, 1, -3)
	end

	local icon = wibox.widget.imagebox()
	icon:set_image(icon_dir)

	icon:buttons(
		gears.table.join(
			awful.button(
				{}, 1,
				function()
					if app_desktop_info['Terminal'] == true 	then
						awful.spawn(terminal..' '..cmd)
					else
						awful.spawn(cmd)
					end
				end
			)
		)
	)
	l:add(icon)
end

return l
