return {
    "NStefan002/screenkey.nvim",
    lazy = false,
    branch = "main",
    keys = {
        {
            "<leader>ik",
            "<CMD>Screenkey toggle<CR>",
            desc = "Screenkey: Toggle",
        },
    },
    opts = {
        win_opts = {
            row = vim.o.lines - vim.o.cmdheight - 1,
            col = vim.o.columns - 1,
            relative = "editor",
            anchor = "SE",
            width = 32,
            height = 1,
            border = "single",
            title = "Key Presses",
            title_pos = "center",
            style = "minimal",
            focusable = false,
            noautocmd = true,
        },
        hl_groups = {
            ["screenkey.hl.key"] = { link = "Normal" },
            ["screenkey.hl.map"] = { link = "Normal" },
            ["screenkey.hl.sep"] = { link = "Normal" },
        },
        compress_after = 3,
        clear_after = 3,
        emit_events = true,
        disable = {
            filetypes = {},
            buftypes = {},
        },
        show_leader = true,
        group_mappings = false,
        display_infront = {},
        display_behind = {},
        filter = function(keys)
            return keys
        end,
        colorize = function(keys)
            return keys
        end,
        separator = " ",
        keys = {
            ["<TAB>"] = "󰌒",
            ["<CR>"] = "󰌑",
            ["<ESC>"] = "Esc",
            ["<SPACE>"] = "␣",
            ["<BS>"] = "󰌥",
            ["<DEL>"] = "Del",
            ["<LEFT>"] = "",
            ["<RIGHT>"] = "",
            ["<UP>"] = "",
            ["<DOWN>"] = "",
            ["<HOME>"] = "Home",
            ["<END>"] = "End",
            ["<PAGEUP>"] = "PgUp",
            ["<PAGEDOWN>"] = "PgDn",
            ["<INSERT>"] = "Ins",
            ["<F1>"] = "󱊫",
            ["<F2>"] = "󱊬",
            ["<F3>"] = "󱊭",
            ["<F4>"] = "󱊮",
            ["<F5>"] = "󱊯",
            ["<F6>"] = "󱊰",
            ["<F7>"] = "󱊱",
            ["<F8>"] = "󱊲",
            ["<F9>"] = "󱊳",
            ["<F10>"] = "󱊴",
            ["<F11>"] = "󱊵",
            ["<F12>"] = "󱊶",
            ["CTRL"] = "Ctrl",
            ["ALT"] = "Alt",
            ["SUPER"] = "󰘳",
            ["<leader>"] = "<leader>",
        },
    },
}
