-- Plugin highlights all of the words matching each other in a file
return {
  "RRethy/vim-illuminate",
  lazy = false,
  config = function()
    -- default configuration
  require('illuminate').configure({})
  end
}
