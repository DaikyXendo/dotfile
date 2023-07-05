local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warning = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local on_attach = function(client, bufnr) -- Formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup END]]
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    filetypes = { "html" }
}

nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

nvim_lsp.cssmodules_ls.setup {
    on_attach = on_attach,
}

nvim_lsp.jsonls.setup {
    on_attach = on_attach,
}

nvim_lsp.tailwindcss.setup {}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    -- cmd = { 'typescript-language-server', '--stdio' },
    -- filetypes = {'javascript'}
}

nvim_lsp.vuels.setup {
    on_attach = on_attach,
}

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
}

nvim_lsp.taplo.setup {
    on_attach = on_attach,
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoImportCompletions = false,
            },
        }
    }
}

nvim_lsp.solc.setup {
    on_attach = on_attach,
}

nvim_lsp.lua_ls.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            }
        }
    }
}
