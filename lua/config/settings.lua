local g = vim.g
local o = vim.o
local opt = vim.opt
local wo = vim.wo

g.mapleader = " "
g.maplocalleader = " "
g.have_nerd_font = true

o.showmode = false
o.inccommand = "split"
o.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- vim.schedule(function()
--     o.clipboard = "unnamedplus"
-- end)

-- Set leader key to space
local leader = " "
g.mapleader = leader
g.maplocalleader = leader

-- Nerd font
g.have_nerd_font = true

-- Enable true color support
o.termguicolors = true

-- Dark theme
o.background = "dark"

-- Highlight search results
o.hlsearch = true

-- Gutter line numbers
wo.number = true

-- Gutter relative line numbers
wo.relativenumber = false

-- Gutter sign column
wo.signcolumn = "auto:2"

-- Mouse mode
o.mouse = "a"
o.mousemodel = "extend"

-- Enable break indent
o.breakindent = true

-- Enable undo file
o.undofile = true

-- Ignore case in search
o.ignorecase = true

-- Enable smart case
o.smartcase = true

-- Set update time for diagnostics
o.updatetime = 250

-- Leader command timeout
o.timeout = true
o.timeoutlen = 300

-- Set completion options
o.completeopt = "menuone,noselect"

-- Allow backspacing over everything
o.backspace = "indent,eol,start"

-- Enable smart indent
o.smartindent = true

-- Text wrapping
o.wrap = false

-- Disable swap file
o.swapfile = false

-- Disable backup file
o.backup = false

-- Set undo levels
o.undolevels = 30000

-- Set scroll offset
o.scrolloff = 3

-- Update time for CursorHold
o.updatetime = 50

-- Enable auto write
o.autowrite = true

-- Disable cursor line
o.cursorline = false

-- Enable confirm dialog when leaving buffer
o.confirm = true

-- Line break
o.linebreak = true

-- Spell checking
o.spelllang = "en_au"
-- o.spell = true

-- Set fill characters after EOF
opt.fillchars:append({ eob = " " })

-- Indentation
o.shiftwidth = 4
o.tabstop = 4

-- Splits
o.splitright = true
o.splitbelow = true

-- Single status line
o.laststatus = 3

-- Virtual Text
vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
})
