return {
    "NeogitOrg/neogit",
    --branch = "nightly",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    lazy = true,
    keys = {
        {
            "<leader>gg",
            "<CMD>Neogit<CR>",
            desc = "Neogit: Toggle",
        },
    },
    opts = {
        use_default_keymaps = false,
        disable_hint = false,
        disable_context_highlighting = true,
        disable_signs = false,
        graph_style = "ascii",
        filewatcher = {
            enabled = true,
        },
        telescope_sorter = function()
            return nil
        end,
        git_services = {
            ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
            ["bitbucket.org"] =
            "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
            ["gitlab.com"] =
            "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
        },
        highlight = {
            italic = true,
            bold = true,
            underline = true,
        },
        disable_insert_on_commit = "auto",
        use_per_project_settings = true,
        remember_settings = true,
        fetch_after_checkout = false,
        sort_branches = "-committerdate",
        kind = "tab",
        disable_line_numbers = true,
        disable_relative_line_numbers = true,
        -- The time after which an output console is shown for slow running commands
        console_timeout = 2000,
        -- Automatically show console if a command takes more than console_timeout milliseconds
        auto_show_console = true,
        auto_close_console = true,
        notification_icon = "󰊢",
        status = {
            show_head_commit_hash = true,
            recent_commit_count = 10,
            HEAD_padding = 10,
            mode_padding = 3,
            mode_text = {
                M = "modified",
                N = "new file",
                A = "added",
                D = "deleted",
                C = "copied",
                U = "updated",
                R = "renamed",
                DD = "unmerged",
                AU = "unmerged",
                UD = "unmerged",
                UA = "unmerged",
                DU = "unmerged",
                AA = "unmerged",
                UU = "unmerged",
                ["?"] = "",
            },
        },
        commit_editor = {
            kind = "tab",
            show_staged_diff = true,
            staged_diff_split_kind = "split",
        },
        commit_select_view = {
            kind = "tab",
        },
        commit_view = {
            kind = "vsplit",
            verify_commit = vim.fn.executable("gpg") == 1,
        },
        log_view = {
            kind = "tab",
        },
        rebase_editor = {
            kind = "auto",
        },
        reflog_view = {
            kind = "tab",
        },
        merge_editor = {
            kind = "auto",
        },
        description_editor = {
            kind = "auto",
        },
        tag_editor = {
            kind = "auto",
        },
        preview_buffer = {
            kind = "floating",
        },
        popup = {
            kind = "split",
        },
        refs_view = {
            kind = "tab",
        },
        signs = {
            hunk = { "", "" },
            item = { ">", "v" },
            section = { ">", "v" },
        },
        integrations = {
            telescope = true,
            diffview = true,
            fzf_lua = true,
        },
        sections = {
            sequencer = {
                folded = false,
                hidden = false,
            },
            bisect = {
                folded = false,
                hidden = false,
            },
            untracked = {
                folded = false,
                hidden = false,
            },
            unstaged = {
                folded = false,
                hidden = false,
            },
            staged = {
                folded = false,
                hidden = false,
            },
            stashes = {
                folded = true,
                hidden = false,
            },
            unpulled_upstream = {
                folded = true,
                hidden = false,
            },
            unmerged_upstream = {
                folded = false,
                hidden = false,
            },
            unpulled_pushRemote = {
                folded = true,
                hidden = false,
            },
            unmerged_pushRemote = {
                folded = false,
                hidden = false,
            },
            recent = {
                folded = true,
                hidden = false,
            },
            rebase = {
                folded = true,
                hidden = false,
            },
        },
        ignored_settings = {
            "NeogitPushPopup--force-with-lease",
            "NeogitPushPopup--force",
            "NeogitPullPopup--rebase",
            "NeogitCommitPopup--allow-empty",
        },
        mappings = {
            commit_editor = {
                ["q"] = "Close",
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
                ["<m-p>"] = "PrevMessage",
                ["<m-n>"] = "NextMessage",
                ["<m-r>"] = "ResetMessage",
            },
            commit_editor_I = {
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
            },
            rebase_editor = {
                ["p"] = "Pick",
                ["r"] = "Reword",
                ["e"] = "Edit",
                ["s"] = "Squash",
                ["f"] = "Fixup",
                ["x"] = "Execute",
                ["d"] = "Drop",
                ["b"] = "Break",
                ["q"] = "Close",
                ["<cr>"] = "OpenCommit",
                ["gk"] = "MoveUp",
                ["gj"] = "MoveDown",
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
                ["[c"] = "OpenOrScrollUp",
                ["]c"] = "OpenOrScrollDown",
            },
            rebase_editor_I = {
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
            },
            finder = {
                ["<cr>"] = "Select",
                ["<c-c>"] = "Close",
                ["<esc>"] = "Close",
                ["<c-n>"] = "Next",
                ["<c-p>"] = "Previous",
                ["<down>"] = "Next",
                ["<up>"] = "Previous",
                ["<tab>"] = "MultiselectToggleNext",
                ["<s-tab>"] = "MultiselectTogglePrevious",
                ["<c-j>"] = "NOP",
                ["<ScrollWheelDown>"] = "ScrollWheelDown",
                ["<ScrollWheelUp>"] = "ScrollWheelUp",
                ["<ScrollWheelLeft>"] = "NOP",
                ["<ScrollWheelRight>"] = "NOP",
                ["<LeftMouse>"] = "MouseClick",
                ["<2-LeftMouse>"] = "NOP",
            },
            popup = {
                ["?"] = "HelpPopup",
                ["A"] = "CherryPickPopup",
                ["d"] = "DiffPopup",
                ["M"] = "RemotePopup",
                ["P"] = "PushPopup",
                ["X"] = "ResetPopup",
                ["Z"] = "StashPopup",
                ["i"] = "IgnorePopup",
                ["t"] = "TagPopup",
                ["b"] = "BranchPopup",
                ["B"] = "BisectPopup",
                ["w"] = "WorktreePopup",
                ["c"] = "CommitPopup",
                ["f"] = "FetchPopup",
                ["l"] = "LogPopup",
                ["m"] = "MergePopup",
                ["p"] = "PullPopup",
                ["r"] = "RebasePopup",
                ["v"] = "RevertPopup",
            },
            status = {
                ["j"] = "MoveDown",
                ["k"] = "MoveUp",
                ["q"] = "Close",
                ["I"] = "InitRepo",
                ["1"] = "Depth1",
                ["2"] = "Depth2",
                ["3"] = "Depth3",
                ["4"] = "Depth4",
                ["<space>"] = "Toggle",
                ["x"] = "Discard",
                ["s"] = "Stage",
                ["S"] = "StageUnstaged",
                ["<c-s>"] = "StageAll",
                ["u"] = "Unstage",
                ["K"] = "Untrack",
                ["U"] = "UnstageStaged",
                ["y"] = "ShowRefs",
                ["$"] = "CommandHistory",
                ["Y"] = "YankSelected",
                ["<c-r>"] = "RefreshBuffer",
                ["<cr>"] = "GoToFile",
                ["<c-v>"] = "VSplitOpen",
                ["<c-x>"] = "SplitOpen",
                ["<c-t>"] = "TabOpen",
                ["{"] = "GoToPreviousHunkHeader",
                ["}"] = "GoToNextHunkHeader",
                ["[c"] = "OpenOrScrollUp",
                ["]c"] = "OpenOrScrollDown",
            },
        },
    },
}
