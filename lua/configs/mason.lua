-- List of packages to install
local mason_packages = {
  -- LSP Servers
  "bash-language-server",
  "css-lsp",
  "html-lsp",
  "lua-language-server",
  "ruby-lsp",
  "markdown-oxide",
  "marksman",

  -- Linters & Formatters
  "stylua", -- Lua formatter
  "rubocop", -- Ruby linter
  "standardrb", -- Ruby linter

  -- Debuggers (optional)
  -- "debugpy", -- Python debugger
}

-- Install packages on startup
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require("mason.api.command").MasonInstall(mason_packages)
--   end,
-- })
