local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")
local menubar = require('menubar')



local prompt = wibox({
	
})

-- local item_list = wibox.widget{
-- 	forced_num_cols = 2,
-- 	homogeneous = true,
-- 	layout = wibox.layout.grid,
-- }
local item_list = wibox.layout.flex.vertical()

for _,desktop_dir in pairs(menubar.menu_gen.all_menu_dirs) do
	menubar.utils.parse_dir(desktop_dir, function(entries)
		for _,entry in pairs(entries) do
			if entry.show and entry.Name and entry.cmdline and entry.Icon then
				local icon_path = menubar.utils.lookup_icon(entry.Icon)
				local is_terminal = entry.Terminal
				local cmd = entry.cmdline
				local name = entry.Name
				local widget = wibox.widget({
					widget = wibox.container.background,
					border_width = 2,
					border_color = '#dhfade',
					{
						layout = wibox.layout.flex.horizontal,
						{
							image = icon_path,
							widget = wibox.widget.imagebox
						},
						{
							text = name,
							ellipsize = 'end',
							widget = wibox.widget.textbox
						}
					}
				})
				widget:buttons(
					gears.table.join(
						awful.button(
							{}, 1,
							function()
								if is_terminal then
									awful.spawn(terminal..' '..cmd)
								else
									awful.spawn(cmd)
								end
							end
						)
					)
				)
				item_list:add(widget)
			end
		end
	end)
end


widget = {
	widget = wibox.container.place,
	halign = 'center',
	valign = 'center',
	{
		layout = wibox.layout.flex.vertical,
		--prompt,
		item_list
	}
}

local widget = wibox({
	visible = false,
	ontop = true,
	type = 'dock',
	width = screen_width,
	height = screen_height
})

widget:setup{
	widget = wibox.container.place,
	halign = 'center',
	valign = 'center',
	{
		item_list,
		forced_width = beautiful.launcher_width*screen_width,
		forced_height = beautiful.launcher_height*screen_height,
		bg = beautiful.border_color_active,
		widget = wibox.container.background
	}
}

awesome.connect_signal("launcher::toogle", function()
	widget.visible = not widget.visible
end)

return widget
