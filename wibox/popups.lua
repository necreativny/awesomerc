local awful = require("awful")



local naughty = require('naughty')
local print_table = require('awfulest.print_table')





local timer_widget = require('widget.popups.timer')




local timer = awful.popup {
	widget = timer_widget,
	visible = false,
	ontop = true,
	maximum_width = 500,
	maximum_height = 500,
}

awesome.connect_signal("timer::toggle",
	function()
		timer.visible = not timer.visible
	end
)



















local translate_widget = require('widget.popups.translate')
local selection

local translate = awful.popup {
	widget = translate_widget,
	visible = false,
	ontop = true,
}

awesome.connect_signal(
	'translate::selection:response',
	function(selection)
		selection = selection
	end
)
awesome.connect_signal("translate::show",
	function()
		awesome.emit_signal('translate::selection:request')
		-- if not selection then return end
		
		local w_g = translate:geometry()
		local m_c = mouse.coords()
		-------	prevent offscreen
		-------	for centered widget attouchment
		-- x = m_c.x - (m_c.x - screen_width/2)*(w_g.width/screen_width)
		-- y = m_c.y - (m_c.y - screen_height/2)*(w_g.height/screen_height)
		x = m_c.x - (m_c.x*w_g.width/screen_width)
		y = m_c.y - (m_c.y*w_g.height/screen_height)
		translate.x = x
		translate.y = y
		
		translate.visible = not translate.visible
		-- translate.visible = true
		-- grabber:start()
		-- mousegrabber.run(unpack(mousegrab_args))
	end
)





-- grabber = awful.keygrabber {
-- 	keypressed_callback = function(self, mod, key, event)
-- 		-- if key == 'Super_L' then
-- 		-- 	-- naughty.notify({message = key})
-- 		-- 	keys_n = 0
-- 		-- 	return
-- 		-- end
-- 		-- keys_n = keys_n+1
-- 		naughty.notify({title = 'pressed', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
	
-- 	keyreleased_callback = function(self, mod, key, event)
-- 		-- if key=='Super_L' and keys_n==0 then
-- 		-- 	awesome.emit_signal('dashboard::toggle')
-- 		-- end
-- 		naughty.notify({title = 'released', message = print_table(mod)..'\t'..key..'\t'..event})
-- 	end,
-- 	stop_key = 'Escape',
-- }








-- grabber = awful.keygrabber {
-- 	stop_key = 'Escape',
-- }
-- grabber:connect_signal('stopped', function()
-- 	mousegrabber.stop()
-- 	translate.visible = false
-- end
-- )

-- local mousegrab_args = {function(m_c)
-- 	hovered_obj = mouse.object_under_pointer()
-- 	if hovered_obj == translate then
-- 		-- naughty.notify({title = 'pressed', message = print_table(hovered_obj)})
-- 		naughty.notify({title = 'pressed', message = 'obj is translate!'})
-- 	end
-- 	-- if mouse['buttons'][1] and 
-- 	return true
-- end,
-- 'dot'
-- }


