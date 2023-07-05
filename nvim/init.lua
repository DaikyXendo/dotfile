-- Plugins
require("plugins.packer")

-- Options & Keymaps
require("options.colorscheme")
require("options.nvim_options")
require("options.keymaps")

-----------------------------------------------------
--               Plugins configs                   --
-----------------------------------------------------

-- Speed up
require("plug_configs.impatient")

-- Startup
require("plug_configs.alpha")

-- Indent
require("plug_configs.indentline")

-- Surround
require("plug_configs.surround")

-- Css color
require("plug_configs.colorizer")

-- Find & Replace
require("plug_configs.spectre")

-- Transparent
require("plug_configs.transparent")

-- Tree sistter
require("plug_configs.treesitter")

-- File browser
require("plug_configs.nvim-tree")

-- File search
require("plug_configs.telescope")

-- Status bar
require("plug_configs.bufferline")
require("plug_configs.lualine")

-- Highlight same text
require("plug_configs.illuminate")

-- LSP
require("plug_configs.mason") -- Need to call Mason first
require("plug_configs.lspconfig")
require("plug_configs.lsp_signature")
require("plug_configs.lspkind")
require("plug_configs.cmp")
require("plug_configs.lspsaga")

-- Snippet
require("plug_configs.luasnip")

-- Trouble
require("plug_configs.trouble")

-- Rust
require("plug_configs.rust")

-- Close tag
require("plug_configs.autopairs")
require("plug_configs.ts-autotag")

-- Formatter
require("plug_configs.null-ls")

-- Comment
require("plug_configs.comment")

-- Motion
require("plug_configs.hop")

-- Git
require("plug_configs.git")

-- Regex
require("plug_configs.regex")

-- Scroll Bar
require("plug_configs.scrollbar")

-- DAP
require("plug_configs.dap")
