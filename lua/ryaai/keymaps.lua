-- Disable arrow keys
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Normal mode
vim.keymap.set("n", "<C-.>", ">>", { noremap = true, silent = true, desc = "Indent line" })
vim.keymap.set("n", "<C-,>", "<<", { noremap = true, silent = true, desc = "Unindent line" })

-- Visual mode
vim.keymap.set("v", "<C-.>", ">gv", { noremap = true, silent = true, desc = "Indent selection" })
vim.keymap.set("v", "<C-,>", "<gv", { noremap = true, silent = true, desc = "Unindent selection" })

vim.api.nvim_create_autocmd(
  "LspAttach",
  { 
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable completion triggered by <c-x><c-o>

      -- Buffer local mappings
      -- See `:help vim.lsp.*` for documentation on any of the below functionse
      local opts = { buffer = ev.buf } 
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      -- Open the diagnostic under the cursor in a float window
      vim.keymap.set("n", "<leader>d", function()
        vim.diagnostic.open_float({
          border = "rounded",
        })
      end, opts)
    end,
  }
)
