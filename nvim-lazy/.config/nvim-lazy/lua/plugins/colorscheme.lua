return {
  "folke/tokyonight.nvim",
  opts = {
    -- Make neovim transparent
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },

    on_highlights = function(hl, colors)
      -- Make comments brighter
      hl.Comment = { fg = "#999999", italic = true }

      -- Make line numbers brighter
      hl.LineNrAbove = { fg = "#999999", italic = false }
      hl.LineNrBelow = { fg = "#999999", italic = false }
      hl.LineNr = { fg = "#ffffff", bold = true }
      hl.CursorLineNr = { fg = "#ffffff", bold = true }

      -- Make top and bottom bars transparent
      hl.StatusLine = { bg = "NONE", fg = colors.fg }
      hl.StatusLineNC = { bg = "NONE", fg = colors.comment }
      hl.TabLine = { bg = "NONE", fg = colors.comment }
      hl.TabLineFill = { bg = "NONE" }
      hl.TabLineSel = { bg = "NONE", fg = colors.fg, bold = true }
      hl.MsgArea = { bg = "NONE", fg = colors.fg }
      hl.MsgSeparator = { bg = "NONE", fg = colors.fg }
      hl.WinBar = { bg = "NONE", fg = colors.fg }
      hl.WinBarNC = { bg = "NONE", fg = colors.comment }

      -- hl.WinSeparator = { fg = colors.border_highlight, bold = true }
      -- hl.VertSplit = { fg = colors.border_highlight }
    end,
  },
}
