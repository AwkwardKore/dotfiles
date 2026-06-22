-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")

---@type nvim_tree.config
local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  }
}
require("nvim-tree").setup(config)

-- =========================================================
--                     GENERAL SETTINGS
-- =========================================================

-- Change autoindentation to use spaces
vim.o.expandtab = true
vim.o.smarttab = false
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2

-- Show end of line character
vim.o.listchars = 'tab:->,trail:·'
vim.o.list = true

-- Display line on current line
vim.o.cursorline = true

-- Change terminal's title
vim.o.title = true

-- Use relative number
vim.o.relativenumber = true
vim.o.number = true

-- Setup persistent undo

-- Remap movement between splits for easier navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- =========================================================
--                        Nvim Tree
-- =========================================================
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<C-m>', ':NvimTreeFindFile<CR>')

-- =========================================================
--                       Bufferline
-- =========================================================
vim.opt.termguicolors = true

require("bufferline").setup{
  options = {
    numbers = "buffer_id"
  }
}

-- =========================================================
--                       Lualine
-- =========================================================
require('lualine').setup({
  options = {
    disabled_filetypes = {
      statusline = { 'NvimTree' }
    }
  }
})

-- require('onedark').setup {
--   style = 'darker'
-- }
-- require('onedark').load()

-- =========================================================
--                       GitSigns
-- =========================================================
require('gitsigns').setup()

-- =========================================================
--                       Telescope
-- =========================================================
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      "dist/",
      ".DS_Store",
      "^%.git/",
      "%.lock$",
      "build/",
      ".vscode",
      ".next"
    }
  }
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-a>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<C-o>', builtin.buffers, { desc = 'Telescope buffers' })

-- =========================================================
--                      Treesitter
-- =========================================================
require('nvim-treesitter').setup({
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
})
require('nvim-treesitter').install(
  {
    'javascript',
    'typescript',
    'tsx',
    'ruby',
    'python',
    'prisma'
  }
)
