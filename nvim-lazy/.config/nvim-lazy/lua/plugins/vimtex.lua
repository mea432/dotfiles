-- Configuration for vimtex
return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "skim"

    vim.g.vimtex_view_skim_sync = 1 -- forward-search after successful compile
    vim.g.vimtex_view_skim_reading_bar = 0 -- highlight current PDF line
    vim.g.vimtex_view_skim_no_select = 1 -- don't select text in Skim

    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1

    vim.g.vimtex_format_enabled = 1
  end,
}
