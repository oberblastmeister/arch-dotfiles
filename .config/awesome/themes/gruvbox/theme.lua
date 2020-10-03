local theme_assets = require("beautiful.theme_assets")
local lain = require("lain")
local xresources = require("beautiful.xresources")
local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local wibox = require("wibox")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local colors = {}

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
theme.name = "gruvbox"

theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/gruvbox"
theme.wallpaper = theme.dir .. "/wallpapers/monocolor.png"

-- local font_name                                 = "FiraCode Nerd Font"
-- local font_name                                 = "Sauce Code Pro"
-- local font_name                                 = "JetBrains Mono Nerd Font"
local font_name = "monospace"
local font_size                                 = "9"
theme.font                                      = font_name .. " " ..                         font_size
theme.font_bold                                 = font_name .. " " .. "Bold"        .. " " .. font_size
theme.font_italic                               = font_name .. " " .. "Italic"      .. " " .. font_size
theme.font_bold_italic                          = font_name .. " " .. "Bold Italic" .. " " .. font_size
theme.font_big                                  = font_name .. " " .. "Bold"        .. " 16"

theme.accent                                    = colors.red_2
theme.border_normal                             = colors.bw_2
theme.border_focus                              = colors.bw_5
theme.border_marked                             = colors.bw_5

theme.titlebar_fg_normal                        = colors.bw_5
theme.titlebar_fg_focus                         = colors.bw_8
theme.titlebar_fg_marked                        = colors.bw_8
theme.titlebar_fg_urgent                        = colors.red_2
theme.titlebar_bg_normal                        = colors.bw_2
theme.titlebar_bg_focus                         = colors.bw_5
theme.titlebar_bg_marked                        = colors.bw_5
theme.titlebar_bg_marked                        = colors.bw_5

theme.fg_normal                                 = colors.bw_9
theme.fg_focus                                  = colors.bw_9
theme.fg_urgent                                 = colors.red_2
theme.bg_normal                                 = colors.bw_0
theme.bg_focus                                  = colors.bw_2
theme.bg_urgent                                 = colors.bw_2

theme.taglist_font                              = theme.font_bold
theme.taglist_fg_normal                         = colors.bw_5
theme.taglist_fg_occupied                       = colors.bw_5
theme.taglist_fg_empty                          = colors.bw_1
theme.taglist_fg_volatile                       = colors.aqua_2
theme.taglist_fg_focus                          = colors.bw_9
theme.taglist_fg_urgent                         = colors.red_2
theme.taglist_bg_normal                         = colors.bw_0
theme.taglist_bg_occupied                       = colors.bw_0
theme.taglist_bg_empty                          = colors.bw_0
theme.taglist_bg_volatile                       = colors.bw_0
theme.taglist_bg_focus                          = colors.bw_2
theme.taglist_bg_urgent                         = colors.bw_1

theme.tasklist_font_normal                      = theme.font
theme.tasklist_font_focus                       = theme.font_bold
theme.tasklist_font_minimized                   = theme.font
theme.tasklist_font_urgent                      = theme.font_bold

theme.tasklist_fg_normal                        = colors.bw_5
theme.tasklist_fg_focus                         = colors.bw_8
theme.tasklist_fg_minimize                      = colors.bw_2
theme.tasklist_fg_urgent                        = colors.red_2
theme.tasklist_bg_normal                        = colors.bw_1
theme.tasklist_bg_focus                         = colors.bw_2
theme.tasklist_bg_minimize                      = colors.bw_0_s
theme.tasklist_bg_urgent                        = colors.bw_1

theme.tasklist_shape_border_color               = colors.purple_2
theme.tasklist_shape_border_color_focus         = colors.green_2
theme.tasklist_shape_border_color_minimized     = colors.blue_2
theme.tasklist_shape_border_color_urgent        = colors.red_2

theme.hotkeys_border_width                      = theme.border
theme.hotkeys_border_color                      = colors.bw_5
theme.hotkeys_group_margin                      = 50

theme.prompt_bg                                 = colors.bw_0
theme.prompt_fg                                 = theme.fg_normal
theme.bg_systray                                = colors.bw_0

theme.border                                    = 4
theme.border_width                              = 4
theme.border_radius                             = 0
theme.fullscreen_hide_border                    = true
theme.maximized_hide_border                     = true
theme.menu_height                               = 20
theme.menu_width                                = 250
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.tasklist_spacing                          = 3
theme.useless_gap                               = 34
theme.systray_icon_spacing                      = 4

theme.snap_bg                                   = colors.bw_5
theme.snap_shape                                = function(cr, w, h)
                                                      gears.shape.rounded_rect(cr, w, h, theme.border_radius or 0)
                                                  end

theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"

theme.layout_cascadetile                        = theme.dir .. "/layouts/cascadetile.png"
theme.layout_centerwork                         = theme.dir .. "/layouts/centerwork.png"
theme.layout_cornerne                           = theme.dir .. "/layouts/cornerne.png"
theme.layout_cornernw                           = theme.dir .. "/layouts/cornernw.png"
theme.layout_cornerse                           = theme.dir .. "/layouts/cornerse.png"
theme.layout_cornersw                           = theme.dir .. "/layouts/cornersw.png"
theme.layout_dwindle                            = theme.dir .. "/layouts/dwindle.png"
theme.layout_fairh                              = theme.dir .. "/layouts/fairh.png"
theme.layout_fairv                              = theme.dir .. "/layouts/fairv.png"
theme.layout_floating                           = theme.dir .. "/layouts/floating.png"
theme.layout_fullscreen                         = theme.dir .. "/layouts/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/layouts/magnifier.png"
theme.layout_max                                = theme.dir .. "/layouts/max.png"
theme.layout_spiral                             = theme.dir .. "/layouts/spiral.png"
theme.layout_tile                               = theme.dir .. "/layouts/tile.png"
theme.layout_tilebottom                         = theme.dir .. "/layouts/tilebottom.png"
theme.layout_tileleft                           = theme.dir .. "/layouts/tileleft.png"
theme.layout_tiletop                            = theme.dir .. "/layouts/tiletop.png"
theme.layout_treetile                           = theme.dir .. "/layouts/treetile.png"

theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_load                               = theme.dir .. "/icons/load.png"
theme.widget_lock                               = theme.dir .. "/icons/lock.png"
theme.widget_unlock                             = theme.dir .. "/icons/unlock.png"
theme.widget_pacman                             = theme.dir .. "/icons/pacman.png"
theme.widget_users                              = theme.dir .. "/icons/user.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_net_0                              = theme.dir .. "/icons/net_0.png"
theme.widget_net_1                              = theme.dir .. "/icons/net_1.png"
theme.widget_net_2                              = theme.dir .. "/icons/net_2.png"
theme.widget_net_3                              = theme.dir .. "/icons/net_3.png"
theme.widget_net_4                              = theme.dir .. "/icons/net_4.png"
theme.widget_net_5                              = theme.dir .. "/icons/net_5.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_music_pause                        = theme.dir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.dir .. "/icons/stop.png"
theme.widget_light                              = theme.dir .. "/icons/light.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.widget_task                               = theme.dir .. "/icons/task.png"
theme.widget_scissors                           = theme.dir .. "/icons/scissors.png"

theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_minimize_button_focus            = theme.dir .. "/icons/titlebar/minimized_focus.png"
theme.titlebar_minimize_button_normal           = theme.dir .. "/icons/titlebar/minimized_normal.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

theme.tooltip_fg                                = colors.bw_8
theme.tooltip_bg                                = colors.bw_2
theme.tooltip_border_color                      = colors.bw_2
theme.tooltip_border_width                      = theme.border

theme.notification_fg                           = theme.fg_normal
theme.notification_bg                           = theme.bg_normal
theme.notification_border_color                 = colors.bw_2
theme.notification_border_width                 = theme.border
theme.notification_icon_size                    = 80
theme.notification_opacity                      = 1
theme.notification_max_width                    = 600
theme.notification_max_height                   = 400
theme.notification_margin                       = 20
theme.notification_shape                        = function(cr, w, h)
                                                      gears.shape.rounded_rect(cr, w, h, theme.border_radius or 0)
                                                  end

naughty.config.padding                          = 15
naughty.config.spacing                          = 10
naughty.config.defaults.timeout                 = 5
naughty.config.defaults.font                    = theme.font
naughty.config.defaults.fg                      = theme.notification_fg
naughty.config.defaults.bg                      = theme.notification_bg
naughty.config.defaults.border_width            = theme.notification_border_width
naughty.config.defaults.margin                  = theme.notification_margin

naughty.config.presets.normal                   = {
                                                      font         = theme.font,
                                                      fg           = theme.notification_fg,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                  }

naughty.config.presets.low                      = {
                                                      font         = theme.font,
                                                      fg           = theme.notification_fg,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                  }

naughty.config.presets.ok                       = {
                                                      font         = theme.font,
                                                      fg           = colors.aqua_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }

naughty.config.presets.info                     = {
                                                      font         = theme.font,
                                                      fg           = colors.blue_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }

naughty.config.presets.warn                     = {
                                                      font         = theme.font,
                                                      fg           = colors.yellow_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }

naughty.config.presets.critical                 = {
                                                      font         = theme.font,
                                                      fg           = colors.red_2,
                                                      bg           = theme.notification_bg,
                                                      border_width = theme.notification_border_width,
                                                      margin       = theme.notification_margin,
                                                      timeout      = 0,
                                                  }

theme.calendar_margin                           = theme.notification_margin - theme.border_width
theme.calendar_year_padding                     = naughty.config.padding
theme.calendar_year_bg_color                    = colors.bw_0
theme.calendar_month_padding                    = naughty.config.padding
theme.calendar_month_bg_color                   = colors.bw_0

theme.calendar_year_border_color                = colors.bw_1
theme.calendar_year_border_width                = theme.border
theme.calendar_month_border_color               = colors.bw_1
theme.calendar_month_border_width               = theme.border
theme.calendar_yearheader_border_color          = colors.bw_1
theme.calendar_yearheader_border_width          = theme.border
theme.calendar_header_border_color              = colors.bw_1
theme.calendar_header_border_width              = theme.border
theme.calendar_weekday_border_color             = colors.bw_0
theme.calendar_weekday_border_width             = theme.border
theme.calendar_weeknumber_border_color          = colors.bw_0
theme.calendar_weeknumber_border_width          = theme.border
theme.calendar_normal_border_color              = colors.bw_0
theme.calendar_normal_border_width              = theme.border
theme.calendar_focus_border_color               = colors.bw_9
theme.calendar_focus_border_width               = theme.border

theme.calendar_yearheader_bg_color              = colors.bw_1
theme.calendar_header_bg_color                  = colors.bw_1
theme.calendar_focus_fg_color                   = colors.bw_0
theme.calendar_focus_bg_color                   = colors.bw_9
theme.calendar_weeknumber_fg_color              = colors.bw_5

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = '/usr/share/icons/Papirus'

local markup = lain.util.markup

local space = wibox.widget.separator {
    orientation = "vertical",
    forced_width = 3,
    thickness = 3,
    color = "#00000000",
}

local vert_sep = wibox.widget.separator {
    orientation = "vertical",
    forced_width = theme.border / 2,
    thickness = theme.border / 2,
    color = colors.bw_2,
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- -- Menubar configuration
-- menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- -- }}}

-- -- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- -- {{{ Wibar
-- -- Create a textclock widget
mytextclock = wibox.widget.textclock()
mytextclock.font = theme.font

theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        font = theme.font,
        fg   = theme.fg_normal,
        bg   = theme.bg_normal,
    }
})

-- local volicon = wibox.widget.imagebox(theme.widget_vol)
-- theme.volume = lain.widget.alsa {
--   settings = function()
--     if volume_now.status == "off" then
--       volume_now.level = volume_now.level .. "M"
--     end

--     widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, volume_now.level .. "% "))
--   end,
--   notification_preset = {
--     font = theme.font_bold,
--     fg = theme.fg
--   }
-- }

-- theme.volume = lain.widget.alsabar {
--   notification_preset = { font = theme.font, fg = theme.fg_normal },
-- }

local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem {
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
    end
}

local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu {
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
    end
}

local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
    settings = function()
        if bat_now.status and bat_now.status ~= "N/A" then
            if bat_now.ac_status == 1 then
                widget:set_markup(markup.font(theme.font, " AC "))
                baticon:set_image(theme.widget_ac)
                return
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
                baticon:set_image(theme.widget_battery_empty)
            elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
                baticon:set_image(theme.widget_battery_low)
            else
                baticon:set_image(theme.widget_battery)
            end
            widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
        else
            widget:set_markup()
            baticon:set_image(theme.widget_ac)
        end
    end
})

local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.font(theme.font, " " .. coretemp_now .. "°C "))
    end
})
--]]
local tempicon = wibox.widget.imagebox(theme.widget_temp)

local fsicon = wibox.widget.imagebox(theme.widget_hdd)
-- needs Gio/Glib >= 2.54
theme.fs = lain.widget.fs({
    notification_preset = { fg = theme.fg_normal, bg = theme.bg_normal, font = "Terminus 10" },
    settings = function()
        local fsp = string.format(" %3.2f %s ", fs_now["/"].free, fs_now["/"].units)
        widget:set_markup(markup.font(theme.font, fsp))
    end
})

local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " "))
    end
})

-- -- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
awful.button({ }, 1, function(t) t:view_only() end),
awful.button({ modkey }, 1, function(t)
  if client.focus then
    client.focus:move_to_tag(t)
  end
end),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, function(t)
  if client.focus then
    client.focus:toggle_tag(t)
  end
end),
awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
awful.button({ }, 1, function (c)
  if c == client.focus then
    c.minimized = true
  else
    c:emit_signal(
    "request::activate",
    "tasklist",
    {raise = true}
    )
  end
end),
awful.button({ }, 3, function()
  awful.menu.client_list({ theme = { width = 250 } })
end),
awful.button({ }, 4, function ()
  awful.client.focus.byidx(1)
end),
awful.button({ }, 5, function ()
  awful.client.focus.byidx(-1)
end))

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

screen.connect_signal("property::geometry", set_wallpaper)

function theme.at_screen_connect(s)

  -- Wallpaper
  set_wallpaper(s)

  -- Each screen has its own tag table.
  awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()
  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(
  gears.table.join(
  awful.button({ }, 1, function () awful.layout.inc( 1) end),
  awful.button({ }, 3, function () awful.layout.inc(-1) end),
  awful.button({ }, 4, function () awful.layout.inc( 1) end),
  awful.button({ }, 5, function () awful.layout.inc(-1) end)
  )
  )
  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.currenttags,
    buttons = tasklist_buttons,
    bg_focus = theme.tasklist_bg_focus,
    shape = function(cr, width, height)
      gears.shape.rounded_rect(cr, width, height, theme.border_radius or 0)
    end,
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      memicon,
      mem.widget,
      vert_sep,
      cpuicon,
      cpu.widget,
      vert_sep,
      baticon,
      bat.widget,
      vert_sep,
      tempicon,
      temp.widget,
      vert_sep,
      fsicon,
      theme.fs.widget,
      vert_sep,
      vert_sep,
      mykeyboardlayout,
      space,
      vert_sep,
      space,
      wibox.widget.systray(),
      space,
      vert_sep,
      mytextclock,
      vert_sep,
      space,
      s.mylayoutbox,
    },
  }
end
-- }}}

return theme
