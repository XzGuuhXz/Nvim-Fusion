-- NVIM FUSION // THEME TEST
-- Compatibility-safe showcase for the NVIM FUSION v2 Neon Cyberpunk theme.
--
-- Run inside Neovim:
--   :luafile tests/theme_test.lua
--
-- Or from the repository root:
--   nvim -u init.lua +"luafile tests/theme_test.lua"

local api = vim.api

-- Neovim 0.12+ exposes Ex commands through vim.cmd.<command>().
vim.cmd.colorscheme("nvim-fusion")

local lines = {
  "╭──────────────────────────────────────────────────────────────╮",
  "│              NVIM FUSION // THEME SHOWCASE                  │",
  "│            NEON CYBERPUNK • PURPLE / FUCHSIA                │",
  "╰──────────────────────────────────────────────────────────────╯",
  "",
  "01  CORE UI",
  "     Normal      NormalFloat      CursorLine      Visual",
  "     Search      MatchParen       Folded          Directory",
  "",
  "02  SYNTAX",
  "     local function fusion_theme(value)",
  "       local message = \"NVIM FUSION\"",
  "       local count = 42",
  "       local enabled = true",
  "       if enabled then",
  "         return message .. \" // \" .. tostring(value)",
  "       end",
  "       return nil",
  "     end",
  "",
  "03  KEYWORDS / TYPES / OPERATORS",
  "     class ThemeConfig extends BaseConfig {",
  "       public static const accent: string = \"#C77DFF\"",
  "       private readonly neon: boolean = true",
  "     }",
  "",
  "04  DIAGNOSTICS",
  "     ERROR    Something went wrong",
  "     WARNING  Check this configuration",
  "     INFO     Neon fuchsia is the secondary accent",
  "     HINT     Transparency depends on your terminal",
  "     OK       Theme loaded successfully",
  "",
  "05  GIT",
  "     + added line",
  "     ~ modified line",
  "     - deleted line",
  "",
  "06  SEARCH / COMPLETION",
  "     TelescopeMatching   CmpItemAbbrMatch   CmpItemKind",
  "     ────────────────────────────────────────────────────────",
  "",
  "07  MARKDOWN",
  "     # NVIM FUSION",
  "     ## Neon Cyberpunk",
  "     [Documentation](https://github.com/XzGuuhXz/Nvim-Fusion)",
  "     `inline code`",
  "",
  "08  PALETTE",
  "     ultraviolet  #6D28D9",
  "     electric     #8B5CF6",
  "     violet       #A78BFA",
  "     neon         #C77DFF",
  "     magenta      #E879F9",
  "     fuchsia      #F0ABFC",
  "     pink         #F472B6",
  "     lavender     #C4B5FD",
  "",
  "────────────────────────────────────────────────────────────────",
  " NVIM FUSION v2 • THEME TEST COMPLETE",
}

local buf = api.nvim_create_buf(false, true)
api.nvim_buf_set_name(buf, "NVIM-FUSION://theme-test")
api.nvim_buf_set_lines(buf, 0, -1, false, lines)

vim.bo[buf].buftype = "nofile"
vim.bo[buf].bufhidden = "wipe"
vim.bo[buf].swapfile = false
vim.bo[buf].filetype = "lua"
vim.bo[buf].modifiable = false
vim.bo[buf].readonly = true

vim.cmd.tabnew()
local win = api.nvim_get_current_win()
api.nvim_win_set_buf(win, buf)

vim.wo.number = true
vim.wo.relativenumber = false
vim.wo.cursorline = true
vim.wo.wrap = false
vim.wo.signcolumn = "yes"
vim.wo.scrolloff = 6

local function mark(row, group, start_col, end_col)
  api.nvim_buf_add_highlight(buf, -1, group, row, start_col or 0, end_col or -1)
end

-- Header
mark(0, "Title")
mark(1, "WhichKey")
mark(2, "WhichKeyGroup")
mark(3, "Title")

-- Section headings
for _, row in ipairs({ 5, 9, 17, 22, 29, 34, 39, 45 }) do
  mark(row, "Title")
end

-- Lua syntax sample
mark(10, "Keyword", 0, 5)
mark(10, "Function", 6, 12)
mark(10, "Identifier", 13, -1)
mark(11, "Keyword", 0, 5)
mark(11, "Function", 6, 13)
mark(11, "String", 25, 38)
mark(12, "Keyword", 0, 5)
mark(12, "Identifier", 6, 11)
mark(12, "Number", 14, -1)
mark(13, "Keyword", 0, 5)
mark(13, "Identifier", 6, 13)
mark(13, "Boolean", 16, -1)
mark(14, "Conditional", 9, 11)
mark(15, "Keyword", 8, 14)
mark(15, "String", 27, 39)
mark(16, "Keyword", 6, 12)

-- TypeScript-like sample
mark(18, "Keyword", 0, 5)
mark(18, "Type", 6, 11)
mark(18, "Keyword", 12, 19)
mark(18, "Type", 20, 30)
mark(19, "StorageClass", 6, 12)
mark(19, "Keyword", 13, 19)
mark(19, "Type", 20, 26)
mark(19, "Operator", 27, 28)
mark(19, "String", 29, -1)
mark(20, "StorageClass", 6, 13)
mark(20, "Type", 22, 29)
mark(20, "Boolean", 32, -1)

-- Diagnostics
mark(24, "DiagnosticError")
mark(25, "DiagnosticWarn")
mark(26, "DiagnosticInfo")
mark(27, "DiagnosticHint")
mark(28, "DiagnosticOk")

-- Git
mark(30, "GitSignsAdd", 0, 1)
mark(31, "GitSignsChange", 0, 1)
mark(32, "GitSignsDelete", 0, 1)

-- Search / completion
mark(35, "TelescopeMatching")
mark(35, "CmpItemAbbrMatch")
mark(35, "CmpItemKind")

-- Markdown
mark(40, "markdownH1")
mark(41, "markdownH2")
mark(42, "markdownLinkText", 5, 17)
mark(43, "markdownCode", 0, -1)

-- Palette names
local palette_groups = {
  [46] = "DiagnosticHint",
  [47] = "Function",
  [48] = "Type",
  [49] = "Title",
  [50] = "markdownH2",
  [51] = "Directory",
  [52] = "Question",
  [53] = "String",
}

for row, group in pairs(palette_groups) do
  mark(row, group, 0, -1)
end

-- Diagnostic signs
local ns = api.nvim_create_namespace("nvim_fusion_theme_test")
api.nvim_buf_set_extmark(buf, ns, 24, 0, {
  sign_text = "E",
  sign_hl_group = "DiagnosticSignError",
})
api.nvim_buf_set_extmark(buf, ns, 25, 0, {
  sign_text = "W",
  sign_hl_group = "DiagnosticSignWarn",
})
api.nvim_buf_set_extmark(buf, ns, 26, 0, {
  sign_text = "I",
  sign_hl_group = "DiagnosticSignInfo",
})
api.nvim_buf_set_extmark(buf, ns, 27, 0, {
  sign_text = "H",
  sign_hl_group = "DiagnosticSignHint",
})

-- Show CursorLine immediately in the syntax section.
api.nvim_win_set_cursor(win, { 12, 0 })

vim.notify(
  "NVIM FUSION v2 theme showcase loaded",
  vim.log.levels.INFO,
  { title = "NVIM FUSION" }
)
