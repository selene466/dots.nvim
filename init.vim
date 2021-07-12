
" map leader key to space
nnoremap <Space> <Nop>
let g:mapleader = " "
let g:maplocalleader = " "

" disable builtin plugins I don't use
let g:loaded_gzip         = 1
let g:loaded_tar          = 1
let g:loaded_tarPlugin    = 1
let g:loaded_zipPlugin    = 1
let g:loaded_2html_plugin = 1
let g:loaded_netrw        = 1
let g:loaded_netrwPlugin  = 1
let g:loaded_matchit      = 1
let g:loaded_matchparen   = 1
let g:loaded_spec         = 1

" RUNTIME
" lua require('plugins')
runtime! lua/plugins.lua
runtime! lua/options.lua
runtime! lua/keymaps.lua

" "kabouzeid/nvim-lspinstall"
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
