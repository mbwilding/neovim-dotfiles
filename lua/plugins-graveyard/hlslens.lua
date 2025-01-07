return {
    "kevinhwang91/nvim-hlslens",
    config = function()
        require("hlslens").setup()

        vim.api.nvim_set_keymap(
            "n",
            "n",
            [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
            {}
        )
        vim.api.nvim_set_keymap(
            "n",
            "N",
            [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
            {}
        )
        vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], {})
        vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], {})

        -- vim.api.nvim_set_keymap("n", "<Leader>l", "<Cmd>noh<CR>", {})
    end,
}
