local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")




-- Create a taglist widget
-- s.mytaglist = awful.widget.taglist {
-- 	screen  = s,
-- 	filter  = awful.widget.taglist.filter.all,
-- 	buttons = {
-- 		awful.button({ }, 1, function(t) t:view_only() end),
-- 		awful.button({ modkey }, 1, function(t)
-- 		                                if client.focus then
-- 		                                    client.focus:move_to_tag(t)
-- 		                                end
-- 		                            end),
-- 		awful.button({ }, 3, awful.tag.viewtoggle),
-- 		awful.button({ modkey }, 3, function(t)
-- 		                                if client.focus then
-- 		                                    client.focus:toggle_tag(t)
-- 		                                end
-- 		                            end),
-- 		awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
-- 		awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
-- 	}
-- }



screen.connect_signal("request::desktop_decoration", function(s)
	s.mykeyboardlayout = awful.widget.keyboardlayout()

	-- s.textclock = wibox.widget.textclock('%R')
	s.textclock = wibox.widget.textclock('%H:%M:%S', 1)
	-- s.textclock = wibox.widget.textclock('%H:%M:%S')
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.layoutbox = awful.widget.layoutbox {
		screen  = s,
		buttons = {
			awful.button({ }, 1, function () awful.layout.inc( 1) end),
			awful.button({ }, 3, function () awful.layout.inc(-1) end),
			awful.button({ }, 4, function () awful.layout.inc(-1) end),
			awful.button({ }, 5, function () awful.layout.inc( 1) end),
		}
	}


	s.tasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = {
			awful.button({ }, 1, function (c)
				c:activate { context = "tasklist", action = "toggle_minimization" }
			end),
			awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
			awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
			awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
		},
		widget_template = {
			widget = awful.widget.clienticon,
		},
	}


	s.mywibox = awful.wibar({
		position = beautiful.wibar_position,
		screen = s,
		height=screen_height*beautiful.wibar_height*beautiful.interface_scale,
		width=screen_width*beautiful.wibar_width,
		--bg = beautiful.bg_normal .. "0",
	})


	local function bar_container(widgets)
		return wibox.widget{
			widget = wibox.container.margin,
			margins = 5.5,
			{
				layout = wibox.layout.fixed.horizontal,
				table.unpack(widgets)
			}
		}
	end
	s.left_widgets = bar_container({
		require('widget.wibar.menu'),
		require('widget.wibar.launcher'),
		s.layoutbox
	})
	s.center_widgets = bar_container({
		s.tasklist,
		-- require('widget.wibar.dock')
	})
	s.right_widgets = bar_container({
		require('widget.wibar.test_layout'),
		require('widget.wibar.timer'),
		require('widget.wibar.volume'),
		require('widget.wibar.tray'),
		s.mykeyboardlayout,
		s.mylayoutbox,
		s.textclock
	})


	s.mywibox.widget = {
		layout = wibox.layout.align.horizontal,
		expand = 'none', -- for strong left/center/right align 	https://stackoverflow.com/questions/44349147/awesome-wm-4-middle-align-does-not-work-in-horizontal-layout
		s.left_widgets,
		s.center_widgets,
		s.right_widgets
	}

end)
