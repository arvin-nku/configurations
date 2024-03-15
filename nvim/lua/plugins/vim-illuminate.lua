-- Plugin highlights all of the words matching each other in a file
return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		-- default
		require("illuminate").configure({})
	end,
}
