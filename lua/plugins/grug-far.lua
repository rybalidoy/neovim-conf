return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  config = function()
    require("grug-far").setup({
      -- limit search scope to current file by default
      engine = {
        rg = {
          args = { "--vimgrep" }, -- ripgrep default
        },
      },
    })
    
    vim.keymap.set("n", "<leader>sr", function()
      require("grugfar").open({ searchDirs = { vim.fn.expand(":%p") }})
    end, { desc = "Search % Replace in Current File "})
  end,
}
