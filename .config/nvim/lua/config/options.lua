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

  -- Disable or tweak shadow settings for popups
  vim.g.neovide_shadow_radius = 0 -- Removes the shadow (set it to 0)
  vim.g.neovide_shadow_intensity = 0 -- Removes the shadow intensity
  vim.g.neovide_popup_blur = 0 -- Optionally disable blur in popups

  -- pywal configs
  -- Read and apply Pywal colors
  local function apply_pywal_colors()
    local file = io.open(os.getenv("HOME") .. "/.cache/wal/colors.json", "r")
    if file then
      local colors = vim.fn.json_decode(file:read("*all"))
      file:close()
      if colors and colors.special then
        vim.cmd("highlight Normal guibg=" .. colors.special.background)
        vim.cmd("highlight NonText guibg=" .. colors.special.background)
      else
        print("Error: Could not read Pywal colors.")
      end
    else
      print("Error: Pywal colors file not found.")
    end
  end

  -- Apply Pywal colors on Neovide startup
  vim.api.nvim_create_autocmd("VimEnter", { callback = apply_pywal_colors })
end
