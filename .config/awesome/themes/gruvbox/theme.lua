---------------------------
-- Default awesome theme --
---------------------------

local gears            = require("gears")
local naughty          = require("naughty")

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local colors = { }

colors.black_1          = "#282828"
colors.black_2          = "#928374"
colors.red_1            = "#cc241d"
colors.red_2            = "#fb4934"
colors.green_1          = "#98971a"
colors.green_2          = "#b8bb26"
colors.yellow_1         = "#d79921"
colors.yellow_2         = "#fabd2f"
colors.blue_1           = "#458588"
colors.blue_2           = "#83a598"
colors.purple_1         = "#b16286"
colors.purple_2         = "#d3869b"
colors.aqua_1           = "#689d6a"
colors.aqua_2           = "#8ec07c"
colors.white_1          = "#a89984"
colors.white_2          = "#ebdbb2"
colors.orange_1         = "#d65d0e"
colors.orange_2         = "#fe8019"

colors.bw_0_h           = "#1d2021"
colors.bw_0             = "#282828"
colors.bw_0_s           = "#32302f"
colors.bw_1             = "#3c3836"
colors.bw_2             = "#504945"
colors.bw_3             = "#665c54"
colors.bw_4             = "#7c6f64"
colors.bw_5             = "#928374"
colors.bw_6             = "#a89984"
colors.bw_7             = "#bdae93"
colors.bw_8             = "#d5c4a1"
colors.bw_9             = "#ebdbb2"
colors.bw_10            = "#fbf1c7"

local bar_fg            = colors.bw_5
local bar_bg            = colors.bw_0

local theme = {}

theme.name = "blackout"

theme.font          = "FiraCode Nerd Font 12"
theme.bg_normal     = colors.bw_0
theme.bg_focus      = colors.bw_2
theme.bg_urgent     = colors.red_2
theme.bg_minimize   = colors.bw_0
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = colors.bw_9
theme.fg_focus      = colors.bw_9
theme.fg_urgent     = colors.bw_0
theme.fg_minimize   = colors.bw_2

-- theme.useless_gap   = dpi(28)
theme.useless_gap   = dpi(15)
theme.border                                    = 4
theme.border_width  = dpi(4)
theme.border_normal = colors.bw_2
theme.border_focus  = colors.bw_5
theme.border_marked = colors.bw_5

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

-- theme.wallpaper = "/home/brian/.config/awesome/themes/gruvbox/wallpapers/wall.png"
theme.wallpaper = "/home/brian/Pictures/TuJrq1e - Imgur.png"
-- theme.wallpaper                                 = theme.dir .. "/wallpapers/escheresque.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

theme.border_radius                             = 0
-- Notifications
theme.notification_fg                           = theme.fg_normal
theme.notification_bg                           = theme.bg_normal
theme.notification_border_color                 = theme.border_normal
theme.notification_border_width                 = theme.border_width
-- theme.notification_icon_size                    = 80
-- theme.notification_opacity                      = 0.9
-- theme.notification_max_width                    = 600
-- theme.notification_max_height                   = 400
theme.notification_margin                       = 20
theme.notification_shape                        = function(cr, width, height)
                                                      gears.shape.rounded_rect(cr, width, height, theme.border_radius or 0)
                                                  end
naughty.config.padding                          = 15
naughty.config.spacing                          = 10
naughty.config.defaults.timeout                 = 5
naughty.config.defaults.margin                  = theme.notification_margin
naughty.config.defaults.border_width            = theme.notification_border_width
theme.notification_font = "FiraCode Nerd Font 12"

naughty.config.presets.normal                   = {
                                                      font         = theme.font,
                                                      fg           = theme.notification_fg,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                  }

naughty.config.presets.low                      = naughty.config.presets.normal
naughty.config.presets.ok                       = naughty.config.presets.normal
naughty.config.presets.info                     = naughty.config.presets.normal
naughty.config.presets.warn                     = naughty.config.presets.normal


naughty.config.presets.critical                 = {
                                                      font         = theme.font,
                                                      fg           = colors.red_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }


-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80