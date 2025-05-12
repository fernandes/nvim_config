vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- :h clipboard-osc52
-- https://github.com/neovim/neovim/discussions/28010#discussioncomment-9877494
-- using
-- vim.g.clipboard = 'osc52'
-- would set paste function to read from OSC52, but terminal usually does not allow
-- givin some errors, so adding the function paste and using it, allows nvim to
-- paste after reading it
vim.o.clipboard = "unnamedplus"
local function paste()
  return {
    vim.fn.split(vim.fn.getreg(""), "\n"),
    vim.fn.getregtype(""),
  }
end
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ["+"] = paste,
    ["*"] = paste,
  },
}
if vim.env.TMUX ~= nil then
  local copy = {'tmux', 'load-buffer', '-w', '-'}
  local paste = {'bash', '-c', 'tmux refresh-client -l && sleep 0.05 && tmux save-buffer -'}
  vim.g.clipboard = {
    name = 'tmux',
    copy = {
      ['+'] = copy,
      ['*'] = copy,
    },
    paste = {
      ['+'] = paste,
      ['*'] = paste,
    },
    cache_enabled = 0,
  }
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "treesitter")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- require("base46").compile()
-- require("base46").load_all_highlights()
-- require("nvchad.utils").reload()

local colors = require("chadrc").base46.changed_themes.all.base_30

vim.g.terminal_color_0 = colors.b
vim.g.terminal_color_1 = colors.r
vim.g.terminal_color_2 = colors.g
vim.g.terminal_color_3 = colors.y
vim.g.terminal_color_4 = colors.bl
vim.g.terminal_color_5 = colors.m
vim.g.terminal_color_6 = colors.c
vim.g.terminal_color_7 = colors.w
vim.g.terminal_color_8 = colors.bb
vim.g.terminal_color_9 = colors.br
vim.g.terminal_color_10 = colors.bgr
vim.g.terminal_color_11 = colors.by
vim.g.terminal_color_12 = colors.bbl
vim.g.terminal_color_13 = colors.bm
vim.g.terminal_color_14 = colors.bc
vim.g.terminal_color_15 = colors.bw

-- treesitter folding
-- https://github.com/nvim-treesitter/nvim-treesitter#folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd [[set nofoldenable]]

require "configs.mason"
