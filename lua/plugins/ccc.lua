-- CCC allows you to adjust colors and highlights hex colors

-- Mappings
-- i = Cycle input

return {
    "uga-rosa/ccc.nvim",
    lazy = true,
    event = { "BufEnter", "InsertEnter" },
    keys = {
        {
            "<leader>cct",
            "<CMD>CccHighlighterToggle<CR>",
            desc = "CCC: Toggle",
        },
        {
            "<leader>ccc",
            "<CMD>CccConvert<CR>",
            desc = "CCC: Convert",
        },
        {
            "<leader>ccp",
            "<CMD>CccPick<CR>",
            desc = "CCC: Pick",
        },
    },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },
    specs = {
        { "NvChad/nvim-colorizer.lua", optional = true, enabled = false },
    },
    opts = {
        highlighter = {
            auto_enable = true,
            test = "#356482",
            lsp = true,
        },
    },
    config = function(_, opts)
        require("ccc").setup(opts)
        if opts.highlighter and opts.highlighter.auto_enable then
            vim.cmd.CccHighlighterEnable()
        end
    end,
}
