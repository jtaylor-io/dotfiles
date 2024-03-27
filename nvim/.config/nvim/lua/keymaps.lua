-- Set <space> as the leader key
-- NOTE: must happen before plugins are required (otherwise wrong leader maybe used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move lines in visual line mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Join keeping cursor in current position on line
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping keeps cursor line in middle of window
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Search keeps match line in middle of window
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows copy and paste over another item to preserve the
-- original copied string (instead of the string pasted over)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Deleting to 'void' register (ie keep the previous copied string for paste)
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Visual block insert
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Make Q (close vim) a no-op
vim.keymap.set("n", "Q", "<nop>")

-- TODO: further investigation into https://github.com/jrmoulton/tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Trigger lsp reformat
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- TODO: further investigation into quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Start interactive replace of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make current buffers associated file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Exit insert mode fast
vim.keymap.set("i", "jj", "<Esc>", { noremap = false })

-- twilight
vim.keymap.set("n", "tw", ":Twilight<enter>", { noremap = false })

-- buffers
vim.keymap.set("n", "tk", ":bnext<enter>", { noremap = false })
vim.keymap.set("n", "tj", ":bprev<enter>", { noremap = false })
vim.keymap.set("n", "th", ":bfirst<enter>", { noremap = false })
vim.keymap.set("n", "tl", ":blast<enter>", { noremap = false })
vim.keymap.set("n", "td", ":bdelete<enter>", { noremap = false })

-- files
vim.keymap.set("n", "QQ", ":q!<enter>", { noremap = false })
vim.keymap.set("n", "WW", ":w!<enter>", { noremap = false })
vim.keymap.set("n", "E", "$", { noremap = false })
vim.keymap.set("n", "B", "^", { noremap = false })
vim.keymap.set("n", "TT", ":TransparentToggle<CR>", { noremap = true })
vim.keymap.set("n", "st", ":TodoTelescope<CR>", { noremap = true })
vim.keymap.set("n", "ss", ":noh<CR>", { noremap = true })
--
-- splits
vim.keymap.set("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
vim.keymap.set("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })
vim.keymap.set("n", "<space><space>", "<cmd>set nohlsearch<CR>")

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Undo
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Options through Telescope
vim.keymap.set("n", "<Leader><tab>", "<Cmd>lua require('telescope.builtin').commands()<CR>", { noremap = false })

-- Fterm
vim.keymap.set("n", "<leader>tt", ":lua require('FTerm').toggle()<CR>", { noremap = true })
vim.keymap.set("t", "<leader>tt", '<C-\\><C-n>:lua require("FTerm").toggle()<CR>', { noremap = true })

-- Go
vim.keymap.set("n", "<leader>ee", "<cmd>GoIfErr<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gt", "<cmd>GoTestFunc -v -F<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>gfs", "<cmd>GoFillStruct<cr>", { silent = true, noremap = true })

-- Git
vim.keymap.set("n", "<leader>gc", ':Git commit -m "', { noremap = false })
vim.keymap.set("n", "<leader>gp", ":Git push -u origin HEAD<CR>", { noremap = false })

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
--  vim.g.copilot_filetypes = {
--    ["*"] = false,
--    ["javascript"] = true,
--    ["typescript"] = true,
--    ["lua"] = false,
--    ["rust"] = true,
--    ["c"] = true,
--    ["c#"] = true,
--    ["c++"] = true,
--    ["go"] = true,
--    ["python"] = true,
--  }

-- Conjure
vim.api.nvim_create_autocmd("BufNewFile", {
	group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
	pattern = { "conjure-log-*" },
	callback = function()
		vim.diagnostic.disable(0)
	end,
	desc = "Conjure Log disable LSP diagnostics",
})
