local M = {};

M.setup = function()
    require('neorg').setup {
        -- Tell Neorg what modules to load
        load = {
            ["core.defaults"] = {}, -- Load all the default modules
            ["core.norg.concealer"] = {}, -- Allows for use of icons
            ["core.norg.dirman"] = { -- Manage your directories with Neorg
                config = {
                    workspaces = {
                        agenda = "~/Documents/notes/agenda",
                        phd = "~/Documents/notes/phd",
                        home = "~/Documents/notes/home",
                    }
                }
            },
            -- ["core.gtd.base"] = {
            --     config = {
            --         workspace = "agenda",
            --         default_lists = {inbox = "agenda.norg"},

            --     }
            -- },
        },
    }
end

return M
