local wibox = require('wibox')
local gears = require('gears')
local bling = require('bling')
local playerctl = bling.signal.playerctl.cli()
local icon_dir = awful.util.get_configuration_dir()..'/themes/default/widget/dashboard/playerctl/'





local naughty = require('naughty')
local print_table = require('awfulest.print_table')

local clickable_container = require('widget.button')





local cover = wibox.widget {
	image = icon_dir.."archlinux_logo.png",
	widget = wibox.widget.imagebox
}
local title_widget = wibox.widget {
	markup = 'Nothing Playing',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}
local artist_widget = wibox.widget {
	markup = 'Nothing Playing',
	align = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

playerctl:connect_signal("metadata",
	function(_, title, artist, album_path, album, new, player_name)
		cover:set_image(gears.surface.load_uncached(album_path))
		title_widget:set_markup_silently(title)
		artist_widget:set_markup_silently(artist)
end)











local previous_song = wibox.widget{
	{
		image = icon_dir..'previous.svg',
		buttons = {awful.button({}, 1, function() playerctl['previous']() end)},
		widget = wibox.widget.imagebox
	},
	widget = wibox.container.place
}
local toogle_play = wibox.widget{
	image = icon_dir..'play.svg',
	buttons = {awful.button({}, 1, function() playerctl['play_pause']() end)},
	widget = wibox.widget.imagebox
}
local next_song = wibox.widget{
	image = icon_dir..'next.svg',
	buttons = {awful.button({}, 1, function() playerctl['next']() end)},
	widget = wibox.widget.imagebox
}


















local control_buttons = {
	play = function() playerctl:play() end,
	previous = function() playerctl:previous() end,
	next = function() playerctl:next() end,
	shuffle = function() playerctl:cycle_shuffle() end,
	loop = function() playerctl:cycle_loop_status() end
}


local function make_control_buttons(control_buttons)
	local buttons = {}
	for name, func in pairs(control_buttons) do
		table.insert(buttons,
			wibox.widget
			{
				image = icon_dir..name..'.svg',
				buttons = {awful.button({}, 1, func)},
				widget = wibox.widget.imagebox
			}
		)
	end
	return buttons
end

-- local function make_control_button(name)
-- 	return wibox.widget{
-- 		image = icon_dir..name..'.svg',
-- 		buttons = {awful.button({}, 1, function() playerctl[name]() end)},
-- 		widget = wibox.widget.imagebox
-- 	}
-- end


local control_buttons = make_control_buttons(control_buttons)

local widget = wibox.widget{
	cover,
	{
		title_widget,
		artist_widget,
		{
			-- make_control_button('previous'),
			-- make_control_button('play'),
			-- make_control_button('next'),
			-- previous_song,
			-- toogle_play,
			-- next_song,
			-- unpack(make_control_buttons(control_buttons)),
			control_buttons[1],
			control_buttons[2],
			control_buttons[3],
			control_buttons[4],
			control_buttons[5],
			widget = wibox.layout.flex.horizontal
		},
		widget = wibox.layout.fixed.vertical
	},
	widget = wibox.layout.stack
}
return widget
