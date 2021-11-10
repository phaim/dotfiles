local M = {}

M.config = function()
    require('telescope').setup {
     	defaults = {
            layout_config = {
                cursor = {height = 0.4},
                bottom_pane = {height = 0.5},
            },
     	},
        pickers = {
            lsp_references = { theme = "cursor", },
            lsp_definitions = { theme = "cursor", },

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
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            },
--             media_files = {
--                 filetypes = {"png", "jpg", "JPG", "jpeg", "webp"},
--                 find_cmd = rg
--             }
        }
    }

    require('telescope').load_extension('fzf')
    -- require('telescope').load_extension('media_files')
end

return M
