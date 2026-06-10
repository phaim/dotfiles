-- Buffer-local LSP keymaps, applied whenever any server attaches.
-- Using LspAttach (instead of a per-server on_attach) means these survive
-- even for servers that define their own on_attach, e.g. julials.
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        require("lsp_signature").on_attach()

        local opts = { buffer = args.buf, silent = true }
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

        -- Inlay hints on by default, with a toggle.
        vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
        vim.keymap.set("n", "<leader>th", function()
            local on = vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf })
            vim.lsp.inlay_hint.enable(not on, { bufnr = args.buf })
        end, { buffer = args.buf, silent = true, desc = "Toggle inlay hints" })

        -- Call hierarchy.
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls,
            { buffer = args.buf, silent = true, desc = "Incoming calls" })
        vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls,
            { buffer = args.buf, silent = true, desc = "Outgoing calls" })

        -- basedpyright: organize imports (command exists only on python buffers).
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "basedpyright" then
            vim.keymap.set("n", "<leader>lo", "<Cmd>LspPyrightOrganizeImports<CR>",
                { buffer = args.buf, silent = true, desc = "Organize imports" })
        end
    end,
})

-- which-key descriptions + LSP navigation maps.
require("which-key").add({
    { "<leader>l", group = "LSP" },
    { "<leader>lr", "<Cmd>Telescope lsp_references<CR>", desc = "Show references" },
    { "<leader>ld", "<Cmd>Telescope lsp_definitions<CR>", desc = "Show definition" },
    { "<leader>ls", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "Show document symbols" },
    { "<leader>lw", "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "Show workspace symbols (live)" },
    { "<leader>k", vim.lsp.buf.hover, desc = "hover" },

    { "gd", vim.lsp.buf.definition, desc = "go to definition" },
    { "gD", vim.lsp.buf.declaration, desc = "go to declaration" },
    { "gi", vim.lsp.buf.implementation, desc = "go to implementation" },
})

-- Defaults shared by every server (merged with each server's own config).
vim.lsp.config("*", {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    root_markers = { ".git" },
})

-- Python type-checking + completion. basedpyright auto-detects the project
-- venv (.venv, or an active VIRTUAL_ENV), so no manual environment wiring
-- is needed. Its default "recommended" mode is strict; "standard" matches
-- pyright and is a gentler starting point coming from pylsp.
vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "basic",
            },
        },
    },
})

-- LaTeX: build with tectonic, forward-search with zathura.
vim.lsp.config("texlab", {
    settings = {
        texlab = {
            build = {
                executable = "tectonic",
                args = {
                    "-X",
                    "compile",
                    "main.tex",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                },
                onSave = true,
            },
            forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
            },
        },
    },
})

-- Julia: prefer the julia binary from the dedicated LSP environment if present.
local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
if vim.fn.executable(julia) == 1 then
    local cmd = vim.deepcopy(vim.lsp.config.julials.cmd)
    cmd[1] = julia
    vim.lsp.config("julials", { cmd = cmd })
end

vim.lsp.enable({ "julials", "ccls", "rust_analyzer", "texlab", "basedpyright" })
