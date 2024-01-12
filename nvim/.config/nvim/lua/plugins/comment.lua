-- TODO: look into https://github.com/tpope/vim-commentary
return {
	"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
	config = function()
		require("Comment").setup()
	end,
}

