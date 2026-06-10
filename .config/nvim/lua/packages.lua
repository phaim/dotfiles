-- Plugin installation via vim.pack (`:h vim.pack`)
-- To install: open nvim (plugins clone automatically on first run)
-- After first install, run :TSUpdate for treesitter parsers
-- telescope-fzf-native requires a manual: make -C <pack-dir>/telescope-fzf-native.nvim

local function pack(repo, opts)
  opts = opts or {}
  opts.src = "https://github.com/" .. repo
  vim.pack.add({ opts })
end

-- Core dependencies
pack("nvim-lua/plenary.nvim")
pack("nvim-lua/popup.nvim")
pack("nvim-tree/nvim-web-devicons")

-- Telescope
pack("nvim-telescope/telescope.nvim")
pack("nvim-telescope/telescope-fzf-native.nvim")
pack("nvim-telescope/telescope-file-browser.nvim")
pack("nvim-telescope/telescope-dap.nvim")

-- Treesitter
pack("nvim-treesitter/nvim-treesitter", { version = "main" })
pack("romgrk/nvim-treesitter-context")

-- LSP
pack("neovim/nvim-lspconfig")
pack("ray-x/lsp_signature.nvim")

-- Git
pack("NeogitOrg/neogit")
pack("sindrets/diffview.nvim")
pack("lewis6991/gitsigns.nvim")

-- Completion
pack("hrsh7th/nvim-cmp")
pack("hrsh7th/cmp-buffer")
pack("hrsh7th/cmp-path")
pack("hrsh7th/cmp-nvim-lsp")
pack("hrsh7th/cmp-nvim-lua")
pack("hrsh7th/cmp-cmdline")
pack("hrsh7th/cmp-nvim-lsp-document-symbol")
pack("tamago324/cmp-zsh")
pack("lukas-reineke/cmp-under-comparator")
pack("saadparwaiz1/cmp_luasnip")

-- Snippets
pack("L3MON4D3/LuaSnip")
pack("rafamadriz/friendly-snippets")

-- Editor
pack("windwp/nvim-autopairs")

-- DAP
pack("mfussenegger/nvim-dap")
pack("mfussenegger/nvim-dap-python")
pack("rcarriga/nvim-dap-ui")
pack("nvim-neotest/nvim-nio")
pack("theHamsta/nvim-dap-virtual-text")

-- LaTeX
pack("lervag/vimtex")

-- Navigation / UI
pack("nvim-tree/nvim-tree.lua")
pack("akinsho/bufferline.nvim")
pack("nvim-lualine/lualine.nvim")
pack("arkav/lualine-lsp-progress")
pack("akinsho/toggleterm.nvim")
pack("folke/which-key.nvim")

-- Visuals
pack("karb94/neoscroll.nvim")
pack("lukas-reineke/indent-blankline.nvim")
pack("rktjmp/lush.nvim")
pack("ellisonleao/gruvbox.nvim")
pack("sainnhe/gruvbox-material")
pack("kmonad/kmonad-vim")
pack("JuliaEditorSupport/julia-vim")

-- Misc
pack("dstein64/vim-startuptime")
