-- Navigate vim panes better
-- vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
-- vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
-- vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
-- vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
--
-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
-- vim.wo.number = true

-- Search highlight options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Cursor config
vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Make line numbers default
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disable mouse mode - to break bad habits :)
vim.opt.mouse = ""

-- Formatting
-- Tab config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indenting
vim.opt.smartindent = true

-- Visually wrap lines longer than window
vim.opt.wrap = false

-- Display "gutter" on left edge
-- eg to display warning signs
vim.opt.signcolumn = "yes"

-- Visually indicate 'max' width
vim.opt.colorcolumn = "80"

-- Keep file context when scrolling
vim.opt.scrolloff = 8

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.isfname:append("@-@")

-- Decrease update time
vim.opt.updatetime = 250

-- Ignore node_modules
-- TODO: not sure if this has intended effect of leaving node_modules dir out of searches to avoid:
-- https://www.reddit.com/r/ProgrammerHumor/comments/6s0wov/heaviest_objects_in_the_universe/)?
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.opt.spelllang = "en_us"
vim.opt.spell = true
