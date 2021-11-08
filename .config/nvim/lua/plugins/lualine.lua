local M = {}

local function active_LSP()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
end
 
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

M.config = function()
    require('lualine').setup{
        options = {
            theme = 'gruvbox-material',
            component_separators = '',
            section_separators = {left = '', right = ''}
        },
        sections = {
            lualine_x = {'lsp_progress', 'encoding', 'filetype'},
        },
    }
end

return M
