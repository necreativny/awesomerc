local Gio = require('lgi').Gio
local Gtk = require('lgi').Gtk
local lfs = require('lfs')

print_table = require('awfulest.print_table')




-- local shazam_use_micro = true

-- local params = (not shazam_use_micro and '-d pulse') or (shazam_use_micro and '')


-- print('songrec listen '..params)






-- local widgets = {}
-- widgets.calendar = 10
-- widgets.timer = 20
-- function widgets:func()
-- 	print('from func')
-- end

-- local tab = 'timer'
-- local active_widget = widgets[tab]


-- widgets.variable = 10
-- local variable_name = 'variable'
-- local w = widgets[variable_name]


-- local func_name = 'func'
-- widgets[func_name]()

local out = [[uri: file:///home/necreativny/profile
local path: /home/necreativny/profile
unix mount: /dev/sda4 /home ext4 rw,noatime
attributes:
  standard::icon: image-jpeg, image-x-generic, image-jpeg-symbolic, image-x-generic-symbolic
]]

local icon_name = string.match(out, 'standard::icon:[^,]+'):match('%s.-$'):gsub("%s+", "")
local icon_theme = Gtk.IconTheme.get_default()
local icon_info = icon_theme:lookup_icon('inode-x-generic-symbolic', 48, 0)
-- standard::icon: inode-chardevice, inode-x-generic, inode-chardevice-symbolic, inode-x-generic-symbolic
print(icon_info:get_filename())
