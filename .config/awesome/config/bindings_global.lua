local awful = require("awful")
local gears = require("gears")
local hotkeys_popup = require("awful.hotkeys_popup").widget
local revelation = require("revelation")
local lain = require("lain")
local naughty = require("naughty")

local function setup()
  globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group ="awesome"}),

    -- dynamic tagging
    awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag(mylayout) end),
    awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end),
    awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end),

    -- { and } to move to next and previous
    awful.key({ modkey,           }, "[",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),

    awful.key({ modkey,           }, "]",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),

   awful.key({ modkey, "Control" }, "[", function()
     lain.util.tag_view_nonempty(-1)
   end, {description = "view previous non-empty tag", group = "tag"}),

   awful.key({ modkey, "Control" }, "]", function()
     lain.util.tag_view_nonempty(1)
   end, {description = "view next non-empty tag", group = "tag"}),

    awful.key({ modkey, "Mod1" }, "[",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
      local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
      awful.client.movetotag(tag)
      awful.tag.viewprev()
    end,
    {description = "move client to previous tag and switch to it", group = "layout"}),

    awful.key({ modkey, "Mod1" }, "]",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
      local tag = client.focus.screen.tags[(t.name % 9) + 1]
      awful.client.movetotag(tag)
      awful.tag.viewnext()
    end,
    {description = "move client to next tag and switch to it", group = "layout"}),

    awful.key({ modkey, "Shift" }, "[",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get previous tag (modulo 9 excluding 0 to wrap from 1 to 9)
      local tag = client.focus.screen.tags[(t.name - 2) % 9 + 1]
      client.focus:move_to_tag(tag)
    end,
    {description = "move client to previous tag", group = "layout"}),

    awful.key({ modkey, "Shift" }, "]",
    function ()
      -- get current tag
      local t = client.focus and client.focus.first_tag or nil
      if t == nil then
        return
      end
      -- get next tag (modulo 9 excluding 0 to wrap from 9 to 1)
      local tag = client.focus.screen.tags[(t.name % 9) + 1]
      client.focus:move_to_tag(tag)
    end,
    {description = "move client to next tag", group = "layout"}),

    awful.key({ modkey,           }, "e",      revelation,
    {description = "show all windows", group = "layout"}),

    awful.key({ modkey,           }, "o", awful.tag.history.restore,
    {description = "go back", group = "tag"}),

    awful.key({ modkey,           }, "j",
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = "focus next by index", group = "client"}
    ),

    awful.key({ modkey,           }, "k",
    function ()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
    ),

    awful.key({ modkey,           }, "w", function () mymainmenu:show() end,
    {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
    {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
    {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
    {description = "focus the next screen", group = "screen"}),

    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
    {description = "focus the previous screen", group = "screen"}),

    -- rofi/launchers
    awful.key({modkey,}, "d", function() awful.spawn.with_shell [[launcher-alt]] end,
    {description = "app launcher", group = "rofi"}),

    awful.key({ modkey, }, "c", function()
      awful.spawn.with_shell [[clipmenu]]
    end,
    {description = "clipboard menu", group = "rofi"}),

    awful.key({ modkey, "Control" }, "c", function()
      awful.spawn.with_shell [[xclip -selection c -o | xclip -selection c]]
    end,
    {description = "remove formatting from clipboard"}),

    awful.key({ "Mod1" }, "Tab", function()
      awful.spawn.with_shell [[windows]]
    end,
    {description = "show opened windows", group = "rofi"}),

    awful.key({ modkey, "Mod1" }, "b", function()
      awful.spawn [[buku_run]]
    end,
    {description = "bookmarks menu"}),

    awful.key({ modkey }, "t", function()
      awful.screen.focused().quake:toggle()
    end,
    {description = "toggle dropdown terminal"}),

    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey,           }, "Tab",
    function ()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function()
      awful.spawn.with_shell("$TERMINAL -e tmux")
    end,
    {description = "open a terminal", group = "launcher"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

    awful.key({modkey}, "l", function() awful.tag.incmwfact(0.05) end,
    {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
    {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
    {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
    {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
    {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
    {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end,
    {description = "select next", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
    {description = "select previous", group = "layout"}),

    awful.key({ modkey, "Control" }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
        "request::activate", "key.unminimize", {raise = true}
        )
      end
    end,
    {description = "restore minimized", group = "client"}),

    -- Browser
    awful.key({ modkey }, "b", function()
      awful.spawn.with_shell("$BROWSER")
    end,
    {description = "launch browser", group = "browser"}),

    awful.key({ modkey, "Control" }, "b", function()
      awful.spawn.with_shell("browser_private")
    end,
    {description = "launch private browser", group = "browser"}),

    -- Volume keys
    awful.key({}, "XF86AudioRaiseVolume", function()
      awful.spawn {"pamixer", "-i", "5"}
    end, {description = "raise volume", group = "media"}),

    awful.key({}, "XF86AudioLowerVolume", function()
      awful.spawn {"pamixer", "-d", "5"}
    end, {description = "lower volume", group = "media"}),

    awful.key({}, "XF86AudioMute", function()
      awful.spawn {"pamixer", "-t"}
    end, {description = "mute volume", group = "media"}),

    -- brightness keys
    -- awful.key({}, "XF86MonBrightnessDown", function()
    --   awful.spawn {"xbacklight", "-dec", "10"}
    -- end, {description = "decrease brightness", group = "media"}),

    -- awful.key({}, "XF86MonBrightnessUp", function()
    --   awful.spawn {"xbacklight", "-inc", "10"}
    -- end, {description = "increase brightness", group = "media"}),

    awful.key({}, "XF86MonBrightnessUp", function()
      awful.spawn.with_shell("raise-brightness")
    end, {description = "increase brightness", group = "media"}),

    awful.key({}, "XF86MonBrightnessDown", function()
      awful.spawn.with_shell("lower-brightness")
    end, {description = "decrease brightness", group = "media"}),

    awful.key({}, "Print", function()
      awful.spawn {"flameshot", "gui"}
    end, {description = "select part of screen to print", group = "media"}),

    awful.key({ modkey }, "Print", function()
      awful.spawn {"flameshot", "full"}
    end, {description = "print full screen", group = "media"}),

    awful.key({"Control"}, "Print", function()
      awful.spawn {"flameshot", "screen"}
    end, {description = "print screen", group = "media"}),

    awful.key({ modkey }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}),

    -- awful.key({ modkey }, "t",
    -- function()
    --   naughty.notify {
    --     text = "this is just a test",
    --     title = "test"
    --   }
    -- end,
    -- {description = "test notifications"}),

    -- awful.key({ modkey }, "y",
    -- function()
    --   local id = naughty.get_next_notification_id()
    --   local notification = naughty.getById(id)
    --   local res = naughty.destroy(notification)
    --   naughty.notify {
    --     text = "" .. res .. (id or "no id"),
    --     title = "testing",
    --   }
    -- end,
    -- {description = "test notifications"}),

    awful.key({ modkey }, "`",
    function()
      local screen = awful.screen.focused()
      naughty.destroy_all_notifications {screen}
    end,
    {description = "close all notifications", group = "notification"}),

    awful.key({ "Mod1" }, "b", function()
      awful.spawn.with_shell("~/bin/buku-add")
    end,
    {description = "add bookmark to buku", group = "bookmarks"}),

    awful.key({ modkey, "Mod1" }, "u", function()
      awful.spawn.with_shell("powermenu")
    end,
    {description = "powermenu", group = "menu"}),

    awful.key( { modkey, "Mod1" }, "=", function()
      awful.layout.inc(1)
    end, {description = "go to next layout", group = "layout"}),

    awful.key( { modkey, "Mod1" }, "-", function()
      awful.layout.inc(-1)
    end, {description = "go to previous layout", group = "layout"}),

    awful.key( { modkey, "Control" }, "-", function()
      awful.spawn({"xkb-switch", "-p"})
    end, {description = "go to next keyboard layout", "keyboard"}),

    awful.key( { modkey, "Control" }, "=", function()
      awful.spawn({"xkb-switch", "-n"})
    end, {description = "go to next keyboard layout", "keyboard"})

    -- awful.key( { modkey }, "-", function()
    --   lain.util.useless_gap_resize(1)
    -- end, {description = "increase gap size", group = "layout"}),

    -- awful.key( { modkey }, "+", function()
    --   lain.util.useless_gap_resize(-1)
    -- end, {description = "increase gap size", group = "layout"})

    -- awful.key( { modkey }, "=", function()
    --   lain.util.useless_gap_resize(-1)
    -- end, {description = "increase gap size", group = "layout"})

    -- awful.key({ modkey }, "u",
    -- function ()
    --   myscreen = awful.screen.focused()
    --   myscreen.mywibox.visible = not myscreen.mywibox.visible
    -- end,
    -- {description = "toggle statusbar"}),
    )

  -- Bind all key numbers to tags.
  -- Be careful: we use keycodes to make it work on any keyboard layout.
  -- This should map on the top row of your keyboard, usually 1 to 9.
  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
      -- View tag only.
      awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #"..i, group = "tag"}),

      -- Toggle tag display.
      awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag"}),

      -- Move client to tag.
      awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #"..i, group = "tag"}),

      -- Toggle tag on focused client.
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description = "toggle focused client on tag #" .. i, group = "tag"}),

      -- toggle tag and move to tag
      awful.key({ modkey, "Mod1" }, "#" .. i + 9,
      function ()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
            tag:view_only()
          end
        end
      end,
      {description = string.format("move focused client to tag #%s and view that tag", i), group = "tag"})
      )
  end

  -- set global keys
  root.keys(globalkeys)
end

return {
  setup = setup,
}
