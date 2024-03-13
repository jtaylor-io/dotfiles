return {
	{
		"nvim-lua/popup.nvim",
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
	},
	{
		"ThePrimeagen/git-worktree.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {
			{
				"nvim-telescope/telescope-ui-select.nvim",
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"ThePrimeagen/git-worktree.nvim",
			},
		},

		defaults = {
			file_ignore_patterns = { "node_modules" },
		},

		config = function()
			local telescope = require("telescope")
			telescope.load_extension("ui-select")
			telescope.load_extension("harpoon")
			require("telescope").load_extension("git_worktree")
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					file_ignore_patterns = { "node_modules" },
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--iglob",
						"!.git",
						"--hidden",
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
						},
					},
				},
				pickers = { find_files = { find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" } } },
			})
			-- Enable telescope fzf native, if installed
			pcall(telescope.load_extension, "fzf")

			local builtin = require("telescope.builtin")
			-- See `:help telescope.builtin`
			vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer]" })

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
			vim.keymap.set(
				"n",
				"<leader>fh",
				":lua require'telescope.builtin'.find_files({ hidden = true })<CR>",
				{ desc = "[F]iles [H]idden" }
			)
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]iles[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]iles[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]iles[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]iles[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind existing [B]uffers" })
			vim.keymap.set("n", "<leader>fS", builtin.git_status, { desc = "[F]ind git [S]tatus" })
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[F]ind [R]eferences" })
			vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "[F]ind [I]mplementations" })
			vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "[F]ind Harpoon [M]arks" })
			vim.keymap.set(
				"n",
				"<Leader>sr",
				"<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>",
				{ silent = true }
			)
			vim.keymap.set(
				"n",
				"<Leader>sR",
				"<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>",
				{ silent = true }
			)
			vim.keymap.set(
				"n",
				"<Leader>sn",
				"<CMD>lua require('telescope').extensions.notify.notify()<CR>",
				{ silent = true }
			)
		end,
	},
}
