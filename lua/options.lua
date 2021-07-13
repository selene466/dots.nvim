local o = vim.opt
local g = vim.g

o.wfw = true
o.equalalways = false
o.backup = false
o.writebackup = false
o.showmode = false
o.compatible = false
o.swapfile = false
o.undofile = true

o.relativenumber = true
o.number = true
o.syntax = "on"
o.clipboard = "unnamedplus"
o.smarttab = true
o.expandtab = true
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.colorcolumn = "79"
o.encoding = "UTF-8"
o.fileencoding = "UTF-8"
o.autoindent = true
o.smartindent = true
o.cindent = true
o.foldmethod = "indent"
o.foldlevel = 99
o.foldopen = {
    "percent",
    "search"
}
o.scrolloff = 4

o.mouse = "a"
o.hidden = true
o.guicursor = "n-v-c:block-Cursor,i:hor1-iCursor"

o.termguicolors = true
o.lazyredraw = true
o.laststatus = 2

o.linebreak = true
o.cpoptions = "n"
o.background = "dark"
o.showcmd = true
o.showtabline = 2
o.shortmess = "csF"
o.splitbelow = true
o.splitright = true
o.pumheight = 10
o.cmdheight = 1
o.updatetime = 1000
o.timeoutlen = 800
o.backspace = "indent,eol,start"
o.completeopt = {
    "menu",
    "menuone",
    "noselect",
    "noinsert"
}

o.cursorline = true
o.list = true
o.listchars = {tab = "»  ", trail = "·", precedes = "‹", extends = "›", eol = "←", nbsp = "␣"}

if
    vim.o.filetype == "html" or vim.o.filetype == "css" or vim.o.filetype == "yaml" or vim.o.filetype == "toml" or
        vim.o.filetype == "markdown"
 then
    o.tabstop = 2
    o.softtabstop = 2
    o.shiftwidth = 2
else
    o.tabstop = 4
    o.softtabstop = 4
    o.shiftwidth = 4
end

if vim.api.nvim_eval('!exists("g:syntax_on")') then
    o.syntax = "on"
end

vim.cmd("colorscheme tokyonight")
vim.cmd("filetype plugin indent off")
vim.cmd("let &showbreak = '>>> ↳ '")

-- AUTOSTART
vim.cmd("au TabLeave * let g:lasttab = tabpagenr()")
vim.cmd("au filetype html,css,yaml,markdown setlocal tabstop=2 softtabstop=2 shiftwidth=2")
vim.cmd("au TermOpen * setlocal nonumber norelativenumber")
vim.cmd("au TermOpen * startinsert")
vim.cmd("au fileType lua setlocal commentstring=--\\ %s")
vim.cmd("au fileType html setlocal commentstring=<!--\\ %s\\ -->")
vim.cmd("au fileType python setlocal commentstring=#\\ %s")
vim.cmd("au fileType php setlocal commentstring=//\\ %s")
vim.cmd("au fileType sh setlocal commentstring=#\\ %s")
vim.cmd('au fileType vim setlocal commentstring=\\"\\ %s')

-- PLUGIN RELATED
-- "nvim-treesitter/nvim-treesitter"
require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true,
        disable = {}
    },
    indent = {
        enable = false,
        disable = {}
    },
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "html",
        "java",
        "javascript",
        "json",
        "php",
        "python",
        "scss",
        "toml",
        "yaml"
    }
}

-- "folke/tokyonight.nvim"
g.tokyonight_style = "night"
g.tokyonight_terminal_colors = 1
g.tokyonight_transparent = 1
g.tokyonight_hide_inactive_statusline = 1
g.tokyonight_colors = {comment = "yellow"}
g.tokyonight_lualine_bold = true

-- "hrsh7th/nvim-compe"
require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1
    },
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = true,
        luasnip = false
    }
}

-- "norcalli/nvim-colorizer.lua"
require "colorizer".setup()

-- "Yggdroot/indentLine"
g.indentLine_color_term = 239
g.indentLine_color_gui = "#FF5555"
g.indentLine_char_list = {"▕", "┊", "┊", "┊", "┊"}
g.indentLine_leadingSpaceEnabled = 0
g.indentLine_leadingSpaceChar = "."

-- "alvan/vim-closetag"
g.closetag_xhtml_filetypes = "html, phtml, php"

-- "dense-analysis/ale"
g.ale_linters = {python = {"flake8"}, html = {"htmlhint"}}
g.ale_lint_on_text_changed = 0
g.ale_sign_error = ">>"
g.ale_sign_warning = "!!"

-- "jiangmiao/auto-pairs"
g.AutoPairs = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
    ["'"] = "'",
    ['"'] = '"',
    ["`"] = "`",
    ["```"] = "```",
    ['"""'] = '"""',
    ["'''"] = "'''",
    ["<!--"] = "-->",
    ["<?php"] = "?>"
}

-- "SirVer/ultisnips"
g.UltiSnipsExpandTrigger = "<C-l>"
g.UltiSnipsJumpForwardTrigger = "<Tab>"
g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
g.UltiSnipsRemoveSelectModeMappings = 0

-- "mattn/emmet-vim"
g.user_emmet_leader_key = "<C-c>"

-- "voldikss/vim-floaterm"
g.floaterm_keymap_toggle = "<F1>"
g.floaterm_keymap_next = "<F2>"
g.floaterm_keymap_prev = "<F3>"
g.floaterm_keymap_new = "<F4>"
g.floaterm_gitcommit = "floaterm"
g.floaterm_autoinsert = 1
g.floaterm_autohide = 0
g.floaterm_width = 0.8
g.floaterm_height = 0.8
g.floaterm_wintitle = 0
g.floaterm_title = "Terminal: $1/$2"
g.floaterm_autoclose = 1
g.floaterm_borderchars = {"═", "║", "═", "║", "╔", "╗", "╝", "╚"}

-- "sbdchd/neoformat"
g.neoformat_basic_format_retab = 1
g.neoformat_basic_format_trim = 1
g.neoformat_basic_format_align = 1

-- "webdevel/tabulous"
g.tabulousLabelNameOptions = ":t"
g.tabulousLabelNumberStr = ":"

-- "hoob3rt/lualine.nvim"
local Modem = {}
Modem.map = {
    ["n"] = " N ",
    ["no"] = "   ",
    ["nov"] = "   ",
    ["noV"] = "   ",
    ["no"] = "   ",
    ["niI"] = " N ",
    ["niR"] = " N ",
    ["niV"] = " N ",
    ["v"] = " V ",
    ["V"] = "VL ",
    [""] = "VB ",
    ["s"] = " S ",
    ["S"] = "SL ",
    [""] = "SB ",
    ["i"] = " I ",
    ["ic"] = " I ",
    ["ix"] = " I ",
    ["R"] = " R ",
    ["Rc"] = " R ",
    ["Rv"] = "VR ",
    ["Rx"] = " R ",
    ["c"] = " C ",
    ["cv"] = "EX ",
    ["ce"] = "EX ",
    ["r"] = " R ",
    ["rm"] = "   ",
    ["r?"] = " ? ",
    ["!"] = " S ",
    ["t"] = " T "
}
function modem_get_mode()
    local modem_code = vim.api.nvim_get_mode().mode
    if Modem.map[mode_code] == nil then
        return modem_code
    end
    return Modem.map[mode_code]
end

function locations()
    return [[LINE: %3l/%-3L COL: %-3c]]
end

require "lualine".setup {
    options = {
        icons_enabled = false,
        theme = "tokyonight",
        component_separators = {"", ""},
        section_separators = {"", ""},
        upper = true,
        color = {},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {{"filename", color = "TermCursorNC", upper = false}},
        lualine_x = {{"encoding"}, {"fileformat", upper = false}, {"filetype", upper = false, color = "TabLineSel"}},
        lualine_y = {{locations, color = "WarningMsg"}},
        lualine_z = {modem_get_mode}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- "kevinhwang91/rnvimr"
g.rnvimr_enable_picker = 1

-- "folke/which-key.nvim"
require "which-key".setup()

-- "lewis6991/gitsigns.nvim"
require "gitsigns".setup()
