local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]
--

-- Turn off search highlighting
map("n", "<leader>h", [[ <Cmd> noh<CR>]], opt)

-- Reload file
map("n", "<F5>", [[ <Cmd> source %<CR>]], opt)

-- Window movement
-- for c in {'h', 'j', 'k', 'l', 'o'} do
--    map("n", "<C-"..c..">", ) 
-- end

map("n", "<C-h>", [[<C-W><C-h>]], opt)
map("n", "<C-j>", [[<C-W><C-j>]], opt)
map("n", "<C-k>", [[<C-W><C-k>]], opt)
map("n", "<C-l>", [[<C-W><C-l>]], opt)


map("n", "<C-H>", [[<C-W><C-H>]], opt)
map("n", "<C-J>", [[<C-W><C-J>]], opt)
map("n", "<C-K>", [[<C-W><C-K>]], opt)
map("n", "<C-L>", [[<C-W><C-L>]], opt)

-- OPEN TERMINALS --
-- map("n", "<C-l>", [[<Cmd>vnew term://bash <CR>]], opt) -- term over right
-- map("n", "<C-x>", [[<Cmd> split term://bash | resize 10 <CR>]], opt) --  term bottom
-- map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- term newtab

-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu! rnu!<CR>]], opt)

-- Truezen.nvim
-- map("n", "<leader>zz", ":TZAtaraxis<CR>", opt)
-- map("n", "<leader>zm", ":TZMinimalist<CR>", opt)
-- map("n", "<leader>zf", ":TZFocus<CR>", opt)

-- Commenter Keybinding
-- map("n", "<leader>/", ":CommentToggle<CR>",jopt)
-- map("v", "<leader>/", ":CommentToggle<CR>", opt)

-- compe stuff
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

--  compe mappings
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})

-- nvimtree
map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)

-- minimap
map("n", "<C-m>", ":MinimapToggle<CR>", opt)

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
