local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

vim.g.skip_ts_context_commentstring_module = true
---@diagnostic disable: missing-fields
require("ts_context_commentstring").setup({
    enable_autocmd = false,
})

treesitter.setup({
    ensure_installed = {
        "css",
        "html",
        "javascript",
        "json",
        "markdown",
        "python",
        "rust",
        "scss",
        "solidity",
        "tsx",
        "typescript",
        "lua",
        "vue",
        "markdown",
        "markdown_inline",
        "svelte",
        "c_sharp",
        "php",
    },
    -- one of "all" or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    auto_install = true,  -- automatically install missing parsers
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true,    -- false will disable the whole extension
        -- disable = { "css", "html" }, -- list of language that will be disabled
        disable = { "" }, -- list of language that will be disabled
        -- additional_vim_regex_highlighting = true,
    },
    autopairs = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = {
            "python",
            "css",
        },
    },
    rainbow = {
        enable = true,
        disable = { "" },
    },
    playground = {
        enable = true,
    },
})
