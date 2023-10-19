vim.diagnostic.config({
    virtual_text = true,
})
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

-- Indent line
require("plug_configs.indentline")

-- Surround
require("plug_configs.surround")

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
require("plug_configs.null-ls")

-- Comment
require("plug_configs.comment")

-- Motion
require("plug_configs.hop")

-- Css color
require("plug_configs.colorizer")

-- Git
require("plug_configs.git")

-- Regex
require("plug_configs.regex")

-- Scroll Bar
require("plug_configs.scrollbar")

-- DAP
require("plug_configs.dap")

--- A certain plugin has changed the color of the CursorLine so the last line needs to be changed again ---
-- vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "hi CursorLine guibg=#373b42" })
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, { command = "hi CursorLine guibg=#464b54" })
vim.api.nvim_command("hi CursorLine guibg=#464b54")
vim.api.nvim_command("hi DiagnosticUnderlineError guisp='Red' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineWarn guisp='Orange' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineHint guisp='Cyan' gui=undercurl")
vim.api.nvim_command("hi DiagnosticUnderlineInfo guisp='Cyan' gui=undercurl")
