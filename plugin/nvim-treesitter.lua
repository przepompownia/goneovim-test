require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    'bash',
    'lua',
    'markdown',
    'markdown_inline',
    'vim',
    'regex',
  },
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<Plug>(treesitter-init-selection)',
      node_incremental = '<Plug>(treesitter-node-incremental)',
      node_decremental = '<Plug>(treesitter-node-decremental)',
      scope_incremental = '<Plug>(treesitter-scope-incremental)',
    },
  },
  indent = {
    enable = true,
  },
}

vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
