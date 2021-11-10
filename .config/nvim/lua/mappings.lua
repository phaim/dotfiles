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
        d = {"<Cmd> Telescope file_browser<CR>", "Show Directory"},
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
    },
    },{prefix = "<leader>"}
)


-- Telescope treesitter

-- Telescope symbols

-- quickfix
-- loclist
-- manpages


map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)



map("n", "<Leader>tt", [[<Cmd>tabedit %<CR>]], opt)
map("n", "<Leader>tm", [[<Cmd>tabm<Space>]], opt)
map("n", "<Leader>tn", [[<Cmd>tabnext<CR>]], opt)
map("n", "<Leader>tp", [[<Cmd>tabprev<CR>]], opt)
map("n", "<Leader>td", [[<Cmd>tabclose<CR>]], opt)
-- map("n", "<Leader>te", [[<Cmd>tabedit input()<CR>]], opt)
-- map("n", "<Leader>tm", [[<Cmd>tabmove input()<CR>]], opt)
