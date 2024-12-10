local telescope = require('telescope')

telescope.setup {
  defaults = {
    prompt_position = 'top',
    layout_strategy = 'horizontal',
    sorting_strategy = 'ascending',
    use_less = false,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      --'!.git',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
  }
}




