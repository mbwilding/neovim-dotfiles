return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
        require("smart-splits").setup()

        -- moving between splits
        vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
        vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
        vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
        vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
        -- vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

        -- resizing splits
        vim.keymap.set("n", "<C-S-h>", require("smart-splits").resize_left)
        vim.keymap.set("n", "<C-S-l>", require("smart-splits").resize_right)
        vim.keymap.set("n", "<C-S-j>", require("smart-splits").resize_down)
        vim.keymap.set("n", "<C-S-k>", require("smart-splits").resize_up)

        -- swapping buffers between windows
        -- vim.keymap.set("n", "<leader><C-h>", require("smart-splits").swap_buf_left)
        -- vim.keymap.set("n", "<leader><C-l>", require("smart-splits").swap_buf_right)
        -- vim.keymap.set("n", "<leader><C-j>", require("smart-splits").swap_buf_down)
        -- vim.keymap.set("n", "<leader><C-k>", require("smart-splits").swap_buf_up)
    end,
}
