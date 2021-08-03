local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute([[!git clone https://github.com/wbthomason/packer.nvim ]] .. install_path)
    execute([[packadd packer.nvim]])
end
vim.cmd([[packadd packer.nvim]])
local packer = require "packer"
local util = require "packer.util"
packer.init(
    {
        package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
    }
)

-----------------------------------------------------
--- Startup plugins
-----------------------------------------------------
packer.startup(
    function()
        local use = use
        -- packer as an optional plugin
        use {"wbthomason/packer.nvim", opt = true}

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
        use {
            "Yggdroot/indentLine",
            event = "BufReadPre"
        }
        use {
            "alvan/vim-closetag",
            event = "BufReadPre"
        }
        use {
            "bitc/vim-bad-whitespace",
            event = "BufReadPre"
        }
        use {
            "phaazon/hop.nvim",
            cmd = {
                "HopPattern",
                "HopLine",
                "HopChar1",
                "HopWord"
            }
        }
        use "jiangmiao/auto-pairs"
        use "mattn/emmet-vim"
        use "tpope/vim-commentary"
        use "tpope/vim-surround"
        use "voldikss/vim-floaterm"
        use {
            "preservim/tagbar",
            cmd = {
                "Tagbar"
            }
        }
        use "michaeljsmith/vim-indent-object"
        use {
            "kevinhwang91/rnvimr",
            cmd = {
                "RnvimrToggle"
            }
        }
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-lua/plenary.nvim"
        use "lewis6991/gitsigns.nvim"
        use "andymass/vim-matchup"

        -- markdown preview
        use {
            "npxbr/glow.nvim",
            cmd = {
                "Glow"
            }
        }

        -- misc
        use "webdevel/tabulous"
        use "psliwka/vim-smoothie"
        use "dstein64/nvim-scrollview"
        use "folke/which-key.nvim"
        use "hoob3rt/lualine.nvim"
        use "dstein64/vim-startuptime"

        -- ALE
        use "dense-analysis/ale"
    end
)
