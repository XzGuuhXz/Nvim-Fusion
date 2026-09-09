-- NVIM FUSION // NEON CYBERPUNK
-- Proprietary colorscheme for Nvim Fusion v2.
-- Palette: ultraviolet neon, deep violet, electric magenta and neon fuchsia.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.g.colors_name = "nvim-fusion"

local c = {
  none = "NONE", void = "#08050D", abyss = "#0D0816", panel = "#130B20",
  panel2 = "#1A0E2A", panel3 = "#24133A", panel4 = "#2E1948", grid = "#392054",
  neon = "#C77DFF", neon2 = "#E879F9", violet = "#A78BFA", electric = "#8B5CF6",
  ultraviolet = "#6D28D9", fuchsia = "#F0ABFC", pink = "#F472B6", magenta = "#E879F9",
  blue = "#60A5FA", mint = "#C4B5FD",
  green = "#86EFAC", yellow = "#FDE68A", orange = "#FDBA74", red = "#FB7185",
  fg = "#F5EFFF", fg2 = "#D8C8EA", muted = "#8E7A9F", dim = "#5F4B70", border = "#512B75",
}

local function hi(group, opts) vim.api.nvim_set_hl(0, group, opts) end

hi("Normal", { fg = c.fg, bg = c.none }); hi("NormalNC", { fg = c.fg2, bg = c.none })
hi("NormalFloat", { fg = c.fg, bg = c.panel }); hi("FloatBorder", { fg = c.neon, bg = c.panel })
hi("FloatTitle", { fg = c.void, bg = c.neon, bold = true }); hi("SignColumn", { bg = c.none })
hi("EndOfBuffer", { fg = c.dim, bg = c.none }); hi("Cursor", { fg = c.void, bg = c.neon })
hi("CursorLine", { bg = c.panel }); hi("CursorColumn", { bg = c.panel }); hi("ColorColumn", { bg = c.panel2 })
hi("LineNr", { fg = c.dim, bg = c.none }); hi("CursorLineNr", { fg = c.fuchsia, bg = c.panel, bold = true })
hi("Visual", { bg = c.panel4, bold = true }); hi("VisualNOS", { bg = c.panel4 })
hi("Search", { fg = c.void, bg = c.fuchsia, bold = true }); hi("IncSearch", { fg = c.void, bg = c.neon2, bold = true })
hi("CurSearch", { fg = c.void, bg = c.neon, bold = true }); hi("MatchParen", { fg = c.fuchsia, bg = c.panel3, bold = true, underline = true })
hi("Folded", { fg = c.violet, bg = c.panel }); hi("FoldColumn", { fg = c.electric, bg = c.none })
hi("NonText", { fg = c.grid }); hi("Whitespace", { fg = c.grid }); hi("SpecialKey", { fg = c.electric })
hi("Directory", { fg = c.fuchsia, bold = true }); hi("Title", { fg = c.neon, bold = true })
hi("Question", { fg = c.pink, bold = true }); hi("MoreMsg", { fg = c.fuchsia }); hi("ModeMsg", { fg = c.fg, bold = true })
hi("WarningMsg", { fg = c.yellow }); hi("ErrorMsg", { fg = c.red, bold = true }); hi("Conceal", { fg = c.violet })
hi("WildMenu", { fg = c.void, bg = c.neon, bold = true })

hi("Comment", { fg = c.muted, italic = true }); hi("Constant", { fg = c.neon2 }); hi("String", { fg = c.mint })
hi("Character", { fg = c.mint }); hi("Number", { fg = c.orange }); hi("Boolean", { fg = c.orange, bold = true })
hi("Float", { fg = c.orange }); hi("Identifier", { fg = c.fg2 }); hi("Function", { fg = c.neon, bold = true })
hi("Statement", { fg = c.violet }); hi("Conditional", { fg = c.electric, bold = true }); hi("Repeat", { fg = c.electric, bold = true })
hi("Label", { fg = c.fuchsia }); hi("Operator", { fg = c.neon2 }); hi("Keyword", { fg = c.neon, bold = true })
hi("Exception", { fg = c.red }); hi("PreProc", { fg = c.fuchsia }); hi("Include", { fg = c.neon2 })
hi("Define", { fg = c.violet }); hi("Macro", { fg = c.violet }); hi("Type", { fg = c.fuchsia })
hi("StorageClass", { fg = c.fuchsia }); hi("Structure", { fg = c.fuchsia }); hi("Typedef", { fg = c.fuchsia })
hi("Special", { fg = c.neon2 }); hi("Delimiter", { fg = c.fg2 }); hi("Underlined", { fg = c.fuchsia, underline = true })
hi("Error", { fg = c.red, bold = true })

local ts = {
  ["@comment"] = { link = "Comment" }, ["@string"] = { link = "String" }, ["@number"] = { link = "Number" },
  ["@boolean"] = { link = "Boolean" }, ["@constant"] = { link = "Constant" }, ["@constant.builtin"] = { fg = c.neon2 },
  ["@function"] = { link = "Function" }, ["@function.call"] = { fg = c.neon }, ["@function.method"] = { fg = c.neon },
  ["@keyword"] = { link = "Keyword" }, ["@keyword.function"] = { fg = c.neon2, bold = true },
  ["@keyword.return"] = { fg = c.fuchsia, bold = true }, ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = c.fuchsia, italic = true }, ["@variable"] = { fg = c.fg2 },
  ["@variable.builtin"] = { fg = c.neon2 }, ["@parameter"] = { fg = c.muted }, ["@property"] = { fg = c.violet },
  ["@field"] = { fg = c.violet }, ["@operator"] = { link = "Operator" }, ["@punctuation.bracket"] = { fg = c.muted },
  ["@punctuation.delimiter"] = { fg = c.dim }, ["@tag"] = { fg = c.neon }, ["@tag.attribute"] = { fg = c.fuchsia },
  ["@tag.delimiter"] = { fg = c.muted },
}
for group, opts in pairs(ts) do hi(group, opts) end

hi("WinSeparator", { fg = c.border, bg = c.none }); hi("VertSplit", { fg = c.border, bg = c.none })
hi("StatusLine", { fg = c.fg, bg = c.panel }); hi("StatusLineNC", { fg = c.muted, bg = c.abyss })
hi("TabLine", { fg = c.muted, bg = c.abyss }); hi("TabLineFill", { bg = c.void }); hi("TabLineSel", { fg = c.fg, bg = c.panel3, bold = true })
hi("Pmenu", { fg = c.fg, bg = c.panel }); hi("PmenuSel", { fg = c.void, bg = c.neon, bold = true })
hi("PmenuSbar", { bg = c.panel3 }); hi("PmenuThumb", { bg = c.electric }); hi("PmenuKind", { fg = c.fuchsia, bg = c.panel }); hi("PmenuExtra", { fg = c.muted, bg = c.panel })
hi("StatusLineTerm", { fg = c.fg, bg = c.panel }); hi("StatusLineTermNC", { fg = c.muted, bg = c.abyss })

hi("DiagnosticError", { fg = c.red }); hi("DiagnosticWarn", { fg = c.yellow }); hi("DiagnosticInfo", { fg = c.fuchsia }); hi("DiagnosticHint", { fg = c.neon }); hi("DiagnosticOk", { fg = c.green })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red }); hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow }); hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.fuchsia }); hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.neon })
hi("LspReferenceText", { bg = c.panel3 }); hi("LspReferenceRead", { bg = c.panel3 }); hi("LspReferenceWrite", { bg = c.panel4, bold = true }); hi("LspInlayHint", { fg = c.dim, bg = c.panel })

hi("GitSignsAdd", { fg = c.green }); hi("GitSignsChange", { fg = c.fuchsia }); hi("GitSignsDelete", { fg = c.red })
hi("DiffAdd", { fg = c.green, bg = "#10261C" }); hi("DiffChange", { fg = c.fuchsia, bg = "#24132F" }); hi("DiffDelete", { fg = c.red, bg = "#29131E" }); hi("DiffText", { fg = c.void, bg = c.neon, bold = true })

hi("TelescopeNormal", { fg = c.fg, bg = c.panel }); hi("TelescopeBorder", { fg = c.electric, bg = c.panel }); hi("TelescopePromptNormal", { fg = c.fg, bg = c.panel2 }); hi("TelescopePromptBorder", { fg = c.neon, bg = c.panel2 })
hi("TelescopePromptTitle", { fg = c.void, bg = c.neon, bold = true }); hi("TelescopePreviewTitle", { fg = c.void, bg = c.fuchsia, bold = true }); hi("TelescopeResultsTitle", { fg = c.void, bg = c.neon2, bold = true })
hi("TelescopeSelection", { fg = c.fg, bg = c.panel4, bold = true }); hi("TelescopeMatching", { fg = c.fuchsia, bold = true })

hi("NeoTreeNormal", { fg = c.fg, bg = c.panel }); hi("NeoTreeNormalNC", { fg = c.muted, bg = c.panel }); hi("NeoTreeDirectoryIcon", { fg = c.neon }); hi("NeoTreeDirectoryName", { fg = c.fuchsia }); hi("NeoTreeFileName", { fg = c.fg2 })
hi("NeoTreeGitAdded", { fg = c.green }); hi("NeoTreeGitModified", { fg = c.yellow }); hi("NeoTreeGitDeleted", { fg = c.red }); hi("NvimTreeNormal", { fg = c.fg, bg = c.panel }); hi("NvimTreeFolderIcon", { fg = c.neon }); hi("NvimTreeFolderName", { fg = c.fuchsia }); hi("NvimTreeOpenedFolderName", { fg = c.neon2, bold = true }); hi("NvimTreeGitNewIcon", { fg = c.green }); hi("NvimTreeGitDirtyIcon", { fg = c.yellow }); hi("NvimTreeGitDeletedIcon", { fg = c.red })
hi("WhichKey", { fg = c.neon }); hi("WhichKeyGroup", { fg = c.neon2 }); hi("WhichKeyDesc", { fg = c.fg2 }); hi("WhichKeySeparator", { fg = c.border }); hi("WhichKeyFloat", { bg = c.panel }); hi("WhichKeyValue", { fg = c.muted })
hi("CmpItemAbbr", { fg = c.fg }); hi("CmpItemAbbrMatch", { fg = c.neon, bold = true }); hi("CmpItemAbbrMatchFuzzy", { fg = c.neon2, bold = true }); hi("CmpItemKind", { fg = c.fuchsia }); hi("CmpItemMenu", { fg = c.muted })

hi("markdownHeadingDelimiter", { fg = c.neon, bold = true }); hi("markdownH1", { fg = c.neon, bold = true }); hi("markdownH2", { fg = c.neon2, bold = true }); hi("markdownCode", { fg = c.mint }); hi("markdownLinkText", { fg = c.fuchsia, underline = true })
hi("SpellBad", { undercurl = true, sp = c.red }); hi("SpellCap", { undercurl = true, sp = c.yellow }); hi("SpellLocal", { undercurl = true, sp = c.fuchsia }); hi("SpellRare", { undercurl = true, sp = c.neon })

vim.g.terminal_color_0 = c.void; vim.g.terminal_color_1 = c.red; vim.g.terminal_color_2 = c.green; vim.g.terminal_color_3 = c.yellow; vim.g.terminal_color_4 = c.blue; vim.g.terminal_color_5 = c.neon2; vim.g.terminal_color_6 = c.fuchsia; vim.g.terminal_color_7 = c.fg2
vim.g.terminal_color_8 = c.dim; vim.g.terminal_color_9 = c.red; vim.g.terminal_color_10 = c.green; vim.g.terminal_color_11 = c.yellow; vim.g.terminal_color_12 = c.fuchsia; vim.g.terminal_color_13 = c.neon; vim.g.terminal_color_14 = c.fuchsia; vim.g.terminal_color_15 = c.fg
