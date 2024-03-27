return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/neotest-python",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
			},
		})

		vim.keymap.set("n", "<Leader>ntp", "<Cmd>lua require('neotest').output_panel.toggle()<CR>", { noremap = false })
		vim.keymap.set(
			"n",
			"<Leader>nto",
			"<Cmd>lua require('neotest').output.open({ enter = true })<CR>",
			{ noremap = false }
		)
		vim.keymap.set(
			"n",
			"<Leader>ntw",
			"<Cmd>lua require('neotest').watch.watch(vim.fn.expand('%'))<CR>",
			{ noremap = false }
		)
		vim.keymap.set("n", "<Leader>nts", "<Cmd>lua require('neotest').summary.toggle()<CR>", { noremap = false })
	end,
}
