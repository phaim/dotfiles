local map = require('utils').map
local opt = {}


-- Turn off search highlighting
map("n", "<leader>hl", [[ <Cmd> noh<CR>]], opt)

-- Reload file
map("n", "<F5>", [[ <Cmd> source %<CR>]], opt)

--Edit file under cursor
map("n", "gf", "<Cmd> e <cfile><CR>", opt)

-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu! rnu!<CR>]], opt)

-- Terminal
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- TODO opening terminals right, bottom, new tab

-- Window movement
for _, c in ipairs({'h', 'j', 'k', 'l'}) do
    map("n", "<C-"..c..">", "<C-W>"..c.."", opt) 
    map("t", "<C-"..c..">", "<C-\\><C-n><C-W>"..c.."", opt)
end

-- Buffers
map("n", "<leader><leader>n", ":bn<CR>", opt)
map("n", "<leader><leader>p", ":bp<CR>", opt)

-- Truezen.nvim
-- map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
-- map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
-- map("n", "<leader>zf", ":TZFocus<CR>", opt)

-- Commenter Keybinding
-- map("n", "<leader>/", ":CommentToggle<CR>", opt)
-- map("v", "<leader>/", ":CommentToggle<CR>", opt)


-- nvimtree
-- map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- format code
-- map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

-- map("n", "<C-s>l", [[<Cmd> SessionLoad<CR>]], opt)
-- map("n", "<C-s>s", [[<Cmd> SessionSave<CR>]], opt)

-- finding stuff
local wk = require("which-key")

wk.add({
    {
        -- group = {"Buffer"},
        {"<leader>b", group="Buffer"},
        {"<leader>bl", "<Cmd> Telescope buffers<CR>", desc="Search Buffer"},
        {"<leader>bp", "<Cmd> BufferLinePick<CR>", desc="Pick Buffer"},
        {"<leader>bf", "<Cmd> Telescope current_buffer_fuzzy_find<CR>", desc="Fzf in buffer"},
        {"<leader>bc", "<Cmd> %bd|e#|bd#<CR>", desc="Delete all but current buffer"},
    },

    {
        {"<leader>f", group="Finding"},
        {"<leader>ft", "<Cmd> NvimTreeToggle<CR>", desc="toggle file tree"},
        {"<leader>ff", "<Cmd> Telescope find_files <CR>", desc="Search Files"},
        {"<leader>fg", "<Cmd> Telescope git_files <CR>", desc="Search Git-Files"},
        {"<leader>fb", "<Cmd> Telescope file_browser<CR>", desc="Show Directory"},
        {"<leader>fh", "<Cmd> Telescope help_tags<CR>", desc="Search Help"},
        {"<leader>fo", "<Cmd> Telescope oldfiles<CR>", desc="Search recent Files"},
        {"<leader>fl", "<Cmd> Telescope live_grep<CR>", desc="Grep"},
        {"<leader>fs", "<Cmd> Telescope grep_string<CR>", desc="Grep string under cursor"},
    },

    {
        {"<leader>g", group="Git"},
        {"<leader>gg", "<Cmd> Neogit<CR>", desc="Open Neogit"},
        {"<leader>gc", "<Cmd> Telescope git_commits<CR>", desc="List Commits"},
        {"<leader>gl", "<Cmd> Telescope git_bcommits<CR>", desc="List Commits for current file"},
        {"<leader>gs", "<Cmd> Telescope git_status<CR>", desc="Show Status"},
        {"<leader>gh", "<Cmd> Telescope git_stash<CR>", desc="Show Stash"},
    },

    {
        {"<leader>h", group="Hunk"},
        {"<leader>hl", hidden=true},
        {"<leader>hp", "<Cmd> Gitsigns preview_hunk<CR>", desc="Preview Hunk"},
        {"<leader>hs", "<Cmd> Gitsigns stage_hunk<CR>", desc="Stage Hunk"},
        {"<leader>hr", "<Cmd> Gitsigns reset_hunk<CR>", desc="Reset Hunk"},
        {"<leader>hu", "<Cmd> Gitsigns undo_stage_hunk<CR>", desc="Unstage Hunk"},
        {"<leader>hb", "<Cmd> Gitsigns blame_line<CR>", desc="Blame Line"},
    },

    {
        {"<leader>d", group="Debug"},
        {"<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc="Toggle breakpoint"},
        {"<leader>dB", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc="Set breakpoint"},
        {"<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", desc="Open REPL"},
        {"<leader>dl", "<Cmd>lua require'dap'.run_last()<CR>", desc="Run last"},
        {"<leader>du", "<Cmd>lua require'dapui'.open()<CR>", desc="Open UI"},
    },
        -- l = {"<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "Set logpoint"},

    -- m = {
    --     name = "Mind",
    --     o = {"<Cmd> MindOpenMain<CR>", "Open Main"},
    --     p = {"<Cmd> MindOpenSmartProject<CR>", "Open Project"},
    --     c = {"<Cmd> MindClose<CR>", "Close"},
    -- },

    -- o = {
    --     name = "Organize",
    --     v = {"<Cmd> Neorg gtd views<CR>", "View tasks"},
    --     a = {"<Cmd> Neorg gtd capture<CR>", "Add task"},
    --     i = {"<Cmd> Neorg gtd edit<CR>", "Edit task"},
    -- },
    {
        {"<leader>t", group="Tab"},
        {"<leader>tc", "<Cmd> tabclose<CR>", desc="close tab"},
        {"<leader>te", "<Cmd> tabedit %<CR>", desc="new tab"},
    },
    -- {"<leader>tb", "<Cmd> tabnew|b#|bd#<CR>", "open current buffer in new tab"},
    -- m = {"<Cmd> tabm input()<CR>", "move tab"},

    {
        {"<leader>c", group="Quickfix"},
        {"<leader>cn", "<Cmd>cnext<CR>"},
        {"<leader>cp", "<Cmd>cprev<CR>"},
    },

    -- {"<leader>l", group="Location List"},
    -- {"<leader>ln", "<Cmd>lne<CR>"},
    -- {"<leader>lp", "<Cmd>lpe<CR>"},

    {
        { "<C-c>", group = "Quickfix" },
        { "<C-c>n", desc = "<Cmd> cn<CR>" },
        { "<C-c>p", desc = "<Cmd> cp<CR>" },
    },

    { "<F7>", "<cmd>lua require'dap'.step_into()<CR>", desc = "DAP step into" },
    { "<F8>", "<cmd>lua require'dap'.continue()<CR>", desc = "DAP continue" },
    { "<F9>", "<cmd>lua require'dap'.step_out()<CR>", desc = "DAP step out" },
    { "<F10>", "<cmd>lua require'dap'.step_over()<CR>", desc = "DAP step over" }
})


-- Telescope treesitter

-- Telescope symbols

-- quickfix
-- loclist
-- manpages

