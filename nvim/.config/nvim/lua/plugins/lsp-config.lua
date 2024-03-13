return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			-- auto_install = true,
			ensure_installed = {
				"bashls",
				"clojure_lsp",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"gopls",
				"jsonls",
				"lua_ls",
				"marksman",
				"pyright",
				"rust_analyzer",
				"svelte",
				-- "sqls",
				"tailwindcss",
				"terraformls",
				"tsserver",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local handlers = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(
					vim.lsp.diagnostic.on_publish_diagnostics,
					{ severity_sort = true, update_in_insert = true, underline = true, virtual_text = false }
				),
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
			}

			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "<leader>ld", function()
					vim.lsp.buf.declaration()
				end, opts)
				vim.keymap.set("n", "<leader>lt", function()
					vim.lsp.buf.type_definition()
				end, opts)
				vim.keymap.set("n", "<leader>lh", function()
					vim.lsp.buf.signature_help()
				end, opts)
				vim.keymap.set("n", "<leader>lq", function()
					vim.diagnostics.setloclist()
				end, opts)
				vim.keymap.set("n", "<leader>lf", function()
					vim.lsp.buf.format()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
				vim.keymap.set("v", "<leader>rc<leader>rca", function()
					vim.lsp.buf.range_code_action()
				end, opts)
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			local util = require("lspconfig/util")

			local before_init = function(params)
				params.workDoneToken = "1"
				return nil
			end

			-- clojure
			lspconfig.clojure_lsp.setup({
				on_attach = on_attach,
				handlers = handlers,
				before_init = before_init,
				capabilities = capabilities,
			})

			-- docker
			lspconfig.dockerls.setup({
				on_attach = on_attach,
				handlers = handlers,
				before_init = before_init,
				capabilities = capabilities,
			})

			-- docker compose
			lspconfig.docker_compose_language_service.setup({
				on_attach = on_attach,
				handlers = handlers,
				before_init = before_init,
				capabilities = capabilities,
			})

			-- go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "gopls" },
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = util.root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			})

			-- html
			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			-- bash
			lspconfig.bashls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- marksman
			lspconfig.marksman.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- python
			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- sql
			-- lspconfig.sqls.setup({
			-- 	on_attach = function(client, bufnr)
			-- 		require("sqls").on_attach(client, bufnr)
			-- 	end,
			-- })

			-- svelte
			lspconfig.svelte.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- tailwind
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- terraform
			lspconfig.terraformls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- ts, js
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

-- return {
-- 	{
-- 		"VonHeikemen/lsp-zero.nvim",
-- 		branch = "v3.x",
-- 		dependencies = {
-- 			"williamboman/mason.nvim",
-- 			"williamboman/mason-lspconfig.nvim",
--
-- 			-- LSP Support
-- 			"neovim/nvim-lspconfig",
-- 			-- Autocompletion
-- 			"hrsh7th/nvim-cmp",
-- 			"hrsh7th/cmp-nvim-lsp",
-- 			"hrsh7th/cmp-nvim-lsp-signature-help",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"L3MON4D3/LuaSnip",
-- 		},
-- 		config = function()
-- 			local lsp_zero = require("lsp-zero")
--
-- 			lsp_zero.on_attach(function(_, bufnr)
-- 				local opts = { buffer = bufnr, remap = false }
--
-- 				vim.keymap.set("n", "gd", function()
-- 					vim.lsp.buf.definition()
-- 				end, opts)
-- 				vim.keymap.set("n", "K", function()
-- 					vim.lsp.buf.hover()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vws", function()
-- 					vim.lsp.buf.workspace_symbol()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vd", function()
-- 					vim.diagnostic.open_float()
-- 				end, opts)
-- 				vim.keymap.set("n", "[d", function()
-- 					vim.diagnostic.goto_next()
-- 				end, opts)
-- 				vim.keymap.set("n", "]d", function()
-- 					vim.diagnostic.goto_prev()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vca", function()
-- 					vim.lsp.buf.code_action()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vrr", function()
-- 					vim.lsp.buf.references()
-- 				end, opts)
-- 				vim.keymap.set("n", "<leader>vrn", function()
-- 					vim.lsp.buf.rename()
-- 				end, opts)
-- 				vim.keymap.set("i", "<C-h>", function()
-- 					vim.lsp.buf.signature_help()
-- 				end, opts)
--
-- 				-- see :help lsp-zero-keybindings
-- 				-- to learn the available actions
-- 				lsp_zero.default_keymaps({ buffer = bufnr })
-- 				-- lsp_zero.buffer_autoformat()
-- 			end)
--
-- 			lsp_zero.set_sign_icons({
-- 				error = "✘",
-- 				warn = "▲",
-- 				hint = "⚑",
-- 				info = "»",
-- 			})
--
-- 			local has_words_before = function()
-- 				unpack = unpack or table.unpack
-- 				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 				return col ~= 0
-- 					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- 			end
--
-- 			local luasnip = require("luasnip")
-- 			local cmp = require("cmp")
--
-- 			cmp.setup({
-- 				view = {
-- 					entries = "native",
-- 				},
-- 				snippet = {
-- 					expand = function(args)
-- 						luasnip.lsp_expand(args.body)
-- 					end,
-- 				},
-- 				mapping = cmp.mapping.preset.insert({
-- 					["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 					["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 					["<C-Space>"] = cmp.mapping.complete(),
-- 					["<CR>"] = cmp.mapping.confirm({
-- 						select = true,
-- 						behavior = cmp.ConfirmBehavior.Replace,
-- 					}),
-- 					["<Tab>"] = cmp.mapping(function(fallback)
-- 						if cmp.visible() then
-- 							cmp.select_next_item()
-- 						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
-- 						-- that way you will only jump inside the snippet region
-- 						elseif luasnip.expand_or_jumpable() then
-- 							luasnip.expand_or_jump()
-- 						elseif has_words_before() then
-- 							cmp.complete()
-- 						else
-- 							fallback()
-- 						end
-- 					end, { "i", "s" }),
--
-- 					["<S-Tab>"] = cmp.mapping(function(fallback)
-- 						if cmp.visible() then
-- 							cmp.select_prev_item()
-- 						elseif luasnip.jumpable(-1) then
-- 							luasnip.jump(-1)
-- 						else
-- 							fallback()
-- 						end
-- 					end, { "i", "s" }),
-- 				}),
-- 				sources = {
-- 					{ name = "nvim_lsp" },
-- 					{ name = "luasnip" },
-- 					{ name = "neorg" },
-- 				},
-- 			})
--
-- 			require("mason").setup({})
--
-- 			require("mason-lspconfig").setup({
-- 				-- Replace the language servers listed here
-- 				-- with the ones you want to install
-- 				ensure_installed = {
-- 					"clojure_lsp",
-- 					"cssls",
-- 					"eslint",
-- 					"gopls",
-- 					"jsonls",
-- 					"lua_ls",
-- 					"marksman",
-- 					"pyright",
-- 					"rust_analyzer",
-- 					"tailwindcss",
-- 					"tsserver",
-- 				},
-- 				handlers = {
-- 					lsp_zero.default_setup,
-- 					-- Fix Undefined global 'vim'
-- 					["lua_ls"] = function()
-- 						local lspconfig = require("lspconfig")
-- 						lspconfig.lua_ls.setup({
-- 							settings = {
-- 								Lua = {
-- 									diagnostics = {
-- 										globals = { "vim" },
-- 									},
-- 								},
-- 							},
-- 						})
-- 					end,
-- 					["gopls"] = function()
-- 						local lspconfig = require("lspconfig")
-- 						local util = require("lspconfig/util")
-- 						lspconfig.gopls.setup({
-- 							cmd = { "gopls" },
-- 							filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- 							root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- 							settings = {
-- 								gopls = {
-- 									completeUnimported = true,
-- 									usePlaceholders = true,
-- 									analyses = {
-- 										unusedparams = true,
-- 									},
-- 								},
-- 							},
-- 						})
-- 					end,
-- 				},
-- 			})
-- 			local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- 			capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 			require("lspconfig")["tsserver"].setup({
-- 				capabilities = capabilities,
-- 			})
-- 		end,
-- 	},
-- }
--
