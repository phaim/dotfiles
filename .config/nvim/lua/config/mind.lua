local M = {}

M.setup = function()
    require('mind').setup {
        edit = {
            data_extension = ".norg",
            data_header = "* %s",
            copy_link_format = "[]{/ %s}"
        },
        ui = {
            width = 40,
        }
    }
end

return M
