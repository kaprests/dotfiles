require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = "one_monokai"
  },
  sections = {
    lualine_a = {
      {
        'filename',
        path=1,
      }
    }
  }
}
