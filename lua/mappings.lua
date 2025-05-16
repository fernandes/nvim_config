-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua
require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { nowait = true, desc = "escape insert mode" })

-- tmux navigator
map("t", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = " " })
map("t", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = " " })
map("t", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = " " })
map("t", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = " " })
map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = " " })
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = " " })
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = " " })
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = " " })

-- bufferline
map("n", "<leader>gb", "<Cmd>TbufPick<CR>", { desc = " " })
map("n", "<leader>g1", ":lua vim.cmd(\"b\" .. vim.t.bufs[1])<CR>")

-- LSP
-- for LSP we are setting per buffer on configs.lspconfig

-- v = {
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = " " })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = " " })

-- tabs
map("n", "<leader>]", ":tabnext<CR>", { desc = " " })
map("n", "<leader>[", ":tabprevious<CR>", { desc = " " })
map("n", "<leader>tn", ":tabnew<CR>", { desc = " " })
map("n", "<leader>tx", ":tabclose<CR>", { desc = " " })
map("n", "<leader>t1", ":tabn 1<CR>", { desc = " " })
map("n", "<leader>t2", ":tabn 2<CR>", { desc = " " })
map("n", "<leader>t3", ":tabn 3<CR>", { desc = " " })
map("n", "<leader>t4", ":tabn 4<CR>", { desc = " " })
map("n", "<leader>t5", ":tabn 5<CR>", { desc = " " })
map("n", "<leader>t6", ":tabn 6<CR>", { desc = " " })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- obsidian
map("n", "<leader>ot", ":ObsidianToggleCheckbox<CR>", { desc = " " })

-- term
map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<leader>l", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term", silent = true })

map("n", "<leader>h", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })
