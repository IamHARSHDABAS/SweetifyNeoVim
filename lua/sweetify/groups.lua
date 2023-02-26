---@class Highlight
---@field fg string color name or "#RRGGBB"
---@field foreground string same fg, color name or "#RRGGBB"
---@field bg string color name or "#RRGGBB"
---@field background string same bg, color name or "#RRGGBB"
---@field sp string color name or "#RRGGBB"
---@field special string same sg, color name or "#RRGGBB"
---@field blend integer value between 0 and 100
---@field bold boolean
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |:hi-link|.
---@field default string Don't override existing definition |:hi-default|
---@field ctermfg integer Sets foreground of cterm color |highlight-ctermfg|
---@field ctermbg integer Sets background of cterm color |highlight-ctermbg|
---@field cterm table cterm attribute map, like |highlight-args|.

---setup highlight groups
---@param configs DefaultConfig
---@return table<string, Highlight>
---@nodiscard
local function setup(configs)
   local colors = configs.colors
   local endOfBuffer = {
      fg = configs.show_end_of_buffer and colors.selection or colors.bg,
   }

   return {
      Normal = { fg = colors.fg, bg = colors.bg, },
      NormalFloat = { fg = colors.fg, bg = colors.bg, },
      Comment = { fg = colors.comment, italic = configs.italic_comment, },
      Constant = { fg = colors.yellow, },
      String = { fg = colors.yellow, },
      Character = { fg = colors.green, },
      Number = { fg = colors.green, },
      Boolean = { fg = colors.cyan, },
      Float = { fg = colors.green, },
      FloatBorder = { fg = colors.white, },
      Operator = { fg = colors.purple, },
      Keyword = { fg = colors.cyan, },
      Keywords = { fg = colors.cyan, },
      Identifier = { fg = colors.cyan, },
      Function = { fg = colors.yellow, },
      Statement = { fg = colors.purple, },
      Conditional = { fg = colors.white, },
      Repeat = { fg = colors.white, },
      Label = { fg = colors.cyan, },
      Exception = { fg = colors.purple, },
      PreProc = { fg = colors.yellow, },
      Include = { fg = colors.purple, },
      Define = { fg = colors.purple, },
      Title = { fg = colors.cyan, },
      Macro = { fg = colors.purple, },
      PreCondit = { fg = colors.cyan, },
      Type = { fg = colors.cyan, },
      StorageClass = { fg = colors.white, },
      Structure = { fg = colors.yellow, },
      TypeDef = { fg = colors.yellow, },
      Special = { fg = colors.green, italic = true },
      SpecialComment = { fg = colors.comment, italic = true, },
      Error = { fg = colors.red, },
      Todo = { fg = colors.purple, bold = true, italic = true, },
      Underlined = { fg = colors.cyan, underline = true, },

      Cursor = { reverse = true, },
      CursorLineNr = { fg = colors.fg, bold = true, },

      SignColumn = { bg = colors.bg, },

      Conceal = { fg = colors.comment, },
      CursorColumn = { bg = colors.black, },
      CursorLine = { bg = colors.selection, },
      ColorColumn = { bg = colors.selection, },

      StatusLine = { fg = colors.white, bg = colors.black, },
      StatusLineNC = { fg = colors.comment, },
      StatusLineTerm = { fg = colors.white, bg = colors.black, },
      StatusLineTermNC = { fg = colors.comment, },

      Directory = { fg = colors.cyan, },
      DiffAdd = { fg = colors.bg, bg = colors.green, },
      DiffChange = { fg = colors.green, },
      DiffDelete = { fg = colors.red, },
      DiffText = { fg = colors.comment, },

      ErrorMsg = { fg = colors.red, },
      VertSplit = { fg = colors.black, },
      Folded = { fg = colors.comment, },
      FoldColumn = {},
      Search = { fg = colors.black, bg = colors.green, },
      IncSearch = { fg = colors.green, bg = colors.comment, },
      LineNr = { fg = colors.comment, },
      MatchParen = { fg = colors.fg, underline = true, },
      NonText = { fg = colors.selection, },
      Pmenu = { fg = colors.white, bg = colors.bg, },
      PmenuSel = { fg = colors.white, bg = colors.selection, },
      PmenuSbar = { bg = colors.bg, },
      PmenuThumb = { bg = colors.selection, },

      Question = { fg = colors.purple, },
      QuickFixLine = { fg = colors.black, bg = colors.yellow, },
      SpecialKey = { fg = colors.selection, },

      SpellBad = { fg = colors.red, underline = true, },
      SpellCap = { fg = colors.yellow, },
      SpellLocal = { fg = colors.yellow, },
      SpellRare = { fg = colors.yellow, },

      TabLine = { fg = colors.comment, },
      TabLineSel = { fg = colors.white, },
      TabLineFill = { bg = colors.bg, },
      Terminal = { fg = colors.white, bg = colors.black, },
      Visual = { bg = colors.selection, },
      VisualNOS = { fg = colors.selection, },
      WarningMsg = { fg = colors.yellow, },
      WildMenu = { fg = colors.black, bg = colors.white, },

      EndOfBuffer = endOfBuffer,

      -- TreeSitter
      ['@error'] = { fg = colors.red, },
      ['@punctuation.delimiter'] = { fg = colors.fg, },
      ['@punctuation.bracket'] = { fg = colors.fg, },
      ['@punctuation.special'] = { fg = colors.cyan, },

      ['@constant'] = { fg = colors.purple, },
      ['@constant.builtin'] = { fg = colors.purple, },
      ['@symbol'] = { fg = colors.purple, },

      ['@constant.macro'] = { fg = colors.cyan, },
      ['@string.regex'] = { fg = colors.red, },
      ['@string'] = { fg = colors.yellow, },
      ['@string.escape'] = { fg = colors.cyan, },
      ['@character'] = { fg = colors.green, },
      ['@number'] = { fg = colors.purple, },
      ['@boolean'] = { fg = colors.purple, },
      ['@float'] = { fg = colors.green, },
      ['@annotation'] = { fg = colors.yellow, },
      ['@attribute'] = { fg = colors.cyan, },
      ['@namespace'] = { fg = colors.green, },

      ['@function.builtin'] = { fg = colors.cyan, },
      ['@function'] = { fg = colors.green, },
      ['@function.macro'] = { fg = colors.green, },
      ['@parameter'] = { fg = colors.green, },
      ['@parameter.reference'] = { fg = colors.green, },
      ['@method'] = { fg = colors.green, },
      ['@field'] = { fg = colors.green, },
      ['@property'] = { fg = colors.purple, },
      ['@constructor'] = { fg = colors.cyan, },

      ['@conditional'] = { fg = colors.white, },
      ['@repeat'] = { fg = colors.white, },
      ['@label'] = { fg = colors.cyan, },

      ['@keyword'] = { fg = colors.white, },
      ['@keyword.function'] = { fg = colors.cyan, },
      ['@keyword.operator'] = { fg = colors.white, },
      ['@operator'] = { fg = colors.white, },
      ['@exception'] = { fg = colors.purple, },
      ['@type'] = { fg = colors.cyan, },
      ['@type.builtin'] = { fg = colors.cyan, italic = true, },
      ['@type.qualifier'] = { fg = colors.white, },
      ['@structure'] = { fg = colors.purple, },
      ['@include'] = { fg = colors.white, },

      ['@variable'] = { fg = colors.fg, },
      ['@variable.builtin'] = { fg = colors.purple, },

      ['@text'] = { fg = colors.green, },
      ['@text.strong'] = { fg = colors.green, bold = true, }, -- bold
      ['@text.emphasis'] = { fg = colors.yellow, italic = true, }, -- italic
      ['@text.underline'] = { fg = colors.green, },
      ['@text.title'] = { fg = colors.white, bold = true, }, -- title
      ['@text.literal'] = { fg = colors.yellow, }, -- inline code
      ['@text.uri'] = { fg = colors.yellow, italic = true, }, -- urls
      ['@text.reference'] = { fg = colors.green, bold = true, },

      ['@tag'] = { fg = colors.cyan, },
      ['@tag.attribute'] = { fg = colors.green, },
      ['@tag.delimiter'] = { fg = colors.cyan, },

        -- Semantic 
      ['@class'] = { fg = colors.cyan },
      ['@struct'] = { fg = colors.cyan },
      ['@enum'] = { fg = colors.cyan },
      ['@enumMember'] = { fg = colors.purple },
      ['@event'] = { fg = colors.cyan },
      ['@interface'] = { fg = colors.cyan },
      ['@modifier'] = { fg = colors.cyan },
      ['@regexp'] = { fg = colors.yellow },
      ['@typeParameter'] = { fg = colors.cyan },
      ['@decorator'] = { fg = colors.cyan },

      -- HTML
      htmlArg = { fg = colors.green, },
      htmlBold = { fg = colors.yellow, bold = true, },
      htmlEndTag = { fg = colors.cyan, },
      htmlH1 = { fg = colors.white, },
      htmlH2 = { fg = colors.white, },
      htmlH3 = { fg = colors.white, },
      htmlH4 = { fg = colors.white, },
      htmlH5 = { fg = colors.white, },
      htmlH6 = { fg = colors.white, },
      htmlItalic = { fg = colors.purple, italic = true, },
      htmlLink = { fg = colors.purple, underline = true, },
      htmlSpecialChar = { fg = colors.yellow, },
      htmlSpecialTagName = { fg = colors.cyan, },
      htmlTag = { fg = colors.cyan, },
      htmlTagN = { fg = colors.cyan, },
      htmlTagName = { fg = colors.cyan, },
      htmlTitle = { fg = colors.white, },

      -- Markdown
      markdownBlockquote = { fg = colors.yellow, italic = true, },
      markdownBold = { fg = colors.green, bold = true, },
      markdownCode = { fg = colors.green, },
      markdownCodeBlock = { fg = colors.green, },
      markdownCodeDelimiter = { fg = colors.red, },
      markdownH1 = { fg = colors.white, bold = true, },
      markdownH2 = { fg = colors.white, bold = true, },
      markdownH3 = { fg = colors.white, bold = true, },
      markdownH4 = { fg = colors.white, bold = true, },
      markdownH5 = { fg = colors.white, bold = true, },
      markdownH6 = { fg = colors.white, bold = true, },
      markdownHeadingDelimiter = { fg = colors.red, },
      markdownHeadingRule = { fg = colors.comment, },
      markdownId = { fg = colors.purple, },
      markdownIdDeclaration = { fg = colors.cyan, },
      markdownIdDelimiter = { fg = colors.purple, },
      markdownItalic = { fg = colors.yellow, italic = true, },
      markdownLinkDelimiter = { fg = colors.purple, },
      markdownLinkText = { fg = colors.white, },
      markdownListMarker = { fg = colors.cyan, },
      markdownOrderedListMarker = { fg = colors.red, },
      markdownRule = { fg = colors.comment, },

      --  Diff
      diffAdded = { fg = colors.green, },
      diffRemoved = { fg = colors.red, },
      diffFileId = { fg = colors.yellow, bold = true, reverse = true, },
      diffFile = { fg = colors.selection, },
      diffNewFile = { fg = colors.green, },
      diffOldFile = { fg = colors.red, },

      debugPc = { bg = colors.cyan, },
      debugBreakpoint = { fg = colors.red, reverse = true, },

      -- Git Signs
      GitSignsAdd = { fg = colors.green, },
      GitSignsChange = { fg = colors.cyan, },
      GitSignsDelete = { fg = colors.red, },
      GitSignsAddLn = { fg = colors.black, bg = colors.green, },
      GitSignsChangeLn = { fg = colors.black, bg = colors.cyan, },
      GitSignsDeleteLn = { fg = colors.black, bg = colors.red, },
      GitSignsCurrentLineBlame = { fg = colors.white, },

      -- Telescope
      TelescopePromptBorder = { fg = colors.comment, },
      TelescopeResultsBorder = { fg = colors.comment, },
      TelescopePreviewBorder = { fg = colors.comment, },
      TelescopeSelection = { fg = colors.white, bg = colors.selection, },
      TelescopeMultiSelection = { fg = colors.purple, bg = colors.selection, },
      TelescopeNormal = { fg = colors.fg, bg = colors.bg, },
      TelescopeMatching = { fg = colors.green, },
      TelescopePromptPrefix = { fg = colors.purple, },

      -- NvimTree
      NvimTreeNormal = { fg = colors.fg, bg = colors.bg, },
      NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg, },
      NvimTreeRootFolder = { fg = colors.fg, bold = true, },
      NvimTreeGitDirty = { fg = colors.yellow, },
      NvimTreeGitNew = { fg = colors.green, },
      NvimTreeImageFile = { fg = colors.white, },
      NvimTreeFolderIcon = { fg = colors.purple, },
      NvimTreeIndentMarker = { fg = colors.selection, },
      NvimTreeEmptyFolderName = { fg = colors.comment, },
      NvimTreeFolderName = { fg = colors.fg, },
      NvimTreeSpecialFile = { fg = colors.white, underline = true, },
      NvimTreeOpenedFolderName = { fg = colors.fg, },
      NvimTreeCursorLine = { bg = colors.selection, },
      NvimTreeIn = { bg = colors.selection, },

      NvimTreeEndOfBuffer = endOfBuffer,

      -- NeoTree
      NeoTreeNormal = { fg = colors.fg, bg = colors.bg, },
      NeoTreeNormalNC = { fg = colors.fg, bg = colors.bg, },
      NeoTreeDirectoryName = { fg = colors.fg },
      NeoTreeGitUnstaged = { fg = colors.purple },
      NeoTreeGitModified = { fg = colors.purple },
      NeoTreeGitUntracked = { fg = colors.green },
      NeoTreeDirectoryIcon = { fg = colors.purple },
      NeoTreeIndentMarker = { fg = colors.selection },
      NeoTreeDotfile = { fg = colors.comment },

      -- Bufferline
      BufferLineIndicatorSelected = { fg = colors.purple, },
      BufferLineFill = { bg = colors.black, },
      BufferLineBufferSelected = { bg = colors.bg, },

      -- LSP
      DiagnosticError = { fg = colors.red, },
      DiagnosticWarn = { fg = colors.yellow, },
      DiagnosticInfo = { fg = colors.cyan, },
      DiagnosticHint = { fg = colors.cyan, },
      DiagnosticUnderlineError = { undercurl = true, sp = colors.red, },
      DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow, },
      DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan, },
      DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan, },
      DiagnosticSignError = { fg = colors.red, },
      DiagnosticSignWarn = { fg = colors.yellow, },
      DiagnosticSignInfo = { fg = colors.cyan, },
      DiagnosticSignHint = { fg = colors.cyan, },
      DiagnosticFloatingError = { fg = colors.red, },
      DiagnosticFloatingWarn = { fg = colors.yellow, },
      DiagnosticFloatingInfo = { fg = colors.cyan, },
      DiagnosticFloatingHint = { fg = colors.cyan, },
      DiagnosticVirtualTextError = { fg = colors.red, },
      DiagnosticVirtualTextWarn = { fg = colors.yellow, },
      DiagnosticVirtualTextInfo = { fg = colors.cyan, },
      DiagnosticVirtualTextHint = { fg = colors.cyan, },

      LspDiagnosticsDefaultError = { fg = colors.red, },
      LspDiagnosticsDefaultWarning = { fg = colors.yellow, },
      LspDiagnosticsDefaultInformation = { fg = colors.cyan, },
      LspDiagnosticsDefaultHint = { fg = colors.cyan, },
      LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true, },
      LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true, },
      LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true, },
      LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true, },
      LspReferenceText = { fg = colors.green, },
      LspReferenceRead = { fg = colors.green, },
      LspReferenceWrite = { fg = colors.green, },
      LspCodeLens = { fg = colors.cyan, },

      --LSP Saga
      LspFloatWinNormal = { fg = colors.fg, },
      LspFloatWinBorder = { fg = colors.comment, },
      LspSagaHoverBorder = { fg = colors.comment, },
      LspSagaSignatureHelpBorder = { fg = colors.comment, },
      LspSagaCodeActionBorder = { fg = colors.comment, },
      LspSagaDefPreviewBorder = { fg = colors.comment, },
      LspLinesDiagBorder = { fg = colors.comment, },
      LspSagaRenameBorder = { fg = colors.comment, },
      LspSagaBorderTitle = { fg = colors.bg, },
      LSPSagaDiagnosticTruncateLine = { fg = colors.comment, },
      LspSagaDiagnosticBorder = { fg = colors.comment, },
      LspSagaShTruncateLine = { fg = colors.comment, },
      LspSagaDocTruncateLine = { fg = colors.comment, },
      LspSagaLspFinderBorder = { fg = colors.comment, },

      -- IndentBlankLine
      IndentBlanklineContextChar = { fg = colors.red, nocombine = true, },

      -- Nvim compe
      CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg, },
      CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.bg, },

      --barbar
      BufferCurrentTarget = { fg = colors.red, },
      BufferVisibleTarget = { fg = colors.red, },
      BufferInactiveTarget = { fg = colors.red, },

      -- Compe
      CompeDocumentation = { link = "Pmenu" },
      CompeDocumentationBorder = { link = "Pmenu" },

      -- Cmp
      CmpItemKind = { link = "Pmenu" },
      CmpItemAbbr = { link = "Pmenu" },
      CmpItemKindMethod = { link = "@method" },
      CmpItemKindText = { link = "@text" },
      CmpItemKindFunction = { link = "@function" },
      CmpItemKindConstructor = { link = "@type" },
      CmpItemKindVariable = { link = "@variable" },
      CmpItemKindClass = { link = "@type" },
      CmpItemKindInterface = { link = "@type" },
      CmpItemKindModule = { link = "@namespace" },
      CmpItemKindProperty = { link = "@property" },
      CmpItemKindOperator = { link = "@operator" },
      CmpItemKindReference = { link = "@parameter.reference" },
      CmpItemKindUnit = { link = "@field" },
      CmpItemKindValue = { link = "@field" },
      CmpItemKindField = { link = "@field" },
      CmpItemKindEnum = { link = "@field" },
      CmpItemKindKeyword = { link = "@keyword" },
      CmpItemKindSnippet = { link = "@text" },
      CmpItemKindColor = { link = "DevIconCss" },
      CmpItemKindFile = { link = "TSURI" },
      CmpItemKindFolder = { link = "TSURI" },
      CmpItemKindEvent = { link = "@constant" },
      CmpItemKindEnumMember = { link = "@field" },
      CmpItemKindConstant = { link = "@constant" },
      CmpItemKindStruct = { link = "@structure" },
      CmpItemKindTypeParameter = { link = "@parameter" },

      -- navic
      NavicIconsFile = { link = "CmpItemKindFile" },
      NavicIconsModule = { link = "CmpItemKindModule" },
      NavicIconsNamespace = { link = "CmpItemKindModule" },
      NavicIconsPackage = { link = "CmpItemKindModule" },
      NavicIconsClass = { link = "CmpItemKindClass" },
      NavicIconsMethod = { link = "CmpItemKindMethod" },
      NavicIconsProperty = { link = "CmpItemKindProperty" },
      NavicIconsField = { link = "CmpItemKindField" },
      NavicIconsConstructor = { link = "CmpItemKindConstructor" },
      NavicIconsEnum = { link = "CmpItemKindEnum" },
      NavicIconsInterface = { link = "CmpItemKindInterface" },
      NavicIconsFunction = { link = "CmpItemKindFunction" },
      NavicIconsVariable = { link = "CmpItemKindVariable" },
      NavicIconsConstant = { link = "CmpItemKindConstant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "CmpItemKindClass" },
      NavicIconsObject = { link = "CmpItemKindClass" },
      NavicIconsKey = { link = "CmpItemKindKeyword" },
      NavicIconsKeyword = { link = "CmpItemKindKeyword" },
      NavicIconsNull = { fg = "blue" },
      NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
      NavicIconsStruct = { link = "CmpItemKindStruct" },
      NavicIconsEvent = { link = "CmpItemKindEvent" },
      NavicIconsOperator = { link = "CmpItemKindOperator" },
      NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
      NavicText = { fg = 'gray' },
      NavicSeparator = { fg = 'gray' },


      -- TS rainbow colors
      rainbowcol1 = { fg = colors.red, },
      rainbowcol2 = { fg = colors.green, },
      rainbowcol3 = { fg = colors.yellow, },
      rainbowcol4 = { fg = colors.purple, },
      rainbowcol5 = { fg = colors.white, },
      rainbowcol6 = { fg = colors.cyan, },
      rainbowcol7 = { fg = colors.white, },
   }
end

return {
   setup = setup,
}
