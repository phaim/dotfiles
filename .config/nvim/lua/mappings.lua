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


-- Truezen.nvim
map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
map("n", "<leader>zf", ":TZFocus<CR>", opt)

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

wk.register({
    b = {
        name = "Buffer",
        l = {"<Cmd> Telescope buffers<CR>", "Search Buffer"},
        p = {"<Cmd> BufferLinePick<CR>", "Pick Buffer"},
        f = {"<Cmd> Telescope current_buffer_fuzzy_find<Cr>", "Fzf in buffer"},
    },
    f = {
        name = "Finding",
        f = {"<Cmd> Telescope find_files <CR>", "Search Files"},
        g = {"<Cmd> Telescope git_files <CR>", "Search Git-Files"},
        b = {"<Cmd> Telescope file_browser<CR>", "Show Directory"},
        h = {"<Cmd> Telescope help_tags<CR>", "Search Help"},
        o = {"<Cmd> Telescope oldfiles<CR>", "Search recent Files"},
        l = {"<Cmd> Telescope live_grep<CR>", "Grep"},
        s = {"<Cmd> Telescope grep_string<CR>", "Grep string under cursor"},
    },
    g = {
        Name = "Git",
        c = {"<Cmd> Telescope git_commits<CR>", "List Commits"},
        l = {"<Cmd> Telescope git_bcommits<CR>", "List Commits for current file"},
        s = {"<Cmd> Telescope git_status<CR>", "Show Status"},
        h = {"<Cmd> Telescope git_stash<CR>", "Show Stash"},

    },
    h = {
        name = "Hunk",
        l = "which_key_ignore",
        p = {"<Cmd> Gitsigns preview_hunk<CR>", "Preview Hunk"},
        s = {"<Cmd> Gitsigns stage_hunk<CR>", "Stage Hunk"},
        r = {"<Cmd> Gitsigns reset_hunk<CR>", "Reset Hunk"},
        u = {"<Cmd> Gitsigns undo_stage_hunk<CR>", "Unstage Hunk"},
        b = {"<Cmd> Gitsigns blame_line<CR>", "Blame Line"},
    },

    o = {
        name = "Organize",
        v = {"<Cmd> Neorg gtd views<CR>", "View tasks"},
        a = {"<Cmd> Neorg gtd capture<CR>", "Add task"},
        i = {"<Cmd> Neorg gtd edit<CR>", "Edit task"},
    },
    t = {
        name = "Tab",
        c = {"<Cmd> tabclose<CR>", "close tab"},
        e = {"<Cmd> tabedit %<CR>", "new tab"},
        n = {"<Cmd> tabnext<CR>", "next tab"},
        p = {"<Cmd> tabprev<CR>", "previous tab"},
        -- m = {"<Cmd> tabm input()<CR>", "move tab"},
    },


    c = {
        name = "Quickfix",
        n = {"<Cmd>cnext<CR>"},
        p = {"<Cmd>cprev<CR>"},
    },
    l = {
        name = "Location List",
        n = {"<Cmd>lne<CR>"},
        p = {"<Cmd>lpe<CR>"},
    },
    },{prefix = "<leader>"}
)


-- Telescope treesitter

-- Telescope symbols

-- quickfix
-- loclist
-- manpages

wk.register({
    ["<C-c>"] = {
        name = "Quickfix",
        n = {"<Cmd> cn<CR>"},
        p = {"<Cmd> cp<CR>"},
    },
    -- "<C-l>" = {
    --     name = "Location List",
    --     n = {"<Cmd> ln"},
    --     p = {"<Cmd> lp"},
    -- },
    }
)


map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

