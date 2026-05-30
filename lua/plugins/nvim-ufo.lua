return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  config = function()
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        -- disable ufo for neo-tree and other special buffers
        if filetype == 'neo-tree' or buftype == 'nofile' then return '' end
        return { 'treesitter', 'indent' }
      end,
    }
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
}
