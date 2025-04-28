-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

  changed_themes = {
    all = {
      base_30 = {
        fg = "#F5FAFF",
        bg = "#1f212b",

        b0 = "#292d31", -- gunmetal
        b1 = "#32363b", -- gunmetal
        b2 = "#32363b", -- onyx
        b3 = "#373b41", -- onyx
        b4 = "#3d4148", -- onyx
        b5 = "#43464e", -- charcoal

        g0 = "#4e505b", -- davy's gray
        g1 = "#5a5b68", -- davy's gray 
        g2 = "#656575", -- dim gray
        g3 = "#6c6c7c", -- dim gray
        g4 = "#737382", -- slate gray
        g5 = "#80808D", -- taupe gray

        w0 = "#d0d5da", -- alice blue
        w1 = "#edf2f8", -- alice blue
        w2 = "#f5faff", -- alice blue
        w3 = "#f6fafc", -- anti-flash white
        w4 = "#f7f9f8", -- seasalt
        w5 = "#fafaf5", -- baby powder

        -- terminal color names
        b = "#373B41", -- default background
        bb = "#656575", -- lighter background

        r = "#E46266", -- variables, XML tags
        br = "#DDA2F6", -- deprecated, opening/closing embedded language tags

        g = "#AED7B6", -- strings, inherited class
        bgr = "#BBDDC2", -- strings, inherited class

        y = "#F9AB77", -- integers, boolean
        by = "#EDD096", -- classes, search text background

        bl = "#4D8ACB", -- functions, methods
        bbl = "#85B1E0", -- functions, methods

        m = "#7E7EDD", -- keywords, storage
        bm = "#A571F4", -- light background

        c = "#93DDFB", -- dark foreground
        bc = "#9AEFEA", -- light foreground

        w = "#F8F8F0", -- comments
        bw = "#F5FAFF", -- main foreground,

        selection_foreground = "#F8F8F0",
        selection_background = "#313343",
        url_color = "#0087BD",
        cursor = "#7B839B",
        active_tab_foreground = "#1f212b",
        active_tab_background = "#A571F4",
        inactive_tab_foreground = "#C0C0E0",
        inactive_tab_background = "#313343",

        white = "#F8F8F2",
        darker_black = "#222430",
        black = "#282A36", --  nvim bg
        black2 = "#2d303e",
        one_bg = "#373844", -- real bg of onedark
        one_bg2 = "#44475a",
        one_bg3 = "#565761",
        grey = "#5e5f69",
        grey_fg = "#666771",
        grey_fg2 = "#6e6f79",
        light_grey = "#73747e",
        red = "#ff7070",
        baby_pink = "#ff86d3",
        pink = "#FF79C6",
        line = "#3c3d49", -- for lines like vertsplit
        green = "#50fa7b",
        vibrant_green = "#5dff88",
        nord_blue = "#8b9bcd",
        blue = "#a1b1e3",
        yellow = "#F1FA8C",
        sun = "#FFFFA5",
        purple = "#BD93F9",
        dark_purple = "#BD93F9",
        teal = "#92a2d4",
        orange = "#FFB86C",
        cyan = "#8BE9FD",
        statusline_bg = "#2d2f3b",
        lightbg = "#41434f",
        pmenu_bg = "#b389ef",
        folder_bg = "#BD93F9",

      },
      base_16 = {
        base00 = "#373B41", -- default background
        base08 = "#656575", -- lighter background

        base01 = "#E46266", -- variables, XML tags
        base09 = "#DDA2F6", -- deprecated, opening/closing embedded language tags

        base02 = "#AED7B6", -- strings, inherited class
        base0A = "#BBDDC2", -- strings, inherited class

        base03 = "#F9AB77", -- integers, boolean
        base0B = "#EDD096", -- classes, search text background

        base04 = "#4D8ACB", -- functions, methods
        base0C = "#85B1E0", -- functions, methods

        base05 = "#7E7EDD", -- keywords, storage
        base0D = "#A571F4", -- light background

        base06 = "#93DDFB", -- dark foreground
        base0E = "#9AEFEA", -- light foreground

        base07 = "#F8F8F0", -- comments
        base0F = "#F5FAFF", -- main foreground,
      }
    }
  },

	hl_override = {
    -- neovim
    Normal = { fg = "fg", bg = "bg" },
    Conditional = { fg = "m" },
    Comment = { fg = "bb" },
    Define = { fg = "m" },
    Delimiter = { fg = "br" },
    Function = { fg = "w" },
    Keyword = { fg = "m" },
    PreProc = { fg = "by" },
    Special = { fg = "bm" },
    SpecialChar = { fg = "br"},
    Statement = { fg = "m" },
    StorageClass = { fg = "bm" },
    String = { fg = "br" },
    Type = { fg = "bm", sp = "none" },
    Visual = { bg = "selection_background" },
    Search = { fg = "bg", bg = "by" },
    IncSearch = { fg = "bg", bg = "y" },
    TelescopeMatching = { link = "Search" },
    NvimTreeNormal = { fg = "g5", bg = "bg" },
    NvimTreeNormalNC = { fg = "g5", bg = "bg" },
    ErrorMsg = { fg = "w2", bg = "r" },
    Cursor = { bg = "y" },

    St_CommandMode = { bg = "g" },
    St_CommandModeSep = { fg = "g" },
    St_NormalMode = { bg = "m" },
    St_NormalModeSep = { fg = "m" },
    St_VisualMode = { bg = "by" },
    St_VisualModeSep = { fg = "by" },
    St_ReplaceMode = { bg = "y" },
    St_ReplaceModeSep = { fg = "y" },
    St_pos_icon = { bg = "g" },
    St_pos_text = { fg = "g" },
    St_pos_sep = { fg = "g" },
    St_cwd_icon = { bg = "r" },
    St_cwd_sep = { fg = "r" },
    St_Lsp = { fg = "m" },
    Added = { fg = "g" },
    DiffAdded = { fg = "g" },
    ["@diff.plus"] = { fg = "g" },
    Removed = { fg = "r" },
    DiffRemoved = { fg = "r" },
    ["@diff.minus"] = { fg = "r" },

    -- NvimTree
    NvimTreeFolderName = { fg = "g5" },
    NvimTreeOpenedFolderName = { fg = "fg" },
    NvimTreeSpecialFile = { fg = "bl" },
    NvimTreeFolderIcon = { fg = "m" },

    -- tree sitter
    -- ruby as base
		["@keyword"] = { fg = "m" },
		["@keyword.function"] = { fg = "m" },
		["@function"] = { fg = "w" },
		["@comment"] = { fg = "bb" },
		["@keyword.return"] = { fg = "m" },
		["@string"] = { fg = "br" },
		["@keyword.conditional"] = { fg = "m" },
		["@variable"] = { fg = "g5" },
		["@punctuation.delimiter"] = { fg = "y" },
		["@punctuation.bracket"] = { fg = "by" },
		["@number"] = { fg = "y" },
		["@function.call"] = { fg = "w5" },
		["@variable.parameter"] = { fg = "g5" },

    -- bash
    ["@keyword.directive"] = { fg = "comment" },
    ["@character"] = { fg = "w0" },

    -- LSP
    St_LspMsg = { fg = "g" },
    St_LspInfo = { fg = "g" },
    LspSignatureActiveParameter = { bg = "g" },
	},

  hl_add = {
    -- neovim
    CurSearch = { fg = "bg", bg = "y" },

    -- nvimtree
    NvimTreeGitFolderStagedHL = { fg = "g" },
    NvimTreeGitFileStagedHL = { fg = "g" },
    NvimTreeNormal = { fg = "y", bg = "y" },

    -- ruby
    rubyKeywordAsMethod = { fg = "w0" },
    rubyInstanceVariable = { fg = "w0" },
    rubyAccess = { fg = "bgr" },

    -- treesitter
    -- ruby
    ["@variable.member.ruby"] = { link = "rubyInstanceVariable" },
    ["@keyword.modifier.ruby"] = { link = "rubyAccess" },

    -- bash
    ["@variable.bash"] = { fg = "bm" },
    ["@function.builtin.bash"] = { fg = "m" },

    -- html
    htmlTag = { fg = "bbl" },
    htmlTitle = { fg = "y" },
    htmlSpecialTagName = { fg = "g" },
    htmlEndTag = { fg = "bl" },
    ["@constant.html"] = { fg = "bb" },
    htmlArg = { fg = "fg" },
    ["@tag.delimiter.html"] = { fg = "bbl" },
    ["@tag.html"] = { fg = "m" },
    ["@markup.heading.html"] = { fg = "y" },
    ["@tag.attribute.html"] = { fg = "w1" },
    ["@markup.heading.1.html"] = { fg = "by" },
    ["@markup.heading.2.html"] = { fg = "by" },
    ["@markup.heading.3.html"] = { fg = "by" },
    ["@markup.heading.4.html"] = { fg = "by" },
    ["@markup.heading.5.html"] = { fg = "by" },
    ["@markup.heading.6.html"] = { fg = "by" },
    htmlH1 = { fg = "by" },
    ["@none"] = { fg = "fg" },

    -- css
    cssTagName = { fg = "m" },
    ["@tag.css"] = { link = "cssTagName" },
    cssClassName = { fg = "m" },
    cssClassNameDot = { fg = "y" },
    cssNoise = { fg = "y" },
    cssAttrRegion = { fg = "bbl" },
    cssPseudoClassId = { fg = "bbl" },
    cssBraces = { fg = "by" },
    cssFunctionName = { fg = "w1" },
    ["@string.css"] = { fg = "br" },
    ["@type.css"] = { fg = "m" },
    ["@property.css"] = { fg = "bm" },

    -- json
    jsonKeyword = { fg = "m" },
    jsonBraces = { fg = "by" },
    jsonFold = { fg = "by" },
    jsonNoise = { fg = "y" },
    jsonQuote = { fg = "m" },
    jsonKeywordMatch = { fg = "y" },
    jsonNumber = { fg = "y" },
    ["@property.json"] = { link = "jsonKeyword"},
    ["@constant.builtin.json"] = { fg = "w1" },

    -- js
    javaScriptNumber = { fg = "y" },
    javaScriptNull = { fg = "br" },
    javaScriptBraces = { fg = "by" },
    javaScriptParens = { fg = "by" },
    javaScriptBranch = { fg = "bgr" },
    javaScriptOperator = { fg = "c" },
    ["@type.builtin.javascript"] = { fg = "bbl" },
    ["@keyword.conditional.javascript"] = { fg = "bgr" },

    -- lua
    ["@constant.lua"] = { fg = "m" },
    ["@variable.member.lua"] = { fg = "w1" },
    ["@property.lua"] = { fg = "m" },
    ["@constructor.lua"] = { fg = "by" },

    -- gitconfig
    gitconfigVariable = { fg = "m" },
    gitconfigAssignment = { fg = "w1" },
    gitconfigNone = { fg = "fg" },
  },

  theme_toggle = { "onedark", "one_light" },
}

return M
