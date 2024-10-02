return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "python",
        "rust", "javascript", "typescript"
  		},
  	},
  },
  {
    "goolord/alpha-nvim",
    dependencies = {"rubiin/fortune.nvim"},
    lazy = false,
    config = function ()
      -- require "configs.alpha"
      require "configs.alpha0"
      require "configs.alpha1"
      require "configs.alpha2"
    end
  },
  {
    "mg979/vim-visual-multi",
    lazy = false
  }
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = { 'echasnovski/mini.icons' },
  --   disable = false,
  --   config = function ()
  --       require'configs.alpha'
  --   end
  -- }
}
