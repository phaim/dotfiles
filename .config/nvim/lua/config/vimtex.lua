local M = {}

M.config = function()
    -- vim.g.vimtex_compiler_method = 'tectonic'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_ignore_filters = {'Underfull', 'Overfull'}
end

return M
