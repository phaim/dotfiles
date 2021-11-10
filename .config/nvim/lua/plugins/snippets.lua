local M = {}

M.config = function()
    local function prequire(...)
    local status, lib = pcall(require, ...)
    if (status) then return lib end
        return nil
    end

    local luasnip = prequire('luasnip')
    local cmp = prequire("cmp")

    luasnip.config.set_config {
        history = true,
        updateevents = 'TextChanged,TextChangedI',
    }

end

return M
