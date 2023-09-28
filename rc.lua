--- 	 NTBBloodbath/dotfiles
--- 	 manilarome/the-glorious-dotfiles

pcall(require, "luarocks.loader")

require("awful.autofocus")

local gears = require('gears')
local awful = require('awful')
local beautiful = require("beautiful")



require('awfulest.error_handling')


beautiful.init(awful.util.get_configuration_dir()..'/themes/default/theme.lua')
require('awfulest.set_wallpaper')


modkey = 'Mod4'
alt = 'Mod1'

terminal = 'kitty'
editor = 'micro'
explorer = 'thunar'
menu = 'rofi -show'
screen_lock = 'dm-tool lock'

editor_cmd = terminal .. " -e " .. editor

volume_control = 'pavucontrol'
max_volume = 150
volume_step = 3


shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 6)
end

screen_width = awful.screen.focused().geometry.width
screen_height = awful.screen.focused().geometry.height


require('awfulest.volume')
require('awfulest.brightness')
require('awfulest.sloppy_focus')

require('awfulest.autostart')

require('config.tags')
require('config.global_binds')
require('config.client_binds')
require('config.rules')
require('config.idle')
--require('wibox.titlebar')
require('wibox.notify')
-- require('wibox.menu')
require('wibox.wibar')
require('wibox.dashboard')
require('wibox.popups')






--fix line 68(getting icon path), del line 67(log notify)
-- require('wibox.filemanager')
-- require('wibox.launcher')













-- naughty = require('naughty')
-- wibox = require('wibox')

-- naughty.notify({widget_template = {
--    layout = wibox.container.scroll.vertical,
--    max_size = 100,
--    step_function = wibox.container.scroll.step_functions
--                    .waiting_nonlinear_back_and_forth,
--    speed = 100,
--    {
--        widget = wibox.widget.textbox,
--        text = "This is a " .. string.rep("very\n\n\n, ", 10) ..  " very long text",
--    },
-- }})







-- naughty = require('naughty')
-- print_table = require('awfulest.print_table')





-- local keys_n = 0

-- local function pass_input(key)
-- 	grabber:stop()
-- 	root.fake_input("key_press", key)
-- 	root.fake_input("key_release", key)
-- 	keys_n = 0
-- 	grabber:start()
-- end

-- -- pass_input.press = function(key)
-- -- 	key_old = key
-- -- 	grabber:stop()
-- -- 	naughty.notify({message = 'grabber stopped'})
-- -- 	root.fake_input("key_press", key)
-- -- 	-- grabber:start()
-- -- 	naughty.notify({message = 'grabber started'})
-- -- end
-- -- pass_input.release = function(key)
-- -- 	grabber:stop()
-- -- 	naughty.notify({message = 'grabber stopped'})
-- -- 	root.fake_input("key_release", key)
-- -- 	-- grabber:start()
-- -- 	naughty.notify({message = 'grabber started'})
-- -- end


-- local grabber = awful.keygrabber {
-- 	keypressed_callback = function(self, mod, key, event)
-- 		if key == 'Super_L' then
-- 			-- naughty.notify({message = key})
-- 			keys_n = 0
-- 			return
-- 		end
-- 		keys_n = keys_n+1
-- 		naughty.notify({title = 'pressed', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
	
-- 	keyreleased_callback = function(self, mod, key, event)
-- 		if key=='Super_L' and keys_n==0 then
-- 			awesome.emit_signal('dashboard::toggle')
-- 		else
-- 			-- awesome.emit_signal('pass_input::release',key)
-- 			pass_input(key)
-- 		end
-- 		naughty.notify({title = 'released', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
-- 	stop_key = 'Escape',
-- }

-- grabber:start()











-- keys_n = 0


-- grabber = awful.keygrabber {
-- 	keypressed_callback = function(self, mod, key, event)
-- 		if key == 'Super_L' then
-- 			-- naughty.notify({message = key})
-- 			keys_n = 0
-- 			return
-- 		end
-- 		keys_n = keys_n+1
-- 		naughty.notify({title = 'pressed', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
	
-- 	keyreleased_callback = function(self, mod, key, event)
-- 		if key=='Super_L' and keys_n==0 then
-- 			awesome.emit_signal('dashboard::toggle')
-- 		end
-- 		naughty.notify({title = 'released', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
-- 	stop_key = 'Escape',
-- }


-- grabber:start()



--local keys_n = 0
--local grabber = awful.keygrabber.run(function(mod, key, event)
--	if key=='Super_L' then
--		if event == 'press' then
--			keys_n = 0
--		else
--			awesome.emit_signal('dashboard::toggle')
--		end
--	else
--		return false
--	end
--end)



















-- 	return awful.keygrabber {
-- 			keypressed_callback = function(_, mod, key) 
-- 					if key == "Escape" then
-- 							dashboard.visible = false
-- 							keygrabber:stop()
-- 							return
-- 					end
-- 					-- don't do anything for non-alphanumeric characters or stuff like F1, Backspace, etc
-- 					if key:match("%W") or string.len(key) > 1 and key ~= "Escape" then
-- 							return 
-- 					end

-- 					local launchedAppWithLauncher = false
-- 					-- spawn launcher with input arguments
-- 					awful.spawn.with_line_callback(apps.launcher .. " " .. key, {
-- 							stdout = function(line)
-- 									-- this line is emitted by debug rofi when an app is launched
-- 									if string.match(line, "Parsed command") then
-- 											launchedAppWithLauncher = true
-- 											dashboard.visible = false
-- 									end
-- 							end, 
-- 							output_done = function()
-- 									-- restart the keygrabber when no app was launched
-- 									if not launchedAppWithLauncher then
-- 											keygrabber = getKeygrabber()
-- 											keygrabber:start()
-- 									end
-- 							end
-- 					})
-- 					keygrabber:stop()
-- 			end,
-- 	}

-- grabber:start()
