return {
  "gbprod/nord.nvim",
  lazy = true,
  name = "nord",
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("nord") then
          opts.highlights = require("nord.groups.integrations.bufferline").get()
        end
      end,
    },
  },
}
