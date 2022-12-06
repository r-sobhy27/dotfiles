-- {{{ Global Variable Definitions
-- moved here in module as local variable
-- }}}

local home = os.getenv("HOME")

local _M = {
    -- This is used later as the default terminal and editor to run.
    -- terminal = "xterm",
    terminal = "alacritty",

    -- wm prefix
    modkey = "Mod4", -- Super

    -- user defined wallpaper
    wallpaper = home .. "/Pictures/wallpaper.png",
}

return _M
