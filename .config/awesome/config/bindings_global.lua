local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local function setup()
  globalkeys = gears.table.join(
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
    {description="show help", group ="awesome"}),

    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
    {description = "view previous", group = "tag"}),

    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
    {description = "view next", group = "tag"}),

    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
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
      awful.spawn({terminal, "-e", "tmux"})
    end,
    {description = "open a terminal", group = "launcher"}),

    awful.key({modkey,}, "d", function() awful.spawn.with_shell("~/bin/rofi/launcher-alt") end,
    {description = "open rofi app launcher", group = "launcher"}),

    awful.key({ modkey, "Control" }, "r", awesome.restart,
    {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
    {description = "quit awesome", group = "awesome"}),

    awful.key({modkey}, "l", function()
      naughty.notify({
        title = "testing",
        text = "increment",
      })
      awful.tag.incmwfact(0.05)
    end,
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

    -- Firefox
    awful.key({ modkey }, "b", function() awful.spawn("brave") end,
    {description = "launch browser", group = "browser"}),

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

    awful.key({ modkey }, "u",
    function ()
      myscreen = awful.screen.focused()
      myscreen.mywibox.visible = not myscreen.mywibox.visible
    end,
    {description = "toggle statusbar"}),

    -- Win+Alt+Left/Right: move client to prev/next tag and switch to it
    awful.key({ modkey, "Mod1" }, "braceleft",
    function ()
      -- get current tag
      -- naughty.notify {
      --   text = "hello"
      -- }
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
    awful.key({ modkey, "Mod1" }, "Right",
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
    {description = "move client to next tag and switch to it", group = "layout"})
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
      {description = "toggle focused client on tag #" .. i, group = "tag"})
      )
  end

  -- set global keys
  root.keys(globalkeys)
end

return {
  setup = setup,
}
