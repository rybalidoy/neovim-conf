
-- telescope.lua
return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "ahmedkhalf/project.nvim", -- recent projects/folders
  },

  config = function()
    require('telescope').setup({
      extensions = {
        projects = {}, -- default config
      },
    })

    -- project.nvim setup
    require("project_nvim").setup({
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "package.json", "composer.json", ".hg", ".svn", "Makefile" },
    })

    -- load the Telescope extension
    require("telescope").load_extension("projects")

    local builtin = require('telescope.builtin')

    -- your existing mappings
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    -- 🚀 New keymap: Ctrl+r = Recent Projects (like VS)
    vim.keymap.set('n', '<C-r>', function()
      require('telescope').extensions.projects.projects()
    end, { desc = "Recent Projects" })
  end
}
