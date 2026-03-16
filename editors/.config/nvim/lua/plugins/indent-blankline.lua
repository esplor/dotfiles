return {
  { -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- See `:help ibl`
    main = "ibl",
    -- Disable in TTY: the box-drawing characters render as '#' on the linux console
    enabled = vim.env.TERM ~= "linux",
    opts = {},
  },
}
