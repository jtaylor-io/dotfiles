return {
	"nvim-orgmode/orgmode",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter" },
	},
	event = "VeryLazy",
	config = function()
		-- Load treesitter grammar for org
		require("orgmode").setup_ts_grammar()

		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/Dropbox/org/**/*",
			org_default_notes_file = "~/Dropbox/org/refile.org",
		})
	end,
}
