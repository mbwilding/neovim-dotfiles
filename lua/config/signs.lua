local function define_sign(name, opts)
    vim.fn.sign_define(name, opts)
end

local signs = {
    { "DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" } },
    { "DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" } },
    { "DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" } },
    { "DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" } },
    {
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "DapBreakpoint", numhl = "DapBreakpoint" },
    },
    {
        "DapBreakpointRejected",
        { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" },
    },
    { "DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" } },
    { "DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped" } },
    { "DapBreakpoint", { text = "⦿", texthl = "DapBreakpoint", numhl = "DapBreakpoint" } },
}

for _, sign in ipairs(signs) do
    define_sign(sign[1], sign[2])
end

-- vim.diagnostic.config({
--     signs = {
--         text = {
--             [vim.diagnostic.severity.ERROR] = "",
--             [vim.diagnostic.severity.WARN] = "",
--             [vim.diagnostic.severity.INFO] = "",
--             [vim.diagnostic.severity.HINT] = "",
--         },
--         -- Highlights
--         linehl = {
--             [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
--             [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
--             [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
--             [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
--         },
--         numhl = {
--             [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
--             [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
--             [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
--             [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
--         },
--     },
-- })
