return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    local ryaai_fugitive = vim.api.nvim_create_augroup("ryaai_fugitive", {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd("BufWinEnter", {
      group = ryaai_fugitive,
      pattern = "*",
      callback =  function()
        if vim.bo.ft ~= "fugitive" then 
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts =  { buffer = bufnr, remap = false }
        vim.keymap.set("n", "<leader>p", function()
          vim.cmd.Git('push') 
        end, opts)
        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
          vim.cmd.git({'pull', '--rebase'})
        end, opts)
        vim.keymap.set("n", "<leaer>t", ":Git push -u origin ", opts);
      end,
    })
    vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
    vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
  end
}
