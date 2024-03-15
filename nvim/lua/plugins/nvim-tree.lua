return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
				adaptive_size = true,
				side = "right",
			},
			renderer = {
				highlight_diagnostics = false,
			},
		})
	end,
}
