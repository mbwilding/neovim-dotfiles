-- Custom theme based on the Rider Dark theme

return {
    "mbwilding/gronk.nvim",
    branch = "multi",
    lazy = false,
    priority = 1000,
    config = function()
        require("gronk").setup({
            transparent = true,
        })

        vim.cmd([[colorscheme gronk-rider]])
    end,
}
