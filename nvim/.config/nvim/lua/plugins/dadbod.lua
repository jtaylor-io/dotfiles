return {
	"tpope/vim-dadbod",
	"kristijanhusak/vim-dadbod-ui",
	"kristijanhusak/vim-dadbod-completion",
	-- Database
	{
		"tpope/vim-dadbod",
		config = function()
			require("config.dadbod").setup()
		end,
	},
}
