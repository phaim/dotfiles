require("packer").startup(function()
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
        cmd = "Telescope",
        config = function()
            require("plugins.telescope").config()
        end
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cmd = "Telescope"
    }
    -- use {
    --     "nvim-telescope/telescope-media-files.nvim",
    --     cmd = "Telescope"
    -- }

    ----------------------------------------------------
    -- IDE Features
    ----------------------------------------------------
    use {
        "nvim-treesitter/nvim-treesitter",
        -- event = "BufRead",
        config = function()
            require("plugins.treesitter").config()
        end
    }

    use "romgrk/nvim-treesitter-context"

    -- LSP
    use {
        "neovim/nvim-lspconfig",
     }

    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup {
                hint_prefix = " ",
                handler_opts = {
                    border = "none"
                }
            }
        end,
    }

    use {
        "onsails/lspkind-nvim",
        -- event = "BufRead",
        config = function()
            require("lspkind").init()
        end
    }

    -- Git integration
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('neogit').setup()
        end,
    }

    use {
        "tpope/vim-fugitive",
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
          'nvim-lua/plenary.nvim'
        },
        config = function()
          require('gitsigns').setup()
        end
    }

    use {
        "junegunn/gv.vim",
        requires = {
            "tpope/vim-fugitive"
        }
    }

    -- Completion
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.nvim-cmp").config()
        end
    }
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "tamago324/cmp-zsh"
    use "lukas-reineke/cmp-under-comparator"
    use "saadparwaiz1/cmp_luasnip"
    --use {'tzachar/fuzzy.nvim'}
    --use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}
    --
    use "mfussenegger/nvim-dap"

    use {
        "L3MON4D3/LuaSnip",
        config = function()
            require("plugins.snippets").config()
        end
    }
    use "rafamadriz/friendly-snippets"

    use {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

            -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
            cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
        end

    }

    -- Tex
    use {
        "lervag/vimtex",
        config = function()
            require("plugins.vimtex").config()
        end
    }

    ----------------------------------------------------
    -- Nvim navigation (Bufferline, Nvim Tree etc.)
    ----------------------------------------------------
    use {
        "ThePrimeagen/harpoon"
    }
    use {
        "glepnir/dashboard-nvim",
        config = function()
            require("plugins.dashboard").config()
        end
    }

    use {
        "kyazdani42/nvim-tree.lua",
        -- config = function()
        --     require("nvim-tree.lua").setup{}
        -- end
    }

    use {
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugins.bufferline").config()
        end

    }
     
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        --cmd = require('lualine').setup(),
        config = function()
            require("plugins.lualine").config()
        end
    }
    use 'arkav/lualine-lsp-progress'
    -- use {
    --   'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true},
    --     config = function()
    --         require('plugins.galaxyline').config()
    --     end
    -- }
    
    -- Lua
    use {
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup {}
      end
    }


    ----------------------------------------------------
    -- Productivity tools
    ----------------------------------------------------
    use { 
        "vhyrro/neorg",
        config = function()
            require("plugins.neorg").setup()
        end,
        requires = "nvim-lua/plenary.nvim"
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup{}
        end
    }

    use {
        "soywod/himalaya",
        config = function()
            require("plugins.himalaya").config()
        end
    }

    use "Pocco81/TrueZen.nvim"

    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup()
        end
    }

    use "dstein64/vim-startuptime"
    ----------------------------------------------------
    -- Visuals
    ----------------------------------------------------
    use {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup()
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("utils").blankline()
        end
    }


    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
    use {"sainnhe/gruvbox-material"}
    use {"kmonad/kmonad-vim"}

    -- use {"tjdevries/colorbuddy.nvim"}

    use "JuliaEditorSupport/julia-vim"

    ----------------------------------------------------
    -- Fun Stuff
    ----------------------------------------------------
    use "ThePrimeagen/vim-be-good"

end)
