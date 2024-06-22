vim.diagnostic.config({
    virtual_text = true,
})

vim.loader.enable()

-- Plugins
require("lazynvim")

-- Options & Keymaps
require("options.colorscheme")
require("options.nvim_options")
require("options.keymaps")

-----------------------------------------------------
--               Plugins configs                   --
-----------------------------------------------------

-- Startup
require("plug_configs.alpha")

-- Indent line
require("plug_configs.indentline")

-- Find & Replace
require("plug_configs.spectre")

-- Transparent
require("plug_configs.transparent")

-- Tree sistter
require("plug_configs.treesitter")

-- File browser
-- require("plug_configs.nvim-tree")

-- File search
require("plug_configs.telescope")

-- Status bar
require("plug_configs.bufferline")
require("plug_configs.lualine")

-- Highlight same text
-- require("plug_configs.illuminate")

-- LSP
require("plug_configs.mason") -- Need to call Mason first
-- require("plug_configs.coq")
require("plug_configs.lspconfig")
-- require("plug_configs.lsp_signature")
require("plug_configs.lspkind")
require("plug_configs.cmp")
require("plug_configs.lspsaga")

-- Snippet
require("plug_configs.luasnip")

-- Trouble
-- require("plug_configs.trouble")

-- Rust
require("plug_configs.rust")

-- Close tag
require("plug_configs.autopairs")
require("plug_configs.ts-autotag")

-- Formatter
require("plug_configs.conform")

-- Comment
require("plug_configs.comment")

-- Motion
require("plug_configs.hop")

-- Css color
require("plug_configs.colorizer")

-- Git
require("plug_configs.git")

-- AI
require("plug_configs.chat-gpt")

-- Scroll Bar
require("plug_configs.scrollbar")

-- DAP
require("plug_configs.dap")

--- A certain plugin has changed the color of the CursorLine so the last line needs to be changed again ---
vim.api.nvim_command("hi CursorLine guibg=#464b54")
vim.api.nvim_command("hi DiagnosticUnderlineError guisp='Red' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineWarn guisp='Orange' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineHint guisp='Cyan' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineInfo guisp='Cyan' gui=undercurl")

require("nvim-tree").setup({
    filters = {
        custom = { ".git" },
        exclude = { ".DS_Store" },
        dotfiles = false,
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        highlight_opened_files = "none",
        root_folder_modifier = ":t",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    empty = "",
                    empty_open = "",
                    open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = { error = " ", warning = " ", hint = "󰌶 ", info = " " },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    -- system_open = {
    --   cmd = nil,
    --   args = {},
    -- },
    -- filters = {
    --   dotfiles = false,
    --   custom = {},
    -- },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    view = {
        width = 30,
        side = "left",
        number = false,
        relativenumber = false,
    },
})
