-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
    -- Table of layouts to cover with awful.layout.inc, order matters.
    local layouts = {
        awful.layout.suit.max,
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.max.fullscreen,
    }

    return layouts
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
    __call = function(_, ...)
        return _M.get(...)
    end,
})
