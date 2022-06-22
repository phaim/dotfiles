local M = {}

M.config = function()
    require('telescope').setup {
     	defaults = {
            layout_config = {
            },
     	},
        pickers = {
            lsp_references = {
                layout_strategy = "cursor",
                layout_config = {
                    width = 0.7,
                    height = 0.3,
                }
            },
            lsp_definitions = {
                layout_strategy = "cursor",
                layout_config = {
                    width = 0.7,
                    height = 0.3,
                }
            },

            git_commits = { theme = "ivy", },
            git_bcommits = { theme = "ivy", },
            git_status = { theme = "ivy", },
            git_stash = { theme = "ivy", },

            quickfix = { theme = "ivy", },
            loclist = { theme = "ivy", },

        },
        extensions = {
           fzf = {
               fuzzy = true,                    -- false will only do exact matching
               override_generic_sorter = true, -- override the generic sorter
               override_file_sorter = true,     -- override the file sorter
               case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
           },
           file_browser = {
                hijack_netrw = true,
            },
--             media_files = {
--                 filetypes = {"png", "jpg", "JPG", "jpeg", "webp"},
--                 find_cmd = rg
--             }
        }
    }

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('projects')
    require('telescope').load_extension('file_browser')
    -- require('telescope').load_extension('media_files')
end

return M
