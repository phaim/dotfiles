vim.g.mapleader = " "
vim.g.autosave = false

require("packages")

-- nvim-treesitter (main branch) puts queries in runtime/ rather than the
-- plugin root, but doesn't add that subdirectory to runtimepath itself.
do
    local dir = vim.fn.stdpath("data") .. "/site/pack/core/opt/nvim-treesitter/runtime"
    if vim.fn.isdirectory(dir) == 1 then
        vim.opt.rtp:prepend(dir)
    end
end

-- Treesitter: enable highlighting/indents per filetype
vim.treesitter.language.register("bash", "sh")
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("tree-sitter-enable", { clear = true }),
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then return end
    if vim.treesitter.query.get(lang, "highlights") then
      vim.treesitter.start(args.buf)
    end
    if vim.treesitter.query.get(lang, "indents") then
      vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
    end
  end,
})

-- Colorscheme globals (must be set before loading the theme)
vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_palette = "original"

-- Simple plugin setups
require("lsp_signature").setup { hint_prefix = " ", handler_opts = { border = "none" } }
require("neogit").setup()
require("gitsigns").setup()
require("nvim-autopairs").setup()
require("nvim-tree").setup()
require("which-key").setup()
require("neoscroll").setup()


local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "IblIndentDim", { fg = "#504945", nocombine = true })
    vim.api.nvim_set_hl(0, "IblScopeDim",  { fg = "#7c6f64", nocombine = true })
end)
require("ibl").setup({
    indent = { highlight = {"IblIndentDim" }, char='▏'},
    scope  = { highlight = "IblScopeDim" },
})

require("toggleterm").setup { open_mapping = [[<c-\>]] }
require("nvim-dap-virtual-text").setup()
require("treesitter-context").setup({enable=false})

-- LuaSnip
local ls = require("luasnip")
vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then ls.change_choice(1) end
end, { silent = true })
require("luasnip.loaders.from_vscode").lazy_load()

-- Plugin configs
require("config.telescope").config()
require("config.nvim-cmp").config()
require("config.dap").config()
require("config.vimtex").config()
require("config.bufferline").config()
require("config.lualine").config()

-- Core
require "options"
require "mappings"
require "nvim-lsp"
require "snippets"

vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.cmd.colorscheme("gruvbox-material")
