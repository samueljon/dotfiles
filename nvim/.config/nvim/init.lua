-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("neogit")

-- Make the theme background transparent
vim.o.background = "dark"
vim.cmd("hi Normal ctermbg=none guibg=none")
vim.cmd("hi VertSplit ctermbg=none guibg=none")
vim.cmd("hi StatusLine ctermbg=none guibg=none")
vim.cmd("hi LineNr ctermbg=none guibg=none")
vim.cmd("hi CursorLineNr ctermbg=none guibg=none")
vim.cmd("hi Pmenu ctermbg=none guibg=none")
vim.cmd("hi PmenuSel ctermbg=none guibg=none")
