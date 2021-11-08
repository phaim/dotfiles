local map = require('utils').map
local opt = {}

-- Turn off search highlighting
map("n", "<leader>h", [[ <Cmd> noh<CR>]], opt)

-- Reload file
map("n", "<F5>", [[ <Cmd> source %<CR>]], opt)

-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu! rnu!<CR>]], opt)

-- Window movement
for _, c in ipairs({'h', 'j', 'k', 'l'}) do
    map("n", "<C-"..c..">", "<C-W><C-"..c..">", opt) 
end

-- OPEN TERMINALS --
-- map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- term over right
-- map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom
-- map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab


-- Truezen.nvim
map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
map("n", "<leader>zf", ":TZFocus<CR>", opt)

-- Commenter Keybinding
-- map("n", "<leader>/", ":CommentToggle<CR>",jopt)
-- map("v", "<leader>/", ":CommentToggle<CR>", opt)


-- nvimtree
-- map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- format code
-- map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

-- dashboard stuff
-- map("n", "<Leader>fw", [[<Cmd> Telescope live_grep<CR>]], opt)
-- map("n", "<Leader>db", [[<Cmd> Dashboard<CR>]], opt)
-- map("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], opt)
-- map("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]], opt)
-- map("n", "<C-s>l", [[<Cmd> SessionLoad<CR>]], opt)
-- map("n", "<C-s>s", [[<Cmd> SessionSave<CR>]], opt)

-- Telescope
map("n", "<Leader>st", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>ff", [[<Cmd> Telescope find_files <CR>]], opt)
-- map("n", "<Leader>fp", [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]], opt)
map("n", "<Leader>bl", [[<Cmd> Telescope buffers<CR>]], opt)
map("n", "<Leader>fb", [[<Cmd> Telescope file_browser<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd> Telescope help_tags<CR>]], opt)
map("n", "<Leader>fo", [[<Cmd> Telescope oldfiles<CR>]], opt)
map("n", "<Leader>gr", [[<Cmd> Telescope live_grep<CR>]], opt)
map("n", "<Leader>gs", [[<Cmd> Telescope grep_string<CR>]], opt)

-- bufferline tab stuff
map("n", "<Leader>bp", [[<Cmd>BufferLinePick<CR>]])

map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)


map("n", "<Leader>tt", [[<Cmd>tabedit %<CR>]], opt)
map("n", "<Leader>tm", [[<Cmd>tabm<Space>]], opt)
map("n", "<Leader>tn", [[<Cmd>tabnext<CR>]], opt)
map("n", "<Leader>tp", [[<Cmd>tabprev<CR>]], opt)
map("n", "<Leader>td", [[<Cmd>tabclose<CR>]], opt)
-- map("n", "<Leader>te", [[<Cmd>tabedit input()<CR>]], opt)
-- map("n", "<Leader>tm", [[<Cmd>tabmove input()<CR>]], opt)
