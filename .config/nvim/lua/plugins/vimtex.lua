local M = {}

M.config = function()
    vim.g.vimtex_compiler_method = 'tectonic'
    vim.g.vimtex_view_method = 'zathura'
end

return M
