return {
	{
		"julienvincent/nvim-paredit",
		lazy = true,
		ft = { "clojure" },
		config = function()
			local paredit = require("nvim-paredit")
			return paredit.setup({
				keys = {
					["<localleader>oo"] = { paredit.api.raise_form, "Raise form" },
				},
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			local surround = require("nvim-surround")
			return surround.setup()
		end,
	},
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
}
