-- NvChad default plugins
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/plugins/init.lua
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

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  -- this opts will extend the default opts
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "html",
        "css",
        "bash",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "ruby",
      },
      indent = {
        enable = true,
        disable = { "ruby" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },

  {
    "vim-ruby/vim-ruby",
    lazy = false
  },
  {
    "tpope/vim-rails",
    lazy = false
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 1500 },
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
