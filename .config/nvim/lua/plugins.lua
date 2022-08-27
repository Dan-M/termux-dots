-- Plugins --
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = 
      require'nvim-treesitter.configs'.setup{
	ensure_installed = 'all'
      }

  }
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { 
        keys = 'etovxqpdygfblzhckisuran',
        jump_on_sole_occurence = true,
      }
    end
  }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
  use { 
    "williamboman/mason.nvim",
    config = function() require("mason").setup {} end
  }
  use { 
    "williamboman/mason-lspconfig.nvim",
    config = function() require("mason-lspconfig").setup {} end,
    after = "mason.nvim"
  }
  use { 
    "neovim/nvim-lspconfig",
    after = "mason-lspconfig.nvim"
  }
 
end)

