local status, mason = pcall(require, "mason")
if not status then
    return
end

local status1, fidget = pcall(require, "fidget")
if not status1 then
    return
end

local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
    return
end

mason.setup({})

lspconfig.setup({
    ensure_installed = {
        "rust_analyzer",
        "pyright",
        "solc",
        "tsserver",
        "emmet_ls",
        "jsonls",
        "cssls",
        "cssmodules_ls",
        "taplo",
        "tailwindcss",
        "vuels",
        "svelte",
        "eslint",
    },
    automatic_installation = true,
})

fidget.setup({
    text = {
        spinner = "dots",
    },
})
