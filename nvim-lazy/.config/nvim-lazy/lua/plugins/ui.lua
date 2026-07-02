return {
  -- 1. Disable the top bufferline
  { "akinsho/bufferline.nvim", enabled = false },

  -- 2. Modify the default Lualine sections
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Remove the 'diagnostics' and 'path' components from the center (lualine_c)
      -- and replace them with our buffer list.
      opts.sections.lualine_c = {
        {
          "buffers",
          component_separators = { left = "|", right = "" },
          section_separators = { left = "", right = "" },
          symbols = { modified = " ●", alternate_file = "" },
        },
      }

      -- LazyVim defaults often add 'trouble' or 'navic' (the function/location names)
      -- to lualine_c dynamically. We ensure it's empty of those things:
      vim.g.trouble_lualine = false
    end,
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
    opts = {
      -- This disables the movement animation
      animate = {
        enabled = false,
      },
      colors = {
        "#89a5d1",
      },
    },
  },
}
