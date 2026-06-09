--------------------------------------------------
-- Bootstrap Lazy
--------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------
-- Config
--------------------------------------------------
vim.g.mapleader = " "
vim.g.autosave = false


require("lazy").setup("plugins")
require "options"
require "mappings"
require "nvim-lsp"
require "snippets"

vim.opt.completeopt = "menu,menuone,noinsert,noselect"


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

-- vim.o.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_palette = "original"
vim.cmd.colorscheme("gruvbox-material")

-- vim.api.nvim_create_autocmd('FileType', {
--   callback = function() vim.treesitter.start() end,
-- })
--

-- function find_pdf(toml_file)
--     io.input(toml_file)
--     toml = io.read("*all")
--     name = string.find(toml, "[[output]]\n.*name=(%a+)")
--     return name.."/"..name..".pdf"
-- end
