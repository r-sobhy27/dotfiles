local has_packer, packer = pcall(require, "packer")
if not has_packer then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim",
    })

    vim.cmd([[packadd packer.nvim]])

    packer = require("packer")
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")
    use("ThePrimeagen/harpoon")
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use("prichrd/netrw.nvim")

    use("nvim-telescope/telescope.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    })

    -- lsp
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("lvimuser/lsp-inlayhints.nvim")

    -- completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")

    -- snipets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- dap
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use("ray-x/lsp_signature.nvim")

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- schemas
    use("saecki/crates.nvim")
    use("b0o/SchemaStore.nvim")

    -- use("folke/tokyonight.nvim")
    use("ellisonleao/gruvbox.nvim")
    use("nvim-tree/nvim-web-devicons")

    if not has_packer then
        packer.sync()
    end
end)
