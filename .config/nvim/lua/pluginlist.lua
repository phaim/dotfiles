require("packer").startup(function()
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
        -- cmd = "Telescope",
        config = function()
            require("plugins.telescope").config()
        end
    }
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        -- cmd = "Telescope"
    }
    use {
        "nvim-telescope/telescope-media-files.nvim",
        -- cmd = "Telescope"
    }

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

    -- LSP
    use {
        "neovim/nvim-lspconfig",
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
        "hrsh7th/nvim-compe",
        config = function()
            require("plugins.compe").config()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
            require("nvim-autopairs.completion.compe").setup({
                map_cr = true, --  map <CR> on insert mode
                map_complete = true -- it will auto insert `(` after select function or method item
            })
        end

    }

    ----------------------------------------------------
    -- Nvim navigation (Bufferline, Nvim Tree etc.)
    ----------------------------------------------------
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
      'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('plugins.galaxyline').config()
        end
    }

    use {
        "wfxr/minimap.vim",
        config = function()
            require("plugins.minimap").config()
        end
    }

    ----------------------------------------------------
    -- Productivity tools
    ----------------------------------------------------
    use { 
        "vhyrro/neorg",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/neorg"
                            }
                        }
                    }
                },
            }
        end,
        requires = "nvim-lua/plenary.nvim"
    }

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

    -- use {"tjdevries/colorbuddy.nvim"}
    -- use {
    --     "tjdevries/gruvbuddy.nvim",
    --     requries = {"tjdevries/colorbuddy.nvim"},
    --     config = function()
    --         require("colorbuddy").colorscheme("gruvbuddy")
    --     end
    -- }

    use "JuliaEditorSupport/julia-vim"
end)
