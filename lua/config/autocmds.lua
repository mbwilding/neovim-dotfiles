-- Helper func
local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup("checktime"),
    command = "checktime",
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
        "oil",
        -- "notify",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
    end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+://") then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Set fileformat to unix for shell scripts
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = augroup("lf"),
    pattern = "*.sh",
    command = "set fileformat=unix",
})

vim.api.nvim_create_autocmd("ModeChanged", {
    group = augroup("mode_colors"),
    pattern = "*",
    callback = function()
        local gronk = require("gronk")
        local mode = vim.api.nvim_get_mode().mode
        local color = gronk.mode[mode] or gronk.primary

        vim.cmd(string.format("highlight LineNr guifg=%s", color))
        -- vim.cmd(string.format("highlight Cursor guifg=%s guibg=%s", gronk.base.bg, color))
        -- vim.cmd(string.format("highlight lCursor guifg=%s guibg=%s", gronk.base.bg, color))
    end
})
