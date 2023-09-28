-- https://www.linux.org.ru/forum/desktop/10729260
awful = require('awful')

client.connect_signal("property::fullscreen", function(c)
    local fullscreened = false
    for key,value in pairs(client.get()) do
        if(value.fullscreen == true) then
            fullscreened = true
            break
        end
    end
    if fullscreened then
        disable_powersaving()
    else
        enable_powersaving()
    end

end)

function disable_powersaving()
        awful.util.spawn("xset s off")
        awful.util.spawn("xset -dpms")
end

function enable_powersaving()
        awful.util.spawn("xset s on")
        awful.util.spawn("xset +dpms")
end
