local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    ruby = { "standardrb", "rubocop" },
    md = { "markdownlint-cli2", "mdformat", "cbfmt" },

    -- css = { "prettier" },
    -- html = { "prettier" },
  },
  formatters = {
    cbfmt = {
      command = "cbfmt",
      args = { "--best-effort" },
    },
    standardrb = {
      command = "standardrb",
      args = { "--fix", "--stdin", "$FILENAME" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
