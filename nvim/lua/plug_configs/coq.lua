vim.g.coq_settings = {
    auto_start = 'shut-up',
    xdg = true,

    display = {
        mark_highlight_group = 'COQMarks',
        ghost_text = {
            enabled = false
        },
        preview = {
            border = 'shadow',
        },
        pum = {
            y_max_len = 30,
            y_ratio = 0.5,
            source_context = nil,
        },
        icons = {
            mappings = {
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
                TypeParameter = " "
            }
        }
    },
    limits = {
        completion_auto_timeout = 0.5,
    },
    match = {
        max_results = 100,
    },
    keymap = {
        pre_select = true,
    }
}

require("coq")
