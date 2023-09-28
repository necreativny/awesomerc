local awful = require("awful")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")



awful.keyboard.append_global_keybindings({
	awful.key({}, 'XF86AudioRaiseVolume',
		function()
			awesome.emit_signal('volume::change', 'up')
		end, {
		description = 'Volume up', group = 'volume',
	}),
	awful.key({}, 'XF86AudioLowerVolume', 
		function()
			awesome.emit_signal('volume::change', 'down')
		end, {
		description = 'Volume down', group = 'volume',
	}),
	awful.key({}, 'XF86AudioMute', 
		function()
			awesome.emit_signal('volume::toogle')
		end, {
		description = 'Mute volume', group = 'volume',
	}),
	awful.key({}, 'XF86AudioPlay', function()
			awful.spawn.with_shell('playerctl play-pause')
		end, {
		description = 'Resume song', group = 'volume',
	}),
	awful.key({}, 'XF86AudioPrev', function()
			awful.spawn.with_shell('playerctl previous')
		end, {
		description = 'Prev song', group = 'volume',
	}),
	awful.key({}, 'XF86AudioNext', function()
			awful.spawn.with_shell('playerctl next')
		end, {
		description = 'Next song', group = 'volume',
	}),
	awful.key({}, 'XF86AudioStop', function()
			awful.spawn.with_shell('playerctl stop')
		end, {
		description = 'Stop song', group = 'volume',
	}),
})
awful.keyboard.append_global_keybindings({
	awful.key(
		{ modkey },
		'Left',
		awful.tag.viewprev,
		{ description = 'view previous', group = 'tag' }
	),
	awful.key(
		{ modkey },
		'Right',
		awful.tag.viewnext,
		{ description = 'view next', group = 'tag' }
	),
	awful.key(
		{ modkey },
		'Escape',
		awful.tag.history.restore,
		{ description = 'go back', group = 'tag' }
	),
})
awful.keyboard.append_global_keybindings({
	awful.key(
		{ modkey },
		's',
		hotkeys_popup.show_help,
		{ description = 'show help', group = 'awesome' }
	),
	awful.key({ modkey }, 'w', function()
			mymainmenu:show()
		end, {
		description = 'show main menu', group = 'awesome',
	}),
	awful.key(
		{ modkey, 'Control' },
		'r',
		awesome.restart,
		{ description = 'reload awesome', group = 'awesome' }
	),
	awful.key(
		{ modkey, 'Shift' },
		'q',
		awesome.quit,
		{ description = 'quit awesome', group = 'awesome' }
	),
})
awful.keyboard.append_global_keybindings({
	awful.key({ modkey, 'Control' }, 'j', function()
			awful.screen.focus_relative(1)
		end, {
		description = 'focus the next screen', group = 'screen',
	}),
	awful.key({ modkey, 'Control' }, 'k', function()
			awful.screen.focus_relative(-1)
		end, {
		description = 'focus the previous screen', group = 'screen',
	}),
})

awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, 'j', function()
			awful.client.focus.bydirection("left")
		end, {
		description = 'move focus left', group = 'client',
	}),
	awful.key({ modkey }, 'k', function()
			awful.client.focus.bydirection("down")
		end, {
		description = 'move focus down', group = 'client',
	}),
	awful.key({ modkey }, 'l', function()
			awful.client.focus.bydirection("right")
		end, {
		description = 'move focus right', group = 'client',
	}),
	awful.key({ modkey }, 'i', function()
			awful.client.focus.bydirection("up")
		end, {
		description = 'move focus up', group = 'client',
	}),
	awful.key({ modkey, 'Shift' }, 'j', function()
			awful.client.swap.byidx(1)
		end, {
		description = 'swap with next client by index', group = 'client',
	}),
	awful.key(
		{ modkey, 'Shift' }, 'k', function()
			awful.client.swap.byidx(-1)
		end,
		{ description = 'swap with previous client by index', group = 'client' }
	),
	awful.key(
		{ modkey }, 'u',
		awful.client.urgent.jumpto,
		{ description = 'jump to urgent client', group = 'client' }
	),
	awful.key({ modkey }, 'Tab', function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end, {
		description = 'go back', group = 'client',
	}),
	awful.key({ modkey, 'Control' }, 'n', function()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					'request::activate',
					'key.unminimize',
					{ raise = true }
				)
			end
		end, {
		description = 'restore minimized', group = 'client',
	}),
})
awful.keyboard.append_global_keybindings({
	-- awful.key({ modkey }, 'l', function()
	-- 		awful.tag.incmwfact(0.05)
	-- 	end, {
	-- 	description = 'increase master width factor', group = 'layout',
	-- }),
	awful.key({ modkey }, 'h', function()
			awful.tag.incmwfact(-0.05)
		end, {
		description = 'decrease master width factor', group = 'layout',
	}),
	awful.key({ modkey, 'Shift' }, 'h', function()
			awful.tag.incnmaster(1, nil, true)
		end, {
		description = 'increase the number of master clients', group = 'layout',
	}),

	awful.key({ modkey, 'Shift' }, 'l', function()
			awful.tag.incnmaster(-1, nil, true)
		end, {
		description = 'decrease the number of master clients', group = 'layout',
	}),

	awful.key({ modkey, 'Control' }, 'h', function()
			awful.tag.incncol(1, nil, true)
		end, {
		description = 'increase the number of columns', group = 'layout',
	}),
	awful.key({ modkey, 'Control' }, 'l', function()
			awful.tag.incncol(-1, nil, true)
		end, {
		description = 'decrease the number of columns', group = 'layout',
	}),
	awful.key({ modkey, 'Mod1' }, 'l', function()
			awful.layout.inc(1)
		end, {
		description = 'select next', group = 'layout',
	}),
	awful.key({ modkey, 'Shift' }, 'space', function()
			awful.layout.inc(-1)
		end, {
		description = 'select previous', group = 'layout',
	}),
})
awful.keyboard.append_global_keybindings({
	awful.key({ modkey }, 'Return', function()
			awful.spawn.with_shell('xkb-switch -s us')
			awful.spawn.with_shell(menu)
		end, {
		description = 'show the menubar', group = 'launcher',
	}),
	awful.key({ modkey, 'Shift' }, 'Return', function()
			awful.spawn('xkb-switch -s us')
			awful.spawn(terminal)
		end, {
		description = 'open a terminal', group = 'launcher',
	}),
	awful.key({ modkey }, 'e', function()
			awful.spawn.with_shell(explorer)
		end, {
		description = 'open the file explorer', group = 'launcher',
	}),
	awful.key({ modkey }, 'a', function()
			awesome.emit_signal('launcher::toogle')
		end, {
		description = 'open awesome menubar', group = 'launcher',
	}),
	awful.key({ alt }, 't', function()
			awesome.emit_signal('translate::show')
		end, {
		description = 'show translate widget', group = 'launcher',
	}),
})
awful.keyboard.append_global_keybindings({
	awful.key({'Mod1', 'Shift'}, '1', function()
			awful.spawn('xkb-switch -s us')
		end, {
		description = 'us', group = 'keyboard(set layout)',
	}),
	awful.key({'Mod1', 'Shift'}, '2', function()
			awful.spawn('xkb-switch -s ru')
		end, {
		description = 'ru', group = 'keyboard(set layout)',
	}),
	awful.key({'Mod1', 'Shift'}, '3', function()
			awful.spawn('xkb-switch -s ua')
		end, {
		description = 'ua', group = 'keyboard(set layout)',
	}),
	awful.key({'Mod1', 'Shift'}, '4', function()
			awful.spawn('xkb-switch -s de')
		end, {
		description = 'de', group = 'keyboard(set layout)',
	})
})



-- awful.keyboard.append_global_keybindings({
-- 	awful.key({ modkey}, 'space', function()
-- 			popups.toogle_popup(true)
-- 		end,
-- 		function()
-- 			popups.toogle_popup(false)
-- 		end, {
-- 		description = 'toogle popup', group = 'u',
-- 	})
-- })



awful.keyboard.append_global_keybindings({
	awful.key {
			modifiers   = { modkey },
			keygroup    = "numrow",
			description = "only view tag",
			group       = "tag",
			on_press    = function (index)
					local screen = awful.screen.focused()
					local tag = screen.tags[index]
					if tag then
							tag:view_only()
					end
			end,
	},
	awful.key {
			modifiers   = { modkey, "Control" },
			keygroup    = "numrow",
			description = "toggle tag",
			group       = "tag",
			on_press    = function (index)
					local screen = awful.screen.focused()
					local tag = screen.tags[index]
					if tag then
							awful.tag.viewtoggle(tag)
					end
			end,
	},
	awful.key {
			modifiers = { modkey, "Shift" },
			keygroup    = "numrow",
			description = "move focused client to tag",
			group       = "tag",
			on_press    = function (index)
					if client.focus then
							local tag = client.focus.screen.tags[index]
							if tag then
									client.focus:move_to_tag(tag)
							end
					end
			end,
	},
	awful.key {
			modifiers   = { modkey, "Control", "Shift" },
			keygroup    = "numrow",
			description = "toggle focused client on tag",
			group       = "tag",
			on_press    = function (index)
					if client.focus then
							local tag = client.focus.screen.tags[index]
							if tag then
									client.focus:toggle_tag(tag)
							end
					end
			end,
	},
	awful.key {
			modifiers   = { modkey },
			keygroup    = "numpad",
			description = "select layout directly",
			group       = "layout",
			on_press    = function (index)
					local t = awful.screen.focused().selected_tag
					if t then
							t.layout = t.layouts[index] or t.layout
					end
			end,
	}
})
