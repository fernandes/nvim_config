return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     dofile(vim.g.base46_cache .. "treesitter")
  --     require("nvim-treesitter.configs").setup({
  --       highlight = {
  --         enable = true,
  --         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
  --         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
  --         -- Using this option may slow down your editor, and you may see some duplicate highlights.
  --         -- Instead of true it can also be a list of languages
  --         additional_vim_regex_highlighting = false,
  --       }
  --     })
  --   end,
  -- 	-- opts = {
  -- 	-- 	ensure_installed = {
  -- 	-- 	 "vim", "lua", "vimdoc",
  -- 	--     "ruby", "html", "css"
  -- 	-- 	},
  -- 	-- },
  -- },
}
