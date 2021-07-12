local key_mapper = function(mode, key, result)
    vim.api.nvim_set_keymap(mode, key, result, {noremap = true, silent = true})
end
local vim = vim

-- completion tab
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
        return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_completion()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_completion()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.shift_tab_completion()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.shift_tab_completion()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close()", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {expr = true, silent = true, noremap = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true, silent = true, noremap = true})

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

key_mapper("i", "<M-1>", "1gt")
key_mapper("i", "<M-2>", "2gt")
key_mapper("i", "<M-3>", "3gt")
key_mapper("i", "<M-4>", "4gt")
key_mapper("i", "<M-5>", "5gt")
key_mapper("i", "<M-6>", "6gt")
key_mapper("i", "<M-7>", "7gt")
key_mapper("i", "<M-8>", "8gt")
key_mapper("i", "<M-9>", "9gt")
key_mapper("i", "<M-0>", "10gt")

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

key_mapper("v", "<", "<gv")
key_mapper("v", ">", ">gv")
key_mapper("v", "J", ":m '>+1<CR>gv=gv")
key_mapper("v", "K", ":m '<-2<CR>gv=gv")

key_mapper("n", "<leader>b", ":ls<CR>:b<space>")
key_mapper("n", "<leader>R", ":source $MYVIMRC<CR>")

key_mapper("n", "<C-q>", ":q!<CR>")
key_mapper("i", "<C-q>", "<Esc>:q!<CR>")
key_mapper("n", "<C-s>", ":update<CR>")
key_mapper("i", "<C-s>", "<Esc>:update<CR>")

key_mapper("t", "}}", "<C-\\><C-n>", {silent = true})
key_mapper("t", "<M-c>", "<C-\\><C-n>", {silent = true})

-- PLUGIN RELATED
-- dense-analysis/ale
key_mapper("n", "]a", ":ALENextWrap<CR>")
key_mapper("n", "[a", ":ALEPreviousWrap<CR>")
key_mapper("n", "]A", ":ALELast<CR>")
key_mapper("n", "[A", ":ALEFirst<CR>")

-- easymotion/vim-easymotion
key_mapper("", "<leader><leader>.", "<Plug>(easymotion-repeat)")
key_mapper("", "<leader>s", "<Plug>(easymotion-overwin-f)")
key_mapper("", "<leader><leader>l", "<Plug>(easymotion-overwin-line)")
key_mapper("", "<leader><leader>w", "<Plug>(easymotion-overwin-w)")
key_mapper("", "<leader>/", "<Plug>(easymotion-overwin-f2)")

-- Yggdroot/indentLine
key_mapper("", "<leader><leader>i", ":IndentLinesToggle<CR>")

-- voldikss/vim-floaterm
key_mapper("i", "<F1>", "<Esc>:FloatermToggle<CR>", {silent = true})
key_mapper("n", "tr", ":FloatermToggle<CR>", {silent = true})
key_mapper("n", "tp", ":vnew<CR>:term<CR>", {silent = true})
key_mapper("n", "tz", ":FloatermUpdate --width=1.0 --height=1.0<CR>", {silent = true})
key_mapper("n", "tZ", ":FloatermUpdate --width=0.8 --height=0.8<CR>", {silent = true})
key_mapper("t", ";;", "<C-c><C-c><C-\\><C-n>:FloatermToggle<CR>", {silent = true})
key_mapper("t", "::", "<C-\\><C-n>:FloatermToggle<CR>", {silent = true})

-- "kevinhwang91/rnvimr"
key_mapper("n", "<leader>o", ":RnvimrToggle<CR>", {silent = true})
key_mapper("t", "<leader>o", "<C-\\><C-n>:RnvimrToggle<CR>", {silent = true})
key_mapper("t", "<C-o>", "<C-\\><C-n>:RnvimrResize<CR>", {silent = true})
