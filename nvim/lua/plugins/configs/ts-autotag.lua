return {
  "windwp/nvim-ts-autotag",
  lazy = false,
  config = function()
    require('nvim-ts-autotag').setup()
  end,
  after = 'nvim-treesitter' -- Ensure it loads after nvim-treesitter
}

