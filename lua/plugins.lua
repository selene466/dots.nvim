local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end
vim.cmd("packadd packer.nvim")
local packer = require "packer"
local util = require "packer.util"
packer.init(
    {
        package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
    }
)
--- startup and add configure plugins
packer.startup(
    function()
        local use = use

        -- colorscheme
        use "folke/tokyonight.nvim"

        -- completion
        use "hrsh7th/nvim-compe"
        use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
        use "SirVer/ultisnips"
        use "honza/vim-snippets"

        -- QOL
        use "norcalli/nvim-colorizer.lua"
        use "Yggdroot/indentLine"
        use "alvan/vim-closetag"
        use "bitc/vim-bad-whitespace"
        use "easymotion/vim-easymotion"
        use "jiangmiao/auto-pairs"
        use "mattn/emmet-vim"
        use "tpope/vim-commentary"
        use "tpope/vim-surround"
        use "voldikss/vim-floaterm"
        use "preservim/tagbar"
        use "michaeljsmith/vim-indent-object"
        use "kevinhwang91/rnvimr"

        -- markdown preview cli
        use "npxbr/glow.nvim"

        -- formatter
        use "sbdchd/neoformat"

        -- misc
        use "webdevel/tabulous"
        use "psliwka/vim-smoothie"
        use "dstein64/nvim-scrollview"
        use "folke/which-key.nvim"
        use "hoob3rt/lualine.nvim"

        -- ALE
        use "dense-analysis/ale"
    end
)
