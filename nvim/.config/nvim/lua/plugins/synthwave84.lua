return {
  "lunarvim/synthwave84.nvim",
  lazy = true,
  name = "synthwave84",
  opts = {
    glow = {
      error_msg = true,
      type2 = true,
      func = true,
      keyword = true,
      operator = false,
      buffer_current_target = true,
      buffer_visible_target = true,
      buffer_inactive_target = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "synthwave84",
    },
  },
}
