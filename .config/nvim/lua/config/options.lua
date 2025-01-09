-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Function to refresh the colorscheme
local function refresh_colorscheme()
  if vim.o.background == "light" then
    vim.cmd("colorscheme pywal16")
  else
    vim.cmd("colorscheme pywal16")
  end
end
-- Autocommand to refresh colorscheme on startup
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = refresh_colorscheme,
})
-- Autocommand to refresh colorscheme when background changes
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = refresh_colorscheme,
})

--Neovide config
if vim.g.neovide then
  -- padding settings
  vim.g.neovide_padding_top = 25
  vim.g.neovide_padding_bottom = 25
  vim.g.neovide_padding_right = 25
  vim.g.neovide_padding_left = 25

  -- pywal configs
  -- Read the current Pywal colors
  local function read_pywal_colors()
    local file = io.open(os.getenv("HOME") .. "/.cache/wal/colors.json", "r")
    if not file then
      return nil
    end
    local json = file:read("*all")
    file:close()
    return vim.fn.json_decode(json)
  end

  -- Apply the Pywal colors to Neovide
  local function apply_pywal_colors()
    local colors = read_pywal_colors()
    if colors and colors.special then
      vim.cmd("highlight Normal guibg=" .. colors.special.background)
      vim.cmd("highlight NonText guibg=" .. colors.special.background)
    else
      print("Error: Could not read Pywal colors.")
    end
  end

  -- Set up an autocommand to apply the colors when Neovide starts
  vim.api.nvim_create_augroup("PywalColors", { clear = true })
  vim.api.nvim_create_autocmd("VimEnter", {
    group = "PywalColors",
    pattern = "*",
    callback = apply_pywal_colors,
  })

  -- Apply the colors immediately in case the script is sourced
  apply_pywal_colors()
end
