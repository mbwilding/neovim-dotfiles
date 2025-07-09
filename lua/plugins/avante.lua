return {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    build = function()
        -- conditionally use the correct build system for the current OS
        if vim.fn.has("win32") == 1 then
            return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        else
            return "make"
        end
    end,
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        hints = {
            enabled = false,
        },
        -- add any opts here
        -- for example
        provider = "openai",
        providers = {
            openai = {
                model = "gpt-4.1-2025-04-14",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0.75,
                    max_tokens = 20480,
                },
            },
        },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
        -- "stevearc/dressing.nvim", -- for input provider dressing
        "folke/snacks.nvim", -- for input provider snacks
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        { -- autocompletion for avante commands and mentions
            "saghen/blink.cmp",
            dependencies = {
                "Kaiser-Yang/blink-cmp-avante",
                -- ... Other dependencies
            },
            opts = {
                sources = {
                    -- Add 'avante' to the list
                    default = { "avante", "lsp", "path", "luasnip", "buffer" },
                    providers = {
                        avante = {
                            module = "blink-cmp-avante",
                            name = "Avante",
                            opts = {
                                -- options for blink-cmp-avante
                            },
                        },
                    },
                },
            },
        },
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
