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

  {
    "vim-ruby/vim-ruby",
    lazy = false,
  },
  {
    "tpope/vim-rails",
    lazy = false,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 1500 },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  {
    "dhruvasagar/vim-table-mode",
    cmd = { "TableModeToggle", "TableModeEnable", "TableModeDisable" },
    keys = {
      { "<leader>tm", "<cmd>TableModeToggle<cr>", desc = "Table Mode Toggle" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "treesitter")
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "bash",
          "c",
          "css",
          "html",
          "javascript",
          "json",
          "lua",
          "luadoc",
          "make",
          "markdown",
          "markdown_inline",
          "printf",
          "query",
          "ruby",
          "vim",
          "vimdoc",
        },
        indent = {
          enable = true,
          disable = { "ruby", "markdown" },
        },
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Additional languages for code blocks
          -- additional_vim_regex_highlighting = { "markdown" },
          additional_vim_regex_highlighting = false,
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
      }
    end,
  },
  {
    "dinhhuy258/git.nvim",
    event = "VeryLazy",
    cond = function()
      return vim.fs.dirname(vim.fs.find(".git", { path = "./", upward = true })[1])
    end,
    opts = {
      default_mappings = true, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Close blame window
        quit_blame = "q",
        -- Open blame commit
        blame_commit = "<CR>",
        -- Quit blame commit
        quit_blame_commit = "q",
        -- Open file/folder in git repository
        browse = "<Leader>go",
        -- Open pull request of the current branch
        open_pull_request = "<Leader>gp",
        -- Create a pull request with the target branch is set in the `target_branch` option
        create_pull_request = "<Leader>gn",
        -- Opens a new diff that compares against the current index
        diff = "<Leader>gd",
        -- Close git diff
        diff_close = "<Leader>gD",
        -- Revert to the specific commit
        revert = "<Leader>gr",
        -- Revert the current file to the specific commit
        revert_file = "<Leader>gR",
      },
      -- Default target branch when create a pull request
      target_branch = "master",
      -- Private gitlab hosts, if you use a private gitlab, put your private gitlab host here
      private_gitlabs = { "https://xxx.git.com" },
      -- Enable winbar in all windows created by this plugin
      winbar = false,
    },
  },
}
