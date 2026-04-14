-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    { '<leader>E', ':Neotree reveal expand_all<CR>', desc = 'NeoTree expand all', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    default_component_configs = {
      indent = {
        with_expanders = true,
      },
    },
    filesystem = {
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        visible = true,
      },
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['P'] = {
          'toggle_preview',
          config = {
            use_float = false,
            use_image_nvim = true,
            use_snacks_image = true,
            title = 'Neo-tree Preview',
          },
        },
      },
      position = 'right',
      width = 25,
    },
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function() vim.cmd 'normal! zR' end,
      },
    },
  },
}
