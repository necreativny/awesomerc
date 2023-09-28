local lfs = require('lfs')
local Gio = require('lgi').Gio
local Gtk = require('lgi').Gtk

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local beautiful = require("beautiful")




local naughty = require('naughty')



local icon_theme = Gtk.IconTheme.get_default()


local win = wibox({
	visible = true,
	ontop = true,
	screen = screen.primary,
	width = screen_width,
	height = screen_height - screen_height*beautiful.wibar_height,
	y = beautiful.wibar_position == 'top' and screen_height*beautiful.wibar_height,
})
awesome.connect_signal("win::toggle",
	function()
		win.visible = not win.visible
	end
)



local prompt = wibox.widget{
	bg = '#fc890a',
	forced_height = 50,
	widget = wibox.container.background
}


local function gen_dir_layout(dir)
	-- local file_list = wibox.layout.grid()
	local file_list = wibox.layout.fixed.vertical()
	for file,_ in lfs.dir(dir) do
		local icon = wibox.widget({
			forced_height = beautiful.get_font_height(),
			widget = wibox.widget.imagebox
		})
		local widget = wibox.widget({
			{
				icon,
				{
					text = file,
					ellipsize = 'end',
					widget = wibox.widget.textbox
				},
				layout = wibox.layout.fixed.horizontal
			},
			buttons = {awful.button({}, 1, function() naughty.notify({text=filepath}) end)},
			widget = wibox.container.background
		})
		local cmd = 'gio info -a standard::icon '..dir..'/'..file
		awful.spawn.easy_async_with_shell(cmd, function(out)
			local icon_name = out:match('standard::icon:[^,]+'):match('%s.-$'):gsub("%s+", "")
			naughty.notify({text = icon_name})
			icon.image = '/usr/share/icons/'..<beautiful icon_theme>..icon_name
		end)
		file_list:add(widget)
	end
	return file_list
end



local files_layout = gen_dir_layout(lfs.currentdir())


win.widget = wibox.widget{
	{
		{
			prompt,
			direction = 'south',
			widget = wibox.container.rotate
		},
		{
			files_layout,
			direction = 'south',
			widget = wibox.container.rotate
		},
		fill_space = true,
		layout = wibox.layout.fixed.vertical
	},
	direction = 'south',
	widget = wibox.container.rotate
}
return win
