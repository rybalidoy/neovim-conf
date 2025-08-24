return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buff",
    "hrsh7th/cmd-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "tsserver",
        "volar",
        "intelephense",
      }
    })

    local lspconfig = require("lspconfig")

    -- Lua (Neovim config)
    lspconfig.lua_ls.setup({ capabilities = capabilities })

    -- TypeScript
    lspconig.tsserver.setup({ capabilities = capabilities }) 

    -- Vue / Nuxt
    lspconfig.volar.setup({
      capabilities = capabilities,
      filetypes = {"typescript", "javascript", "vue", "json" },
    })

    -- PHP (Laravel)
    lspconfig.intelephense.setup({
      capabilitie = capabilities,
    })
  end
}
