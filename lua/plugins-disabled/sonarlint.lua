return {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    config = function()
        require("sonarlint").setup({
            server = {
                cmd = {
                    "sonarlint-language-server",
                    "-stdio",
                    "-analyzers",
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarcfamily.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonargo.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarhtml.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonariac.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarjava.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarjs.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonaromnisharp.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarphp.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarpython.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonartext.jar"
                    ),
                    vim.fn.expand(
                        "$HOME/.local/share/nvim/mason/packages/sonarlint-language-server/extension/analyzers/sonarxml.jar"
                    ),
                },
            },
            filetypes = {
                "python",
                "cpp",
                "html",
                "h",
                "hpp",
                "go",
                "js",
                "ts",
                "jsx",
                "tsx",
                "csharp",
                "xml",
                "php",
                "java",
            },
        })
    end,
}
