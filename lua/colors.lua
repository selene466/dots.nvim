vim.api.nvim_exec(
    [[
augroup Colors
    au!
    " override
    au ColorScheme * hi LineNr guifg=#5081c0
    au ColorScheme * hi CursorLineNR guifg=#FFba00 guibg=#1f2335
    au ColorScheme * hi TabLine guifg=#7aa2f7 guibg=#343455
    au ColorScheme * hi ColorColumn guibg=#1f2335

    " PLUGIN RELATED
    " "dense-analysis/ale"
    au ColorScheme * hi link ALEErrorSign TSDanger
    au ColorScheme * hi link ALEErrorLine ErrorMsg
    au ColorScheme * hi link ALEWarningSign TSWarning
    au ColorScheme * hi link ALEWarningLine ErrorMsg

    " "easymotion/vim-easymotion"
    au ColorScheme * hi link EasyMotionTarget Todo
    au ColorScheme * hi link EasyMotionShade CursorLine
    au ColorScheme * hi link EasyMotionTarget2First MatchParen
    au ColorScheme * hi link EasyMotionTarget2Second MatchParen
    au ColorScheme * hi link EasyMotionMoveHL Search
    au ColorScheme * hi link EasyMotionIncSearch Search

    " "dstein64/nvim-scrollview"
    au ColorScheme * hi  ScrollView guibg=yellow

    " "voldikss/vim-floaterm"
    au ColorScheme * hi Floaterm guibg=none
    au ColorScheme * hi FloatermBorder guibg=none guifg=cyan

augroup END
]],
    false
)
