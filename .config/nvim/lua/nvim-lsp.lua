-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
     require "lsp_signature".on_attach()

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    --See `:help vim.lsp.*` for documentation on any of the below functions
    --buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', '<leader>k', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    

    local wk = require("which-key")
    wk.register({
        ["<leader>"] = {
            l = {
                name = "LSP",
                r = {"<Cmd> Telescope lsp_references<CR>", "Show references"},
                d = {"<Cmd> Telescope lsp_definitions<CR>", "Show definition"},
                s = {"<Cmd> Telescope lsp_document_symbols<CR>", "Show document symbols"},
                w = {"<Cmd> Telescope lsp_workspace_symbols<CR>", "Show workspace symbols"},
            },
            k = {"<Cmd> lua vim.lsp.buf.hover()<CR>", "hover"},

        },
        g = {
            name = "goto",
            d = {"<Cmd> lua vim.lsp.buf.definition()<CR>", "go to definition"},
            D = {"<Cmd> lua vim.lsp.buf.declaration()<CR>", "go to declaration"},
            i = {"<Cmd> lua vim.lsp.buf.implementation()<CR>", "go to implementation"},
        },
        },{buffer = bufnr,}
    )
end


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {"pylsp", "julials", "ccls", "rust_analyzer", "texlab"}
-- capabilities added by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
 for _, lsp in ipairs(servers) do
    require("lspconfig")[lsp].setup {
     on_attach = on_attach,
     flags = {
       debounce_text_changes = 150,
     },
     capabilities = capabilities,
   }
 end

require("lspconfig").texlab.setup{
    settings = {
        texlab = {
            build = {
                executable = 'tectonic',
                args = {
                    "-X",
                    "compile",
                    "main.tex",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates"
                },
                onSave = true,
                -- forwardSearchAfter = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = {"--synctex-forward", "%l:1:%f", "%p"}
            }
        }
    }
}


-- require'lspconfig'.julials.setup{
--    on_new_config = function(new_config, _)
--        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
--        if require'lspconfig'.util.path.is_file(julia) then
--            new_config.cmd[1] = julia
--        end
--    end
--}
