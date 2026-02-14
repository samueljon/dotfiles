-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Make the theme background transparent
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.o.background = "dark"
    vim.cmd("hi Normal ctermbg=none guibg=none")
    vim.cmd("hi VertSplit ctermbg=none guibg=none")
    vim.cmd("hi StatusLine ctermbg=none guibg=none")
    vim.cmd("hi LineNr ctermbg=none guibg=none")
    vim.cmd("hi CursorLineNr ctermbg=none guibg=none")
    vim.cmd("hi Pmenu ctermbg=none guibg=none")
    vim.cmd("hi PmenuSel ctermbg=none guibg=none")
  end,
})
