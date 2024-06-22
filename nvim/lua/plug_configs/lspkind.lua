require("lspkind").init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    mode = "symbol_text",

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = "codicons",

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "🔤",
        Method = "🧰",
        Function = "🛠️",
        Constructor = "🏗️",
        Field = "🏷️",
        Variable = "📊",
        Class = "📚",
        Interface = "🖥️",
        Module = "📦",
        Property = "🏷️",
        Unit = "📏",
        Value = "🔢",
        Enum = "🆔",
        Keyword = "🔑",
        Snippet = "🧩",
        Color = "🎨",
        File = "📄",
        Reference = "🗃️",
        Folder = "📂",
        EnumMember = "🆔",
        Constant = "💎",
        Struct = "🧱",
        Event = "✨",
        Operator = "➗",
        TypeParameter = " ",
    },
})
