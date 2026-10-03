local M = {}

M.config = function()
    -- vim.g.vimtex_compiler_method = 'tectonic'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_quickfix_ignore_filters = {'Underfull', 'Overfull'}
    vim.g.vimtex_quickfix_open_on_warning = 0

    vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vimtex-conceal", { clear = true }),
        pattern = "tex",
        callback = function() vim.opt_local.conceallevel = 2 end,
    })
end

return M
