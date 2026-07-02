return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      -- Enable the image plugin component
      image = {
        enabled = true,
        doc = {
          -- Automatically render inline images inside markdown files
          inline = true,
          -- Only displays the image when your cursor moves over the link
          only_render_image_at_cursor = true,
        },
      },
    },
  },
}
