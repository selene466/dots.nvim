local key_mapper = function(mode, key, result, exp)
    if exp == 1 then
        vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true, expr = true})
    else
        vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
    end
end
local vim = vim

-----------------------------------------------------
-- nvim-compe completion tab with UltiSnips
-----------------------------------------------------
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local is_prior_char_whitespace = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_completion = function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
    elseif vim.fn["UltiSnips#CanExpandSnippet"]() == 1 or vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>", true, true, true)
    elseif is_prior_char_whitespace() then
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
    else
        return vim.fn["compe#complete"]()
    end
end
_G.shift_tab_completion = function()
    if vim.fn.pumvisible() == 1 then
        return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
    elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return vim.api.nvim_replace_termcodes("<C-R>=UltiSnips#JumpBackwards()<CR>", true, true, true)
    else
        return vim.api.nvim_replace_termcodes("<Tab>", true, true, true)
    end
end

key_mapper("i", "<Tab>", "v:lua.tab_completion()", 1)
key_mapper("s", "<Tab>", "v:lua.tab_completion()", 1)
key_mapper("i", "<S-Tab>", "v:lua.shift_tab_completion()", 1)
key_mapper("s", "<S-Tab>", "v:lua.shift_tab_completion()", 1)
key_mapper("i", "<C-Space>", "compe#complete()", 1)
key_mapper("i", "<CR>", "compe#confirm('<CR>')", 1)
key_mapper("i", "<C-e>", "compe#close()", 1)
key_mapper("i", "<C-f>", "compe#scroll({ 'delta': +4 })", 1)
key_mapper("i", "<C-d>", "compe#scroll({ 'delta': -4 })", 1)

-----------------------------------------------------

key_mapper("n", "<F5>", ":tabnext<CR>")
key_mapper("i", "<F5>", "<Esc>:tabnext<CR>")

key_mapper("n", "<F6>", ":tabprevious<CR>")
key_mapper("i", "<F6>", "<Esc>:tabprevious<CR>")

key_mapper("n", "<F8>", ":tabnew<CR>")
key_mapper("i", "<F8>", "<Esc>:tabnew<CR>")

key_mapper("n", "<F7>", ":tabm +1<CR>")
key_mapper("i", "<F7>", "<Esc>:tabm +1<CR>")

key_mapper("n", "<F9>", ":tabclose<CR>")
key_mapper("i", "<F9>", "<Esc>:tabclose<CR>")

key_mapper("n", "<F11>", ":tabm -1<CR>")
key_mapper("i", "<F11>", "<Esc>:tabm -1<CR>")

key_mapper("n", "<F12>", ":set hlsearch!<CR>")
key_mapper("i", "<F12>", "<Esc>:set hlsearch!<CR>")

key_mapper("i", "kj", '<Esc>l:echo "Esc"<CR>')

key_mapper("", "<M-1>", "1gt")
key_mapper("", "<M-2>", "2gt")
key_mapper("", "<M-3>", "3gt")
key_mapper("", "<M-4>", "4gt")
key_mapper("", "<M-5>", "5gt")
key_mapper("", "<M-6>", "6gt")
key_mapper("", "<M-7>", "7gt")
key_mapper("", "<M-8>", "8gt")
key_mapper("", "<M-9>", "9gt")
key_mapper("", "<M-0>", "10gt")

key_mapper("i", "<M-1>", "<Esc>1gt")
key_mapper("i", "<M-2>", "<Esc>2gt")
key_mapper("i", "<M-3>", "<Esc>3gt")
key_mapper("i", "<M-4>", "<Esc>4gt")
key_mapper("i", "<M-5>", "<Esc>5gt")
key_mapper("i", "<M-6>", "<Esc>6gt")
key_mapper("i", "<M-7>", "<Esc>7gt")
key_mapper("i", "<M-8>", "<Esc>8gt")
key_mapper("i", "<M-9>", "<Esc>9gt")
key_mapper("i", "<M-0>", "<Esc>10gt")

key_mapper("", "<M-Tab>", ':exe "tabn ".g:lasttab<cr><CR>')
key_mapper("", "<Tab>", ":tabn<CR>")
key_mapper("", "<S-Tab>", ":tabprev<CR>")

key_mapper("", "<leader>h", ":wincmd h<CR>")
key_mapper("", "<leader>j", ":wincmd j<CR>")
key_mapper("", "<leader>k", ":wincmd k<CR>")
key_mapper("", "<leader>l", ":wincmd l<CR>")
key_mapper("", "<leader>q", ":wincmd W<CR>")
key_mapper("", "<leader><Tab>", ":wincmd p<CR>")
key_mapper("", "<leader>z", ":wincmd _<Enter><Esc>:wincmd \\|<CR>")
key_mapper("", "<leader>a", ":wincmd =<CR>")

key_mapper("n", "<Up>", "gk")
key_mapper("n", "<Down>", "gj")
key_mapper("n", "<S-Up>", "B")
key_mapper("n", "<S-Right>", "g$")
key_mapper("n", "<S-Left>", "g0")
key_mapper("n", "<S-Down>", "W")

key_mapper("v", "<", "<gv")
key_mapper("v", ">", ">gv")
key_mapper("v", "<C-j>", ":m '>+1<CR>gv=gv")
key_mapper("v", "<C-k>", ":m '<-2<CR>gv=gv")

key_mapper("n", "<leader>b", ":ls<CR>:b<space>")
key_mapper("n", "<leader>r", ":source $MYVIMRC<CR>")

key_mapper("n", "<C-q>", ":q!<CR>")
key_mapper("i", "<C-q>", "<Esc>:q!<CR>")
key_mapper("n", "<C-s>", ":update<CR>")
key_mapper("i", "<C-s>", "<Esc>:update<CR>")

key_mapper("t", "<M-c>", "<C-\\><C-n>")

-----------------------------------------------------
-- PLUGIN RELATED
-----------------------------------------------------
-- "dense-analysis/ale"
key_mapper("n", "[a", ":ALENextWrap<CR>")
key_mapper("n", "]a", ":ALEPreviousWrap<CR>")
key_mapper("n", "[A", ":ALELast<CR>")
key_mapper("n", "]A", ":ALEFirst<CR>")
key_mapper("n", "<leader><leader>f", ":ALEFix<CR>")

-- "phaazon/hop.nvim"
key_mapper("n", "<leader>/", ":HopPattern<CR>")
key_mapper("n", "<leader>n", ":HopLine<CR>")
key_mapper("n", "<leader>s", ":HopChar1<CR>")
key_mapper("n", "<leader>w", ":HopWord<CR>")

-- "Yggdroot/indentLine"
key_mapper("", "<leader><leader>i", ":IndentLinesToggle<CR>")

-- "voldikss/vim-floaterm"
key_mapper("i", "<F1>", "<Esc>:FloatermToggle<CR>")
key_mapper("n", "tr", ":FloatermToggle<CR>")
key_mapper("n", "tp", ":vnew<CR>:term<CR>")
key_mapper("n", "tz", ":FloatermUpdate --width=1.0 --height=1.0<CR>")
key_mapper("n", "tZ", ":FloatermUpdate --width=0.8 --height=0.8<CR>")
key_mapper("t", ";;", "<C-c><C-c><C-\\><C-n>:FloatermToggle<CR>")
key_mapper("t", "::", "<C-\\><C-n>:FloatermToggle<CR>")

-- "kevinhwang91/rnvimr"
key_mapper("n", "<leader>o", ":RnvimrToggle<CR>")
key_mapper("t", "<leader>o", "<C-\\><C-n>:RnvimrToggle<CR>")
key_mapper("t", "<M-o>", "<C-\\><C-n>:RnvimrResize<CR>")

-- "lewis6991/gitsigns.nvim"
key_mapper("n", "[h", ":Gitsigns next_hunk<CR>")
key_mapper("n", "]h", ":Gitsigns prev_hunk<CR>")
key_mapper("n", "<leader><leader>h", ":Gitsigns preview_hunk<CR>")
