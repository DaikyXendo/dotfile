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

local util = require 'lspconfig.util'


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

-- nvim_lsp.eslint.setup {
--     on_attach = function(client)
--         client.server_capabilities.documentFormattingProvider = true
--     end,
--     root_dir = util.root_pattern('.eslintrc.js', '.eslintrc.cjs', '.eslintrc.json', '.eslintrc'),
-- }

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach
}

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
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
                command = "clippy",
            },
            completion = {
                addCallParenthesis = true,
                addCallArgumentSnippets = true,
            },
        }
    }
}

nvim_lsp.taplo.setup {
    on_attach = on_attach,
}

nvim_lsp.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = false,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
    root_dir = function(fname)
        return util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
            util.path.dirname(fname)
    end
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

nvim_lsp.svelte.setup {
    settings = {
        svelte = {
            plugin = {
                css = {
                    completion = {
                        enable = true,
                    },
                    diagnostics = {
                        -- enable = false,
                    },
                },
                svelte = {
                    default_script_language = "javascript",
                    compilerWarnings = {
                        ['a11y-no-static-element-interactions'] = "ignore",
                        ['a11y-click-events-have-key-events'] = "ignore",
                        ["a11y-missing-attribute"] = "ignore",
                        ['a11y-no-noninteractive-element-interactions'] = "ignore",
                        ["a11y-no-onchange"] = "ignore",
                        ["a11y-aria-attributes"] = "ignore",
                        ["a11y-incorrect-aria-attribute-type"] = "ignore",
                        ["a11y-unknown-aria-attribute"] = "ignore",
                        ["a11y-hidden"] = "ignore",
                        ["a11y-misplaced-role"] = "ignore",
                        ["a11y-unknown-role"] = "ignore",
                        ["a11y-no-abstract-role"] = "ignore",
                        ["a11y-no-redundant-roles"] = "ignore",
                        ["a11y-role-has-required-aria-props"] = "ignore",
                        ["a11y-accesskey"] = "ignore",
                        ["a11y-autofocus"] = "ignore",
                        ["a11y-misplaced-scope"] = "ignore",
                        ["a11y-positive-tabindex"] = "ignore",
                        ["a11y-invalid-attribute"] = "ignore",
                        ["a11y-img-redundant-alt"] = "ignore",
                        ["a11y-label-has-associated-control"] = "ignore",
                        ["a11y-media-has-caption"] = "ignore",
                        ["a11y-distracting-elements"] = "ignore",
                        ["a11y-structure"] = "ignore",
                        ["a11y-mouse-events-have-key-events"] = "ignore",
                        ["a11y-missing-content"] = "ignore",
                    },
                    includeInlayFunctionParameterTypeHints = false,
                    includeInlayFunctionLikeReturnTypeHints = false,
                },
            },
        },
    },
    --root_dir = {root_pattern()}
}
