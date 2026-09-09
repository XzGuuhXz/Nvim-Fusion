-- NVIM FUSION - Purple Theme
-- Custom colorscheme for the NVIM FUSION configuration.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "nvim-fusion"

local c = {
  bg = "#100B18",
  bg_dark = "#0B0710",
  bg_float = "#171021",
  bg_highlight = "#21152F",
  bg_visual = "#392050",
  fg = "#E9DDF7",
  fg_muted = "#A996B8",
  purple = "#B77CFF",
  purple_light = "#D6AEFF",
  purple_dark = "#7C3AED",
  violet = "#9D7CFF",
  magenta = "#E08CFF",
  blue = "#7AA2F7",
  cyan = "#7DCFFF",
  green = "#9ECE6A",
  yellow = "#E0AF68",
  orange = "#FF9E64",
  red = "#F7768E",
  border = "#5B3A78",
  comment = "#756681",
  none = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal", { fg = c.fg, bg = c.bg })
hi("NormalFloat", { fg = c.fg, bg = c.bg_float })
hi("NormalNC", { fg = c.fg_muted, bg = c.bg })
hi("SignColumn", { bg = c.bg })
hi("EndOfBuffer", { fg = c.bg_highlight, bg = c.bg })
hi("Cursor", { fg = c.bg, bg = c.purple_light })
hi("CursorLine", { bg = c.bg_highlight })
hi("CursorColumn", { bg = c.bg_highlight })
hi("ColorColumn", { bg = c.bg_highlight })
hi("LineNr", { fg = c.comment, bg = c.bg })
hi("CursorLineNr", { fg = c.purple_light, bold = true, bg = c.bg_highlight })
hi("Visual", { bg = c.bg_visual })
hi("Search", { fg = c.bg, bg = c.purple_light, bold = true })
hi("IncSearch", { fg = c.bg, bg = c.magenta, bold = true })
hi("CurSearch", { fg = c.bg, bg = c.magenta, bold = true })
hi("MatchParen", { fg = c.purple_light, bg = c.bg_visual, bold = true })
hi("Folded", { fg = c.fg_muted, bg = c.bg_highlight })
hi("FoldColumn", { fg = c.purple, bg = c.bg })
hi("NonText", { fg = c.border })
hi("Whitespace", { fg = c.border })
hi("SpecialKey", { fg = c.purple })
hi("Directory", { fg = c.purple_light, bold = true })
hi("Title", { fg = c.purple_light, bold = true })
hi("Question", { fg = c.green, bold = true })
hi("MoreMsg", { fg = c.cyan })
hi("ModeMsg", { fg = c.fg, bold = true })
hi("WarningMsg", { fg = c.yellow })
hi("ErrorMsg", { fg = c.red, bold = true })

-- Syntax
hi("Comment", { fg = c.comment, italic = true })
hi("Constant", { fg = c.magenta })
hi("String", { fg = c.green })
hi("Character", { fg = c.green })
hi("Number", { fg = c.orange })
hi("Boolean", { fg = c.orange, bold = true })
hi("Float", { fg = c.orange })
hi("Identifier", { fg = c.fg })
hi("Function", { fg = c.purple_light, bold = true })
hi("Statement", { fg = c.purple })
hi("Conditional", { fg = c.purple, bold = true })
hi("Repeat", { fg = c.purple, bold = true })
hi("Label", { fg = c.violet })
hi("Operator", { fg = c.magenta })
hi("Keyword", { fg = c.purple, bold = true })
hi("Exception", { fg = c.red })
hi("PreProc", { fg = c.violet })
hi("Include", { fg = c.magenta })
hi("Define", { fg = c.violet })
hi("Macro", { fg = c.violet })
hi("Type", { fg = c.cyan })
hi("StorageClass", { fg = c.cyan })
hi("Structure", { fg = c.cyan })
hi("Typedef", { fg = c.cyan })
hi("Special", { fg = c.magenta })
hi("Delimiter", { fg = c.fg_muted })
hi("Underlined", { underline = true, fg = c.purple_light })
hi("Error", { fg = c.red, bold = true })

-- Treesitter
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@constant", { link = "Constant" })
hi("@function", { link = "Function" })
hi("@function.call", { fg = c.purple_light })
hi("@function.method", { fg = c.purple_light })
hi("@keyword", { link = "Keyword" })
hi("@keyword.function", { fg = c.magenta, bold = true })
hi("@keyword.return", { fg = c.purple_light, bold = true })
hi("@type", { link = "Type" })
hi("@type.builtin", { fg = c.cyan, italic = true })
hi("@variable", { fg = c.fg })
hi("@variable.builtin", { fg = c.magenta })
hi("@parameter", { fg = c.fg_muted })
hi("@property", { fg = c.violet })
hi("@field", { fg = c.violet })
hi("@operator", { link = "Operator" })
hi("@punctuation.bracket", { fg = c.fg_muted })
hi("@punctuation.delimiter", { fg = c.fg_muted })
hi("@tag", { fg = c.purple })
hi("@tag.attribute", { fg = c.violet })
hi("@tag.delimiter", { fg = c.fg_muted })

-- UI / Windows
hi("WinSeparator", { fg = c.border, bg = c.bg })
hi("FloatBorder", { fg = c.purple, bg = c.bg_float })
hi("FloatTitle", { fg = c.purple_light, bg = c.bg_float, bold = true })
hi("Pmenu", { fg = c.fg, bg = c.bg_float })
hi("PmenuSel", { fg = c.bg, bg = c.purple })
hi("PmenuSbar", { bg = c.bg_highlight })
hi("PmenuThumb", { bg = c.purple_dark })
hi("StatusLine", { fg = c.fg, bg = c.bg_float })
hi("StatusLineNC", { fg = c.fg_muted, bg = c.bg_highlight })
hi("TabLine", { fg = c.fg_muted, bg = c.bg_dark })
hi("TabLineFill", { bg = c.bg_dark })
hi("TabLineSel", { fg = c.purple_light, bg = c.bg_highlight, bold = true })

-- Diagnostics
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn", { fg = c.yellow })
hi("DiagnosticInfo", { fg = c.cyan })
hi("DiagnosticHint", { fg = c.purple_light })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.cyan })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.purple_light })
hi("LspReferenceText", { bg = c.bg_visual })
hi("LspReferenceRead", { bg = c.bg_visual })
hi("LspReferenceWrite", { bg = c.bg_visual })

-- Git
hi("GitSignsAdd", { fg = c.green })
hi("GitSignsChange", { fg = c.yellow })
hi("GitSignsDelete", { fg = c.red })
hi("DiffAdd", { fg = c.green, bg = "#172516" })
hi("DiffChange", { fg = c.yellow, bg = "#241D12" })
hi("DiffDelete", { fg = c.red, bg = "#28151C" })
hi("DiffText", { fg = c.purple_light, bg = c.bg_visual, bold = true })

-- Telescope
hi("TelescopeNormal", { fg = c.fg, bg = c.bg_float })
hi("TelescopeBorder", { fg = c.border, bg = c.bg_float })
hi("TelescopePromptNormal", { fg = c.fg, bg = c.bg_highlight })
hi("TelescopePromptBorder", { fg = c.purple, bg = c.bg_highlight })
hi("TelescopePromptTitle", { fg = c.bg, bg = c.purple, bold = true })
hi("TelescopePreviewTitle", { fg = c.bg, bg = c.magenta, bold = true })
hi("TelescopeResultsTitle", { fg = c.bg, bg = c.violet, bold = true })
hi("TelescopeSelection", { fg = c.fg, bg = c.bg_visual })
hi("TelescopeMatching", { fg = c.purple_light, bold = true })

-- Neo-tree / NvimTree
hi("NeoTreeNormal", { fg = c.fg, bg = c.bg_float })
hi("NeoTreeNormalNC", { fg = c.fg_muted, bg = c.bg_float })
hi("NeoTreeDirectoryIcon", { fg = c.purple })
hi("NeoTreeDirectoryName", { fg = c.purple_light })
hi("NeoTreeFileName", { fg = c.fg })
hi("NeoTreeGitAdded", { fg = c.green })
hi("NeoTreeGitModified", { fg = c.yellow })
hi("NeoTreeGitDeleted", { fg = c.red })
hi("NvimTreeNormal", { fg = c.fg, bg = c.bg_float })
hi("NvimTreeFolderIcon", { fg = c.purple })
hi("NvimTreeFolderName", { fg = c.purple_light })
hi("NvimTreeOpenedFolderName", { fg = c.magenta, bold = true })
hi("NvimTreeGitNewIcon", { fg = c.green })
hi("NvimTreeGitDirtyIcon", { fg = c.yellow })
hi("NvimTreeGitDeletedIcon", { fg = c.red })

-- Which-Key
hi("WhichKey", { fg = c.purple_light })
hi("WhichKeyGroup", { fg = c.magenta })
hi("WhichKeyDesc", { fg = c.fg })
hi("WhichKeySeparator", { fg = c.border })
hi("WhichKeyFloat", { bg = c.bg_float })
hi("WhichKeyValue", { fg = c.fg_muted })

-- Completion
hi("CmpItemAbbr", { fg = c.fg })
hi("CmpItemAbbrMatch", { fg = c.purple_light, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = c.magenta, bold = true })
hi("CmpItemKind", { fg = c.violet })
hi("CmpItemMenu", { fg = c.comment })

-- Markdown
hi("markdownHeadingDelimiter", { fg = c.purple, bold = true })
hi("markdownH1", { fg = c.purple_light, bold = true })
hi("markdownH2", { fg = c.magenta, bold = true })
hi("markdownCode", { fg = c.green })
hi("markdownLinkText", { fg = c.cyan, underline = true })

-- Spelling
hi("SpellBad", { undercurl = true, sp = c.red })
hi("SpellCap", { undercurl = true, sp = c.yellow })
hi("SpellLocal", { undercurl = true, sp = c.cyan })
hi("SpellRare", { undercurl = true, sp = c.purple_light })
