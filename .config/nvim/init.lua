--------------------------------------------------
-- Bootstrap Packer
--------------------------------------------------
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.api.nvim_command 'packadd packer.nvim'
end

--------------------------------------------------
-- Config
--------------------------------------------------
vim.g.mapleader = " "
vim.g.autosave = false

require "pluginlist"
require "options"
require "mappings"
require "nvim-lsp"
require "snippets"


-- local ft_str = 
--     table.concat(
--         vim.tbl_map(
--             function(ft)
--                 return configs[ft].filetype or ft
--             end,
--             require("nvim-treesitter.parsers").parsers.availible_parsers()
--         ),
--         ","
-- )
-- vim.cmd("autocmd Filetype python setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")
-- vim.cmd("autocmd Filetype " .. ft_str .. "setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr()")

vim.o.background = "dark"
--vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_palette = "original"
vim.cmd([[colorscheme gruvbox-material]])



-- function find_pdf(toml_file)
--     io.input(toml_file)
--     toml = io.read("*all")
--     name = string.find(toml, "[[output]]\n.*name=(%a+)")
--     return name.."/"..name..".pdf"
-- end
