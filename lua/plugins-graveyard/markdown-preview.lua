return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        vim.keymap.set("n", "<leader>mp", "<CMD>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview: Toggle" })
    end,
}
