local ls = require("luasnip")

ls.config.set_config({
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,
})

ls.snippets = {
    all = {},
}

require("luasnip.loaders.from_vscode").lazy_load()
