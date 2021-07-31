local o = vim.opt
local g = vim.g

-----------------------------------------------------
-- Map leader key to space
-----------------------------------------------------
g.mapleader = " "
g.maplocalleader = " "

-----------------------------------------------------
-- Options
-----------------------------------------------------
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
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
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
o.listchars = {
    tab = "»  ",
    trail = "·",
    precedes = "‹",
    extends = "›",
    eol = "←",
    nbsp = "␣"
}

-- disable builtin plugins I don't use
g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logiPat = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_netrw = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_rrhelper = 1
g.loaded_spec = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.no_gitrebase_maps = 1

vim.cmd([[filetype plugin indent on]])
vim.cmd([[let &showbreak = '>>>   ']])

-----------------------------------------------------
-- AUTOCMD
-----------------------------------------------------
vim.cmd([[colorscheme tokyonight]])
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
vim.cmd([[au BufEnter * if &l:buftype ==# 'nofile' | exe ":IndentLinesDisable" | endif]])
vim.cmd([[au TermOpen * setlocal nonumber norelativenumber]])
vim.cmd([[au TermOpen * startinsert]])
vim.cmd([[au TermOpen * IndentLinesDisable]])
vim.cmd([[au TabLeave * let g:lasttab = tabpagenr()]])
vim.cmd([[au fileType lua setlocal commentstring=--\ %s]])
vim.cmd([[au fileType html setlocal commentstring=<!--\ %s\ --> | EmmetInstall]])
vim.cmd([[au fileType python setlocal commentstring=#\ %s]])
vim.cmd([[au fileType php setlocal commentstring=//\ %s]])
vim.cmd([[au fileType sh setlocal commentstring=#\ %s]])
vim.cmd([[au fileType vim setlocal commentstring=\"\ %s]])

-----------------------------------------------------
-- PLUGIN RELATED
-----------------------------------------------------
-- "nvim-treesitter/nvim-treesitter"
require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true,
        disable = {}
    },
    matchup = {
        enable = true
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
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    preselect = "enable",
    resolve_timeout = 800,
    source_timeout = 200,
    throttle_time = 80,
    documentation = {
        border = {"", "", "", " ", "", "", "", " "}, -- the border option is the same as `|help nvim_open_win|`
        max_height = math.floor(vim.o.lines * 0.3),
        max_width = 120,
        min_height = 1,
        min_width = 60,
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder"
    },
    source = {
        buffer = true,
        calc = true,
        luasnip = false,
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        ultisnips = true,
        vsnip = false
    }
}

-- "kabouzeid/nvim-lspinstall"
-- prevent LSP to autostart, unless I need it
-- start with ":Lspp"
vim.api.nvim_exec(
    [[
function! LSPP()
lua << EOF
    require "lspinstall".setup() -- important

    local servers = require "lspinstall".installed_servers()
    for _, server in pairs(servers) do
        require "lspconfig"[server].setup {}
    end
EOF
  exe ":LspStart"
endfunction

command Lspp :call LSPP()
]],
    true
)

-- "norcalli/nvim-colorizer.lua"
require "colorizer".setup()

-- "Yggdroot/indentLine"
g.indentLine_char_list = {"▕", "┊", "┊", "┊", "┊"}
g.indentLine_color_gui = "#FF5555"
g.indentLine_color_term = 239
g.indentLine_leadingSpaceChar = "."
g.indentLine_leadingSpaceEnabled = 0

-- "alvan/vim-closetag"
g.closetag_xhtml_filetypes = "html, phtml, php"

-- "dense-analysis/ale"
g.ale_linters = {
    html = {"htmlhint"},
    javascript = {"eslint"},
    python = {"flake8"}
}
g.ale_fixers = {
    c = {"clang-format"},
    cpp = {"clang-format"},
    css = {"prettier"},
    html = {"prettier"},
    java = {"clang-format"},
    javascript = {"prettier"},
    json = {"prettier"},
    lua = {"luafmt"},
    markdown = {"prettier"},
    python = {"black"},
    scss = {"prettier"},
    yaml = {"prettier"}
}
g.ale_javascript_prettier_options = "--prose-wrap always"
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
g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
g.UltiSnipsJumpForwardTrigger = "<Tab>"
g.UltiSnipsRemoveSelectModeMappings = 0

-- "mattn/emmet-vim"
g.user_emmet_install_global = 0
g.user_emmet_leader_key = "<C-c>"

-- "voldikss/vim-floaterm"
g.floaterm_autoclose = 1
g.floaterm_autohide = 0
g.floaterm_autoinsert = 1
g.floaterm_borderchars = {"═", "║", "═", "║", "╔", "╗", "╝", "╚"}
g.floaterm_gitcommit = "floaterm"
g.floaterm_keymap_toggle = "<F1>"
g.floaterm_keymap_next = "<F2>"
g.floaterm_keymap_prev = "<F3>"
g.floaterm_keymap_new = "<F4>"
g.floaterm_title = "Terminal: $1/$2"
g.floaterm_wintitle = 0
g.floaterm_width = 0.8
g.floaterm_height = 0.8

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
        color = {},
        component_separators = {"", ""},
        disabled_filetypes = {},
        icons_enabled = false,
        section_separators = {"", ""},
        theme = "tokyonight"
    },
    sections = {
        lualine_a = {{"mode", upper = true}},
        lualine_b = {"branch"},
        lualine_c = {{"filename", color = "TermCursorNC"}},
        lualine_x = {
            {"encoding"},
            {"fileformat"},
            {"filetype", color = "TabLineSel"}
        },
        lualine_y = {{locations, color = "WarningMsg"}},
        lualine_z = {{modem_get_mode, upper = true}}
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

-- "andymass/vim-matchup"
g.matchup_matchparen_deferred = 1
g.matchup_matchparen_hi_surround_always = 1
g.matchup_matchparen_offscreen = {method = "popup"}
