local packer = require("packer")

return packer.startup(function()
    -- Packer
    use("wbthomason/packer.nvim")
    -- Startup
    use("goolord/alpha-nvim")

    -- Speed up
    use("lewis6991/impatient.nvim")

    -- Indent
    use("lukas-reineke/indent-blankline.nvim")

    -- Surround
    use("kylechui/nvim-surround")

    -- Css color
    use("NvChad/nvim-colorizer.lua")

    -- Find & Replace in workspace
    use("nvim-pack/nvim-spectre")

    -- Theme
    use("olimorris/onedarkpro.nvim")
    use("xiyaowong/nvim-transparent")

    -- Highlight same text
    use("RRethy/vim-illuminate")

    -- Rainbow brackets
    use("HiPhish/rainbow-delimiters.nvim")

    -- Tree sistter
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- Icons
    use("DaikyXendo/nvim-web-devicons")

    -- File browser
    use("nvim-tree/nvim-tree.lua")

    -- File search
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")

    -- Status bar
    use("akinsho/bufferline.nvim")
    use("nvim-lualine/lualine.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind.nvim")
    use("nvimdev/lspsaga.nvim")
    use("ray-x/lsp_signature.nvim")

    -- Autocomplete
    -- use('ms-jpq/coq_nvim')
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/nvim-cmp")

    -- UI support
    use("MunifTanjim/nui.nvim")

    -- AI
    use("Exafunction/codeium.vim")

    -- Snippet
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")

    -- LSP installer
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use { "j-hui/fidget.nvim", tag = 'legacy' }

    -- Trouble
    use("folke/trouble.nvim")

    -- Rust
    use("Saecki/crates.nvim")
    use("simrat39/rust-tools.nvim")

    -- Close tag
    use("windwp/nvim-autopairs")
    use("windwp/nvim-ts-autotag")

    -- Formatter
    use("jose-elias-alvarez/null-ls.nvim")

    -- Comment
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Quick select
    use("phaazon/hop.nvim")

    -- Tailwind
    use("roobert/tailwindcss-colorizer-cmp.nvim")

    -- Git
    use("tanvirtin/vgit.nvim")
    use("lewis6991/gitsigns.nvim")

    -- Regex
    use('bennypowers/nvim-regexplainer')

    -- Scroll bar
    use("petertriho/nvim-scrollbar")
    use("kevinhwang91/nvim-hlslens")

    -- Debugger
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
end)
