local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name --
local keymap = vim.api.nvim_set_keymap

-------------------------------------------------------
--                     General                       --
-------------------------------------------------------

-- Some time type :W instead of :w
vim.api.nvim_create_user_command('W', function()
    vim.api.nvim_command("w")
end, {})

-- Ctrl + C = Esc
keymap("i", "<C-c>", "<Esc>", opts)

-- Center line
keymap('n', 'j', 'jzz', opts)
keymap('n', 'k', 'kzz', opts)

-- Resize pane --
keymap("n", "<M-Right>", ":vertical resize +1<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -1<CR>", opts)
-- keymap("n", "<M-Down>", ":resize +1<CR>", opts)
-- keymap("n", "<M-Up>", ":resize -1<CR>", opts)

-- Split pane
keymap("n", "<C-Right>", "<C-w>v", opts)

-- Switch pane
keymap("n", "<S-Right>", "<C-w>l", opts)
keymap("n", "<S-Left>", "<C-w>h", opts)

-- Delete without cutting --
keymap("n", "d", '"_d', opts)
keymap("x", "x", '"_x', opts)

-- Change without cutting
keymap("n", "c", '"_c', opts)

-- Delete inside word --
keymap("n", "ds", '"_ciw', opts)

-- Change buffer  --
keymap("n", "<Space>h", ":bp<CR>", opts)
keymap("n", "<Space>l", ":bn<CR>", opts)

-- Close buffer --
keymap("n", "<Space>x", ":bd<CR>", opts)

-- Move cursor left
keymap("i", "<C-z>", "<Esc>la", opts)

-- Move block or line up, down --
keymap("n", "<M-j>", ":m .+1<CR>==", opts)
keymap("n", "<M-k>", ":m .-2<CR>==", opts)
keymap("i", "<M-j>", "<Esc>:m .+1<CR>==gi", term_opts)
keymap("i", "<M-k>", "<Esc>:m .-2<CR>==gi", term_opts)
keymap("x", "<M-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Duplicate block up, down --
keymap("v", "<M-q>", ":t$ <CR>gv=gv", opts)
keymap("v", "<M-m>", ":t'><CR>", opts)

-- Alt+o to no hightlight --
keymap("", "<M-o>", ":noh<CR>", opts)

-- Visual Block
keymap("n", "<M-v>", "<C-v>", opts)

-------------------------------------------------------
--                     Plugins                       --
-------------------------------------------------------

-- Nvim-tree --
keymap("n", "<Space>e", ":NvimTreeToggle<CR>", opts)

-- Spectre --
keymap("n", "<Space>f", "<cmd>lua require('spectre').open()<CR>", opts)

-- Hop --
keymap("", "s", "<cmd>HopWord<CR>", term_opts)
keymap("", "L", "<cmd>HopLine<CR>", term_opts)
keymap("", "S", "<cmd>HopPattern<CR>", term_opts)

-- Telescope --
keymap("n", ";;", "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
keymap("n", ";r", "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
keymap("n", ";b", "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
keymap("n", ";t", "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
keymap("n", ";e", "<cmd>lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap("n", ";h", "<cmd>lua require('telescope.builtin').resume()<CR>", opts)

-- Lspsaga --
-- Diagnsotic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", term_opts)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", term_opts)

-- Only jump to error
keymap("n", "[E",
    'require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })'
    , term_opts)

keymap("n", "]E",
    'require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })'
    , term_opts)

keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
keymap("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", opts)
keymap("n", "<C-k>", "<cmd>Lspsaga signature_help<CR>", opts)
keymap("n", "gp", "<cmd>Lspsaga preview_definition<CR>", opts)
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
keymap("n", "<Space>o", "<cmd>Lspsaga outline<CR>", opts)
keymap("n", "<Space>a", "<cmd>Lspsaga code_action<CR>", opts)

-- Luasnip --
keymap("i", "<Tab>", 'luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<Tab>"', opts)

-- Trouble
keymap("n", "<Space>p", "<cmd>TroubleToggle<CR>", opts)

-- Codeium --
vim.g.codeium_disable_bindings = 1
vim.keymap.set("i", "<S-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
vim.keymap.set("i", "<A-n>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
vim.keymap.set("i", "<A-p>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
vim.keymap.set("i", "<A-s>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
vim.keymap.set("i", "<A-.>", function() return vim.fn["codeium#Complete"]() end, { expr = true })
