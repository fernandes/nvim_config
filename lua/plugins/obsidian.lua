local colors = require("chadrc").base46.changed_themes.all.base_30
local obsidian_vault_folder = "/Users/fernandes/Library/Mobile Documents/iCloud~md~obsidian/Documents/Second Brain/"

return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cond = function()
    if vim.fn.isdirectory(obsidian_vault_folder) ~= 0 then
      return true
    else
      return false
    end
  end,
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = obsidian_vault_folder,
      },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",

    disable_frontmatter = true,
    templates = {
      folder = "tmpl",
      subdir = "tmpl",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {
        fernandes = function()
          return "das ist fernandes!"
        end,
        year = function()
          return os.date "%Y"
        end,
        month = function()
          return os.date "%m"
        end,
        day = function()
          return os.date "%d"
        end,
        week_number = function()
          return os.date "%V"
        end,
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 24 * 60 * 60)
        end,
        tomorrow = function()
          return os.date("%Y-%m-%d", os.time() + 24 * 60 * 60)
        end,
      },
    },

    -- wiki_link_func = "prepend_note_path",
    -- wiki_link_func = "prepend_note_id",
    wiki_link_func = function(opts)
      -- return require("obsidian.util").wiki_link_id_prefix(opts)
      local filename = ""
      if opts.path:find "%.md$" then
        filename = opts.path:sub(1, -4)
      else
        filename = opts.path
      end
      vim.print(filename)
      return "[[" .. filename .. "|" .. opts.id .. "]]"
    end,

    -- name new notes starting the ISO datetime and ending with note name
    -- put them in the inbox subdir
    note_id_func = function(title)
      local suffix = ""
      -- get current ISO datetime with -5 hour offset from UTC for EST
      local current_datetime = os.date("!%Y-%m-%d", os.time() - 5 * 3600)
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return current_datetime .. "_" .. suffix
    end,

    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      ["<leader>ti"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    -- ui = {
    --   -- Disable some things below here because I set these manually for all Markdown files using treesitter
    --   checkboxes = { },
    --   bullets = {  },
    -- },
    -- ui = { enable = false },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "daily",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily.md",
    },

    attachments = {
      -- The default folder to place images in via `:ObsidianPasteImg`.
      -- If this is a relative path it will be interpreted as relative to the vault root.
      -- You can always override this per image by passing a full path to the command instead of just a filename.
      img_folder = "storage", -- This is the default
    },
    -- Optional, for templates (see below).
    ui = {
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
        ["-"] = { char = "", hl_group = "ObsidianCancelled" },
      },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = colors.y },
        ObsidianDone = { bold = true, fg = colors.c },
        ObsidianRightArrow = { bold = true, fg = colors.y },
        ObsidianTilde = { bold = true, fg = colors.br },
        ObsidianImportant = { bold = true, fg = colors.r },
        ObsidianCancelled = { bold = true, fg = colors.bb },
        ObsidianBullet = { bold = true, fg = colors.c },
        ObsidianRefText = { underline = true, fg = colors.m },
        ObsidianExtLinkIcon = { fg = colors.bbl },
        ObsidianTag = { italic = true, fg = colors.g },
        ObsidianBlockID = { italic = true, fg = colors.bbl },
        ObsidianHighlightText = { bg = colors.g },
      },
    },
  },
}
-- return
