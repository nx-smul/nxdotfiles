-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- NeoTree enable hidden files
require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})

local pywal16 = require("pywal16")
pywal16.setup()

-- unrelated
