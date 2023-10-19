local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_command [[augroup Format]]
            vim.api.nvim_command [[autocmd! * <buffer>]]
            vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            vim.api.nvim_command [[augroup END]]
        end
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.format()
                end,
            })
        end
    end,
    sources = {
        formatting.prettier.with {
            filetypes = { "html", "css", "scss", "solidity", "javascript", "typescriptreact", "javascriptreact", "rust",
                "json", "lua", "vue", "svelte" },
            extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote", "--tab-width", 4, "--max-line-length", 80 },
        },
        formatting.black,
    },
})
