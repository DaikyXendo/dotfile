require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },

        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },

        rust = { "rustfmt" },

        php = { "php_cs_fixer" },
    },

    format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
    },

    formatters = {
        prettier = {
            prepend_args = {
                "--no-semi",
                "--single-quote",
                "--jsx-single-quote",
                "--tab-width",
                4,
                "--print-width",
                80,
                "--prose-wrap",
                "always",
            },
            args = function()
                -- if there is .prettierrc.json file in the project use it, else use the global path
                local args = { "--stdin-filepath", "$FILENAME" }

                local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG") or "no"

                local globalPrettierConfig = vim.fn.glob("../../defaults/.prettierrc.json", true, true)
                local localPrettierConfig = vim.fn.glob(".prettierrc", true, true)

                if not disableGlobalPrettierConfig and #globalPrettierConfig > 0 then
                    vim.list_extend(args, { "--config", globalPrettierConfig[1] })
                elseif #localPrettierConfig > 0 then
                    vim.list_extend(args, { "--config", localPrettierConfig[1] })
                end

                -- tailwind plugin for reference
                local tailwindPluginPathList = vim.fn.glob("node_modules/prettier-plugin-tailwindcss", "", true, true)
                local hasTailwindPrettierPlugin = false

                if #tailwindPluginPathList > 0 then
                    local tailwindPluginPath = tailwindPluginPathList[1]
                    hasTailwindPrettierPlugin = vim.fn.isdirectory(tailwindPluginPath) == 1
                end

                if hasTailwindPrettierPlugin then
                    vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
                end

                -- debugging info
                -- print("disableGlobalPrettierConfig:", vim.inspect(disableGlobalPrettierConfig))
                -- print("globalPrettierConfig:", vim.inspect(globalPrettierConfig))
                -- print("localPrettierConfig:", vim.inspect(localPrettierConfig))
                return args
            end,
        },
    },
})
