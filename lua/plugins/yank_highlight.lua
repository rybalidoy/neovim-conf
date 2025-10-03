return {
  "nvim-lua/plenary.nvim",
  init = function()
    -- Autcmd for yank highlight
    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "Highliight on yank",
      group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
      callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
      end,
    })
  end,
}
