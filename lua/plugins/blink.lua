return {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
    },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
            preset = 'default',
            ["<A-1>"] = { function(cmp) cmp.accept({ index = 1 }) end },
            ["<A-2>"] = { function(cmp) cmp.accept({ index = 2 }) end },
            ["<A-3>"] = { function(cmp) cmp.accept({ index = 3 }) end },
            ["<A-4>"] = { function(cmp) cmp.accept({ index = 4 }) end },
            ["<A-5>"] = { function(cmp) cmp.accept({ index = 5 }) end },
            ["<A-6>"] = { function(cmp) cmp.accept({ index = 6 }) end },
            ["<A-7>"] = { function(cmp) cmp.accept({ index = 7 }) end },
            ["<A-8>"] = { function(cmp) cmp.accept({ index = 8 }) end },
            ["<A-9>"] = { function(cmp) cmp.accept({ index = 9 }) end },
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            completion = {
                enabled_providers = { 'lsp', 'path', 'snippets', 'luasnip', 'buffer' },
            },
        },

        -- experimental auto-brackets support
        completion = {
            accept = {
                auto_brackets = {
                    enabled = true
                }
            },
            menu = {
                draw = {
                    treesitter = true,
                    columns = {
                        {
                            "item_idx",
                            "kind_icon",
                            -- "kind",
                            "label",
                            "label_description",
                            gap = 1
                        },
                    },
                    components = {
                        item_idx = {
                            text = function(ctx) return tostring(ctx.idx) end,
                            highlight = "BlinkCmpItemIdx"
                        }
                    }
                },
            },

        }

        -- experimental signature help support
        -- signature = { enabled = true }
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.completion.enabled_providers" }
}
