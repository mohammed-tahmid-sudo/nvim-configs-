-- Icon Support for LSP and completion
return {
  -- Main icon provider
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        default = true,
        strict = true,
        override_by_filename = {
          ['.gitignore'] = {
            icon = '',
            color = '#f1502f',
            name = 'Gitignore'
          },
          ['README.md'] = {
            icon = '',
            color = '#519aba',
            name = 'Readme'
          },
        },
        override_by_extension = {
          ['py'] = {
            icon = '',
            color = '#3776ab',
            name = 'Python'
          },
          ['js'] = {
            icon = '',
            color = '#f1dd35',
            name = 'JavaScript'
          },
          ['lua'] = {
            icon = '',
            color = '#51a0cf',
            name = 'Lua'
          },
        },
      })
    end
  },
}
