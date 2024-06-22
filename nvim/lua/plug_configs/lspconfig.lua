local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
    return
end

local protocol = require("vim.lsp.protocol")

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warning = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local on_attach = function(client, bufnr) -- Formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command([[augroup Format]])
        vim.api.nvim_command([[autocmd! * <buffer>]])
        vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        vim.api.nvim_command([[augroup END]])
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local util = require("lspconfig.util")

nvim_lsp.emmet_ls.setup({
    on_attach = on_attach,
    filetypes = { "html" },
})

nvim_lsp.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.cssmodules_ls.setup({
    on_attach = on_attach,
})

nvim_lsp.jsonls.setup({
    on_attach = on_attach,
})

nvim_lsp.eslint.setup({
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
    end,
    root_dir = util.root_pattern(".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc"),
    -- on_attach = on_attach,
    -- capabilities = capabilities,
})

-- eslint format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
    command = "silent! EslintFixAll",
    group = vim.api.nvim_create_augroup("MyAutocmdsJavaScripFormatting", {}),
})

nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
})

nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    -- settings = {
    --     typescript = {
    --         inlayHints = {
    --             includeInlayParameterNameHints = "all",
    --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --             includeInlayFunctionParameterTypeHints = false,
    --             includeInlayVariableTypeHints = true,
    --             includeInlayPropertyDeclarationTypeHints = true,
    --             includeInlayFunctionLikeReturnTypeHints = false,
    --             includeInlayEnumMemberValueHints = true,
    --         },
    --     },
    --     javascript = {
    --         inlayHints = {
    --             includeInlayParameterNameHints = "all",
    --             includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --             includeInlayFunctionParameterTypeHints = false,
    --             includeInlayVariableTypeHints = true,
    --             includeInlayPropertyDeclarationTypeHints = true,
    --             includeInlayFunctionLikeReturnTypeHints = false,
    --             includeInlayEnumMemberValueHints = true,
    --         },
    --     },
    -- },
})

nvim_lsp.vuels.setup({
    on_attach = on_attach,
})

-- rust-analyzer
vim.g.rustaceanvim = {
    tools = {
        hover_actions = { auto_focus = true },
    },
    server = {
        capabilities = capabilities,
        default_settings = {
            ["rust-analyzer"] = {
                checkOnSave = { command = "clippy" },
                -- RA will scan .direnv correspondingly entire nixpkgs repository
                files = { excludeDirs = { ".direnv" } },
                completion = {
                    addCallParenthesis = true,
                    addCallArgumentSnippets = true,
                },
            },
        },
    },
}

nvim_lsp.taplo.setup({
    on_attach = on_attach,
})

nvim_lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = false,
                diagnosticMode = "openFilesOnly",
            },
        },
    },
    root_dir = function(fname)
        return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname)
            or util.path.dirname(fname)
    end,
})

nvim_lsp.solc.setup({
    on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

nvim_lsp.csharp_ls.setup({
    on_attach = on_attach,
    cmd = { "/Users/thanhlevan/.dotnet/tools/csharp-ls" },
})

nvim_lsp.svelte.setup({})

nvim_lsp.phpactor.setup({})
