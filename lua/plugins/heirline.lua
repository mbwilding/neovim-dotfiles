return {
    "rebelot/heirline.nvim",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.o.showmode = false
        vim.o.showcmd = false

        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")
        local colors = require("gronk")
        require("heirline").load_colors(colors)

        local icons = true

        -- HELPERS
        local spacer = { provider = " " }

        local align = { provider = "%=" }

        local cut = { provider = "%<" }

        local o = { provider = "[" }

        local c = { provider = "]" }

        -- MODE
        local mode_name = {
            n = "NORMAL",
            no = "OPERATOR-PENDING",
            nov = "OPERATOR-PENDING VISUAL",
            noV = "OPERATOR-PENDING VISUAL LINE",
            ["no\22"] = "OPERATOR-PENDING VISUAL BLOCK",
            niI = "NORMAL INSERT",
            niR = "NORMAL REPLACE",
            niV = "NORMAL VIRTUAL",
            nt = "TERMINAL",
            v = "VISUAL",
            vs = "VISUAL SELECT",
            V = "VISUAL LINE",
            Vs = "VISUAL LINE SELECT",
            ["\22"] = "VISUAL BLOCK",
            ["\22s"] = "VISUAL BLOCK SELECT",
            s = "SELECT",
            S = "SELECT LINE",
            ["\19"] = "SELECT BLOCK",
            i = "INSERT",
            ic = "INSERT COMPLETION",
            ix = "INSERT XTERM",
            R = "REPLACE",
            Rc = "REPLACE COMPLETION",
            Rx = "REPLACE XTERM",
            Rv = "VIRTUAL REPLACE",
            Rvc = "VIRTUAL REPLACE COMPLETION",
            Rvx = "VIRTUAL REPLACE XTERM",
            c = "COMMAND-LINE",
            cv = "EX MODE",
            r = "HIT-ENTER PROMPT",
            rm = "MORE PROMPT",
            ["r?"] = "CONFIRM",
            ["!"] = "SHELL or EXTERNAL COMMAND",
            t = "TERMINAL",
        }

        local mode_info = function()
            local mode = vim.fn.mode(1)
            local letter = mode:sub(1, 1)
            local name = mode_name[mode]
            local color = colors.mode[mode]

            return {
                mode = mode,
                letter = letter,
                name = name,
                color = color,
            }
        end

        local vim_mode = {
            init = function(self)
                self.mode_info = mode_info()
            end,
            provider = function(self)
                return "%2(" .. self.mode_info.name .. "%)"
            end,
            hl = function(self)
                return { fg = self.mode_info.color, bg = colors.base.transparent, bold = true }
            end,
            update = {
                "ModeChanged",
                pattern = "*:*",
                callback = vim.schedule_wrap(function()
                    vim.cmd("redrawstatus")
                end),
            },
        }

        -- FILE
        local file_name_block = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
                --self.show_name_ext_only = true
            end,
            hl = function()
                return { fg = colors.base.fg, bg = colors.base.transparent }
            end,
        }

        local file_icon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color =
                    require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
            end,
            provider = function(self)
                return self.icon and (self.icon .. " ")
            end,
            hl = function(self)
                return { fg = self.icon_color, bg = colors.base.transparent }
            end,
        }

        local file_name = {
            provider = function(self)
                local filename = vim.fn.fnamemodify(self.filename, ":.")
                filename = filename:gsub("oil://", "")

                local cwd = vim.fn.getcwd(0)
                local relative_filename = vim.fn.fnamemodify(filename, ":~:.")

                if relative_filename:sub(1, #cwd) == cwd then
                    relative_filename = relative_filename:sub(#cwd + 2)
                end

                if not conditions.width_percent_below(#relative_filename, 0.25) then
                    relative_filename = vim.fn.fnamemodify(relative_filename, ":t")
                end

                return "[" .. relative_filename .. "]"
            end,
            hl = function()
                return { fg = colors.base.brown, bg = colors.base.transparent, force = true }
            end,
        }

        local file_name_modifier = {
            hl = function()
                if vim.bo.modified then
                    return { fg = colors.base.pink_dark, bg = colors.base.transparent, force = true }
                elseif vim.bo.readonly or not vim.bo.modifiable then
                    return { fg = colors.base.red, bg = colors.base.transparent, force = true }
                end
            end,
        }

        file_name_block = utils.insert(
            file_name_block,
            file_icon,
            utils.insert(file_name_modifier, file_name),
            { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
        )

        -- FILE TYPE
        local file_type = {
            provider = function()
                return string.upper(vim.bo.filetype)
            end,
            hl = function()
                return { fg = mode_info().color, bg = colors.base.transparent }
            end,
        }

        -- FILE ENCODING
        local file_encoding = {
            provider = function()
                local x = vim.bo.fenc
                if x ~= "" then
                    return x:upper()
                end
            end,
            hl = function()
                return { fg = colors.base.blue_dark, bg = colors.base.transparent }
            end,
        }

        -- FILE FORMAT
        local file_format = {
            provider = function()
                local x = vim.bo.fileformat
                if x ~= "" then
                    if false then
                        if x == "unix" then
                            return ""
                        else
                            return ""
                        end
                    else
                        if x == "unix" then
                            return "LF"
                        else
                            return "CRLF"
                        end
                    end

                    return x:upper()
                end
            end,
            hl = function()
                return { fg = colors.base.green, bg = colors.base.transparent }
            end,
        }

        -- FILE SIZE
        local file_size = {
            provider = function()
                local suffix = { "B", "KB", "MB", "GB", "TB", "PB", "EB" }
                local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))

                fsize = (fsize < 0 and 0) or fsize

                if fsize == 0 or fsize == nil then
                    return nil
                end

                if fsize < 1024 then
                    return fsize .. suffix[1]
                end
                local i = math.floor((math.log(fsize) / math.log(1024)))
                return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
            end,
            hl = function()
                return { fg = colors.base.orange_light, bg = colors.base.transparent }
            end,
        }

        -- FILE LAST MODIFIED
        local file_last_modified = {
            -- did you know? Vim is full of functions!
            provider = function()
                local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
                return (ftime > 0) and os.date("%c", ftime)
            end,
            hl = { bg = colors.base.transparent },
        }

        -- RULER
        local ruler = {
            -- %l = current line number
            -- %L = number of lines in the buffer
            -- %c = column number
            -- %P = percentage through file of displayed window

            static = {
                --sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
                sbar = { "", "", "", "", "", "", "", "", "", "", "", "", "", "", "" },
            },
            provider = function(self)
                local curr_line = vim.api.nvim_win_get_cursor(0)[1]
                local lines = vim.api.nvim_buf_line_count(0)
                local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
                local icon = string.rep(self.sbar[i], 1)

                return "%c " .. icon .. " %l/%L"
            end,
            hl = function()
                return { fg = mode_info().color, bg = colors.base.transparent }
            end,
        }

        -- GIT
        local git = {
            condition = conditions.is_git_repo,
            init = function(self)
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= nil
                    or self.status_dict.removed ~= nil
                    or self.status_dict.changed ~= nil
            end,

            hl = { fg = colors.base.blue_light, bg = colors.base.transparent },

            { -- git branch name
                provider = function(self)
                    return " " .. "[" .. self.status_dict.head .. "]"
                end,
            },
            {
                provider = function(self)
                    local count = self.status_dict.added or 0
                    if count > 0 then
                        if icons then
                            return "  " .. count
                        else
                            return " + " .. count
                        end
                    end
                end,
                hl = { fg = utils.get_highlight("DiffAdd").fg, bg = colors.base.transparent },
            },
            {
                provider = function(self)
                    local count = self.status_dict.changed or 0
                    if count > 0 then
                        if icons then
                            return "  " .. count
                        else
                            return " ~ " .. count
                        end
                    end
                end,
                hl = { fg = utils.get_highlight("DiffChange").fg, bg = colors.base.transparent },
            },
            {
                provider = function(self)
                    local count = self.status_dict.removed or 0
                    if count > 0 then
                        if icons then
                            return "  " .. count
                        else
                            return " - " .. count
                        end
                    end
                end,
                hl = { fg = utils.get_highlight("DiffDelete").fg, bg = colors.base.transparent },
            },
        }

        -- LSP / LINT
        local lsp_lint = {
            condition = conditions.lsp_attached,
            update = { "LspAttach", "LspDetach", "BufEnter", "BufWritePost" },
            provider = function()
                local current_buf = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients()
                local client_names = {}

                for _, client in ipairs(clients) do
                    if vim.lsp.buf_is_attached(current_buf, client.id) then
                        table.insert(client_names, client.name)
                    end
                end

                local ft = vim.bo[current_buf].filetype
                local linters = require("lint").linters_by_ft[ft] or {}
                local linter_names = table.concat(linters, ", ")

                if #client_names > 0 or #linters > 0 then
                    local result = " ["
                    if #client_names > 0 then
                        result = result .. table.concat(client_names, ", ")
                    end
                    if #linters > 0 then
                        if #client_names > 0 then
                            result = result .. ", "
                        end
                        result = result .. linter_names
                    end
                    result = result .. "]"
                    return result
                else
                    return ""
                end
            end,
            hl = { fg = colors.base.pink_dark, bg = colors.base.transparent },
        }

        -- WORKING DIRECTORY
        local work_dir = {
            provider = function()
                local icon = " "
                local cwd = vim.fn.getcwd(0)
                cwd = vim.fn.fnamemodify(cwd, ":~")
                if not conditions.width_percent_below(#cwd, 0.25) then
                    cwd = vim.fn.fnamemodify(cwd, ":t")
                end
                return icon .. "[" .. cwd .. "]"
            end,
            hl = { fg = colors.base.purple_light, bg = colors.base.transparent },
        }

        -- DIAGNOSTICS
        local diagnostics = {
            condition = conditions.has_diagnostics,

            static = {
                error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1] and
                    vim.fn.sign_getdefined("DiagnosticSignError")[1].text or "E",
                warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1] and
                    vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text or "W",
                info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1] and
                    vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text or "I",
                hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1] and
                    vim.fn.sign_getdefined("DiagnosticSignHint")[1].text or "H",
            },

            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,

            update = { "DiagnosticChanged", "BufEnter" },

            {
                provider = function(self)
                    return self.info > 0 and (self.info_icon .. self.info)
                end,
                hl = { fg = colors.base.green, bg = colors.base.transparent },
            },
            {
                provider = function(self)
                    return self.hints > 0 and (" " .. self.hint_icon .. self.hints)
                end,
                hl = { fg = colors.base.blue_light, bg = colors.base.transparent },
            },
            {
                provider = function(self)
                    -- 0 is just another output, we can decide to print it or not!
                    return self.errors > 0 and (" " .. self.error_icon .. self.errors)
                end,
                hl = { fg = colors.base.red, bg = colors.base.transparent },
            },
            {
                provider = function(self)
                    return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings)
                end,
                hl = { fg = colors.base.orange_dark, bg = colors.base.transparent },
            },
        }

        -- DEBUG
        local debug = {
            condition = function()
                local session = require("dap").session()
                return session ~= nil
            end,
            provider = function()
                return " " .. "[" .. require("dap").status() .. "]"
            end,
            hl = { fg = colors.base.blue_dark, bg = colors.base.transparent },
        }

        -- DATE TIME
        -- local date_time = {
        -- 	provider = function()
        -- 		return os.date("%Y-%m-%d %I:%M:%S %p")
        -- 	end,
        -- 	hl = { fg = colors.base.purple_light, bg = colors.base.transparent },
        -- }
        -- local function startTimerOnSecondDivisibleBy(updateRateInSeconds)
        -- 	local currentTime = os.date("*t")
        -- 	local currentSecond = currentTime.sec
        -- 	local millisecondsTillNextDivisibleSecond = (
        -- 		(updateRateInSeconds - (currentSecond % updateRateInSeconds)) % updateRateInSeconds
        -- 	) * 1000
        -- 	if millisecondsTillNextDivisibleSecond == 0 then
        -- 		millisecondsTillNextDivisibleSecond = updateRateInSeconds * 1000
        -- 	end
        -- 	vim.fn.timer_start(millisecondsTillNextDivisibleSecond, function()
        -- 		vim.cmd("redrawstatus")
        -- 	end, { ["repeat"] = -1 })
        -- end
        -- startTimerOnSecondDivisibleBy(1)

        -- GRAPPLE
        local grapple = {
            provider = function()
                local value = require("grapple").name_or_index()
                if value == "" then
                    return nil
                end
                return " " .. "[" .. value .. "]"
            end,
            condition = function()
                return require("grapple").exists()
            end,
            hl = { fg = colors.base.purple_light, bg = colors.base.transparent },
        }

        -- MEMES
        local meme = {
            provider = "Feet Pics: 57.6TB",
            hl = { fg = colors.base.brown, bg = colors.base.transparent },
        }

        -- Auto-Session
        -- local auto_session = {
        -- 	provider = require("auto-session.lib").current_session_name,
        -- 	hl = { fg = colors.base.red, bg = colors.base.transparent },
        -- }

        -- INIT
        require("heirline").setup({
            statusline = {
                -- vim_mode,
                -- spacer,
                work_dir,
                spacer,
                file_name_block,
                spacer,
                file_size,
                spacer,
                file_encoding,
                spacer,
                file_format,
                spacer,
                debug,

                align,
                ruler,

                align,
                grapple,
                diagnostics,
                spacer,
                lsp_lint,
                spacer,
                git,
                spacer,
                -- date_time,
                -- spacer,
            },
            winbar = nil,
            --tabline = { ... },
            --statuscolumn = { ... },
        })
    end,
}
