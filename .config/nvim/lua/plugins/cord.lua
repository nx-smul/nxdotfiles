return {
  {
    "vyfor/cord.nvim",
    branch = "client-server",
    build = ":Cord update",
    opts = function()
      return {
        display = {
          theme = "pastel",
        },
        text = {
          workspace = function(opts)
            local hour = tonumber(os.date("%H"))
            local status = hour >= 22 and "🌙 Late night coding"
              or hour >= 18 and "🌆 Evening session"
              or hour >= 12 and "☀️ Afternoon coding"
              or hour >= 5 and "🌅 Morning productivity"
              or "🌙 Midnight hacking"

            return string.format(status, opts.filename)
          end,
          editing = function(opts)
            return string.format("Editing %s - %s:%s", opts.filename, opts.cursor_line, opts.cursor_char)
          end,
        },
        idle = {
          details = function(opts)
            return string.format("Taking a break from %s", opts.workspace_name)
          end,
        },
        lazy = {
          -- change default idle icon for 'pastel' theme to keyboard
          -- icon = require("cord.api.icon").get("keyboard"),
          -- or use another theme's idle icon
          icon = require("cord.api.icon").get("idle", "onyx"),
        },
      }
    end,
  },
}
