local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { ".local", ".cache", ".anaconda", ".docker", ".conda", "go" },
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    layout_config = {
        width = 0.9,
        height = 0.8,
        prompt_position = 'top',
        preview_width = 0.5,
        anchor = 'S',
    },
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

