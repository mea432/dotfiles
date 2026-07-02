-- ~/.config/nvim/lua/plugins/latex-no-inlay-hints.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.inlay_hints = opts.inlay_hints or {}
      opts.inlay_hints.exclude = opts.inlay_hints.exclude or {}
      vim.list_extend(opts.inlay_hints.exclude, { "tex", "plaintex" })
    end,
  },
}
