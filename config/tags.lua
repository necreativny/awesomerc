local awful = require('awful')

-- Table of layouts to cover
awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile.right,
	awful.layout.suit.fair,
	awful.layout.suit.max,
}

-- Configure tag properties
-- awful.screen.connect_for_each_screen(function(s)
-- 	awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[1])
-- end)



-- Configure tag properties
awful.screen.connect_for_each_screen(function(s)
	if s.index==1 then
		awful.tag({ '1', '2', '3', '4', '5'}, s, awful.layout.layouts[1])
	elseif s.index==2 then
		awful.tag({ '6' }, s, awful.layout.layouts[1])
	end
end)

