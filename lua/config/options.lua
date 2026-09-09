vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
  number = true,
  relativenumber = false,
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  swapfile = false,
  backup = false,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  showmode = false,
  scrolloff = 8,
  signcolumn = "yes",
  updatetime = 50,
  colorcolumn = "0",
  clipboard = "unnamedplus",
  -- Hide end-of-buffer tildes (~) from the left side of empty lines.
  fillchars = "eob: ",
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
