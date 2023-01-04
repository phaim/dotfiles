local M = {}

M.setup = function()
    require('mind').setup {
        edit = {
            data_extension = ".norg",
            data_header = "* %s",
        },
        ui = {
            width = 40,
        }
    }
end

return M
