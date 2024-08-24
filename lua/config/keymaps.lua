-- Map ; to :
vim.keymap.set("n", ";", ":")

-- Disable arrow navigation
-- vim.keymap.set({ "n", "i" }, "<Up>", "<Nop>")
-- vim.keymap.set({ "n", "i" }, "<Down>", "<Nop>")
-- vim.keymap.set({ "n", "i" }, "<Left>", "<Nop>")
-- vim.keymap.set({ "n", "i" }, "<Right>", "<Nop>")

-- Allow hjkl navigation in non-normal mode
vim.keymap.set({ "i", "c" }, "<C-k>", "<Up>")
vim.keymap.set({ "i", "c" }, "<C-j>", "<Down>")
vim.keymap.set({ "i", "c" }, "<C-h>", "<Left>")
vim.keymap.set({ "i", "c" }, "<C-l>", "<Right>")

-- Tab close
vim.keymap.set("n", "q", ":tabclose<CR>")

-- End search highlight and clear messages
vim.keymap.set("n", "<Esc>", "<CMD>noh<CR><CMD>echo<CR><Esc>")

-- Leader NOP
vim.keymap.set({ "n", "v" }, "<leader>", "<Nop>")

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Toggles
vim.keymap.set("n", "<leader>ir", function()
    vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative/absolute line numbers" })

vim.keymap.set("n", "<leader>iw", function()
	vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle Word Wrap" })

-- Redo
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>yy", '"+Y', { desc = "Copy to clipboard (line)" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from clipboard (before)" })

-- Registers
vim.keymap.set("n", "x", '"_x')

-- Sort
vim.keymap.set("v", "s", ":sort<CR>gv")

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- Mouse
vim.keymap.set("v", "<RightMouse>", '"+y')
vim.keymap.set({ "n", "v" }, "<MiddleMouse>", '"+p')

-- Rulers
local columns = "81,121"
vim.keymap.set("n", "<leader>ic", function()
  if vim.o.colorcolumn == columns then
    vim.o.colorcolumn = ""
  else
    vim.o.colorcolumn = columns
  end
end, { desc = "Toggle Columns" })

-- HTML Generation
vim.keymap.set("n", "<leader>ht", function()
    vim.cmd("TOhtml")
    vim.defer_fn(function()
        vim.lsp.buf.format({ async = false })
    end, 200)
end, { desc = "HTML" })
vim.keymap.set("v", "<leader>ht", function()
    vim.cmd("'<,'>TOhtml")
    vim.defer_fn(function()
        vim.lsp.buf.format({ async = false })
    end, 200)
end, { desc = "HTML" })

-- Debug
-- vim.keymap.set("n", "\\m", "<CMD>messages<CR>", { desc = "Debug: Messages" })
vim.keymap.set("n", "\\i", "<CMD>Inspect<CR>", { desc = "Highlights: Inspect" })
