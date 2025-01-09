-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})

local pywal16 = require("pywal16")
pywal16.setup()

local lualine = require("lualine")
lualine.setup({
  options = {
    theme = "pywal16-nvim",
  },
})
