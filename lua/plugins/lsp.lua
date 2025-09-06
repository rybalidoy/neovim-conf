return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        volar = {
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
        ts_ls = {},
        eslint = {},
        tailwindcss = {},
        intelephense = {},
      },
    },
    config = function(_, opts)
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "eslint", "ts_ls"},
      })
      
      local lspconfig = require("lspconfig")
      
      -- Capabilities for autocomplete (nvim-cmp / blink.cmp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

      if ok then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      for server, server_opts in pairs(opts.servers) do
        lspconfig[server].setup(server_opts)
      end
    end,
  },
}

