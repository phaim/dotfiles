-- TODO rhysd/vim-grammarous
-- 
return {
    { "echasnovski/mini.nvim", version = false },

    -- { 
    --     "williamboman/mason.nvim",
    --     config = function()
    --         require("mason").setup()
    --     end
    -- },
    --
    -- {
    --     'stevearc/oil.nvim',
    --     opts = {},
    --     -- Optional dependencies
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     config = function()
    --         require("oil").setup()
    --     end,
    -- },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim"
        },
        cmd = "Telescope",
        config = function()
            require("config.telescope").config()
        end,
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make" 
    },

    { "nvim-telescope/telescope-file-browser.nvim" },

    {
      'nvim-treesitter/nvim-treesitter',
      branch = "main",
      lazy = false,
      build = ':TSUpdate'
    },

    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     -- event = "BufRead",
    --     config = function()
    --         require("config.treesitter").config()
    --     end
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        init = function()
          vim.treesitter.language.register("bash", "sh")

          vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
            callback = function(args)
              local lang = vim.treesitter.language.get_lang(args.match)
              if not lang then return end

              if vim.treesitter.query.get(lang, "highlights") then vim.treesitter.start(args.buf) end

              if vim.treesitter.query.get(lang, "indents") then
                vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
              end

              -- if vim.treesitter.query.get(lang, "folds") then
              --   vim.opt_local.foldmethod = "expr"
              --   vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
              -- end
            end,
          })
        end,
    },

    { "romgrk/nvim-treesitter-context" },

    -- LSP
    { "neovim/nvim-lspconfig" },

    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup {
                hint_prefix = " ",
                handler_opts = {
                    border = "none"
                }
            }
        end,
    },


    -- Git integration
    {
        'TimUntersberger/neogit',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "sindrets/diffview.nvim",
        },
        config = function()
            require('neogit').setup()
        end,
    },

    -- use {
    --     "tpope/vim-fugitive",
    -- }

    {
        'lewis6991/gitsigns.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- {
    --     "junegunn/gv.vim",
    --     dependencies = {
    --         "tpope/vim-fugitive"
    --     }
    -- },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.nvim-cmp").config()
        end
    },
    {"hrsh7th/cmp-buffer"}, 
    {"hrsh7th/cmp-path"}, 
    {"hrsh7th/cmp-nvim-lsp"}, 
    {"hrsh7th/cmp-nvim-lua"}, 
    {"hrsh7th/cmp-cmdline"}, 
    {"hrsh7th/cmp-nvim-lsp-document-symbol"}, 
    {"tamago324/cmp-zsh"}, 
    {"lukas-reineke/cmp-under-comparator"}, 
    {"saadparwaiz1/cmp_luasnip"}, 
    --use {'tzachar/fuzzy.nvim'}
    --use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}
    --
    {
        "L3MON4D3/LuaSnip",
        -- tag = "v2.*",
        -- run = "make install_jsregexp",
        dependencies = {"rafamadriz/friendly-snippets"},
        config = function()
            local ls = require("luasnip")
            vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent=true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent=true})
            vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent=true})
            vim.keymap.set({"i", "s"}, "<C-E>", function() 
                                                    if ls.choice_active() then
                                                        ls.change_choise(1)
                                                    end
                                                end, {silent=true})
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    {"rafamadriz/friendly-snippets"}, 

    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup()
            -- If you want insert `(` after select function or method item
            -- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            -- local cmp = require('cmp')
            -- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

            -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
            -- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
        end
    },

    -- Debuging
    {
        "mfussenegger/nvim-dap",
        config = function()
            require("config.dap").config()
        end,
        dependencies = {
            "mfussenegger/nvim-dap-python",
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio"
        }
    },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     config = function()
    --         require("config.dapui").setup()
    --     end,
    -- },
    {"theHamsta/nvim-dap-virtual-text"},
    {"nvim-telescope/telescope-dap.nvim"},


    -- Tex
    {
        "lervag/vimtex",
        config = function()
            require("config.vimtex").config()
        end
    },

    ----------------------------------------------------
    -- Nvim navigation (Bufferline, Nvim Tree etc.)
    ----------------------------------------------------
    -- use {
    --     "ThePrimeagen/harpoon"
    -- }
    -- use {
    --     "glepnir/dashboard-nvim",
    --     config = function()
    --         require("config.dashboard").config()
    --     end
    -- }

    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup()
            -- require("config.nvim-tree").config()
        end
    },

    {
        "akinsho/nvim-bufferline.lua",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.bufferline").config()
        end
    },
     
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {'kyazdani42/nvim-web-devicons'},
        -- dependencies = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require("config.lualine").config()
        end
    },
    {'arkav/lualine-lsp-progress'},
    -- use {
    --   'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     requires = {'kyazdani42/nvim-web-devicons', opt = true},
    --     config = function()
    --         require('config.galaxyline').config()
    --     end
    -- }
    
    -- Lua
    -- {
    --   "ahmedkhalf/project.nvim",
    --   config = function()
    --     require("project_nvim").setup {}
    --   end
    -- },


    ----------------------------------------------------
    -- Productivity tools
    ----------------------------------------------------
    -- {
    --   "vhyrro/luarocks.nvim",
    --   priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    --   config = true,
    --     opts = {
    --       luarocks_build_args = { "--with-lua=/usr/bin/lua5.1" },
    --     },
    -- },

    -- {
    --     "nvim-neorg/neorg",
    --     dependencies = { "luarocks.nvim" },
    --     lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    --     version = "*", -- Pin Neorg to the latest stable release
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --               ["core.defaults"] = {},
    --               ["core.concealer"] = {},
    --               ["core.dirman"] = {
    --                 config = {
    --                   workspaces = {
    --                     notes = "~/notes",
    --                   },
    --                   default_workspace = "notes",
    --                 },
    --               },
    --             },
    --       }
    --
    --       vim.wo.foldlevel = 99
    --       vim.wo.conceallevel = 2
    --     end,
    -- },

    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function() 
            require("toggleterm").setup{
                open_mapping = [[<c-\>]],
                -- direction = 'float',
            }
        end
    },
    -- { 
    --     "nvim-neorg/neorg",
    --     run = ":Neorg sync-parsers",
    --     config = function()
    --         require("config.neorg").setup()
    --     end,
    --     dependencies = "nvim-lua/plenary.nvim"
    -- },

    -- {
    --     'phaazon/mind.nvim',
    --     branch = 'v2.2',
    --     requires = { 'nvim-lua/plenary.nvim' },
    --     config = function()
    --         require("config.mind").setup()
    --     end
    -- },

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    },

    -- {
    --     "soywod/himalaya",
    --     config = function()
    --         require("config.himalaya").config()
    --     end
    -- },

    -- use "Pocco81/TrueZen.nvim"

    -- {
    --     "folke/twilight.nvim",
    --     config = function()
    --         require("twilight").setup()
    --     end
    -- },

    {"dstein64/vim-startuptime"}, 
    ----------------------------------------------------
    -- Visuals
    ----------------------------------------------------
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require("neoscroll").setup()
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        init = function()
            require("utils").blankline()
        end
    },


    {"npxbr/gruvbox.nvim", dependencies = {"rktjmp/lush.nvim"}}, 
    {"sainnhe/gruvbox-material"}, 
    {"kmonad/kmonad-vim"},

    -- use {"tjdevries/colorbuddy.nvim"}

    { "JuliaEditorSupport/julia-vim" },

    ----------------------------------------------------
    -- Fun Stuff
    ----------------------------------------------------
    -- { "ThePrimeagen/vim-be-good"},

    -- use {
    --     "nvim-telescope/telescope-media-files.nvim",
    --     cmd = "Telescope"
    -- }

    ----------------------------------------------------
    -- IDE Features
    ----------------------------------------------------

    -- use {
    --     "onsails/lspkind-nvim",
    --     -- event = "BufRead",
    --     config = function()
    --         require("lspkind").init()
    --     end
    -- }
}
