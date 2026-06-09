local M = {}

M.config = function()
    local dap = require('dap')
    dap.adapters.python = {
        type = 'executable';
        command = 'python';
        args = {'-m', 'debugpy.adapter'};
    }

    require('dap-python').setup('python')
end

return M
