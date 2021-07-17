vim.api.nvim_exec(
    [[
augroup Colors
    au!
    " override
    au ColorScheme * hi LineNr guifg=#5081c0
    au ColorScheme * hi CursorLineNR gui=bold guifg=#FFba00 guibg=#1f2335
    au ColorScheme * hi TabLine guifg=#7aa2f7 guibg=#343455
    au ColorScheme * hi ColorColumn guibg=#1f2335
    au ColorScheme * hi Search guibg=yellow guifg=black

    " --------------------------------------------------
    " PLUGIN RELATED
    " --------------------------------------------------
    " "dense-analysis/ale"
    au ColorScheme * hi link ALEErrorSign TSDanger
    au ColorScheme * hi link ALEErrorLine ErrorMsg
    au ColorScheme * hi link ALEWarningSign TSWarning
    au ColorScheme * hi link ALEWarningLine ErrorMsg

    " "phaazon/hop.nvim"
    au ColorScheme * hi HopNextKey guibg=yellow guifg=black
    au ColorScheme * hi HopNextKey1 guibg=yellow guifg=black
    au ColorScheme * hi HopNextKey2 guibg=yellow guifg=black
    au ColorScheme * hi HopUnmatched guifg=gray

    " "dstein64/nvim-scrollview"
    au ColorScheme * hi  ScrollView guibg=yellow

    " "voldikss/vim-floaterm"
    au ColorScheme * hi Floaterm guibg=none
    au ColorScheme * hi FloatermBorder guibg=none guifg=cyan

    " "andymass/vim-matchup"
    au ColorScheme * hi MatchParen gui=bold guibg=yellow guifg=black
    au ColorScheme * hi MatchWord gui=bold guibg=brown guifg=white
    au ColorScheme * hi MatchWordCur guibg=yellow guifg=black

augroup END
]],
    false
)
