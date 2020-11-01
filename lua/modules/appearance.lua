local appearance = {}

appearance['kyazdani42/nvim-web-devicons'] = true

appearance['Akin909/nvim-bufferline.lua'] = {
  config = function ()
    require'bufferline'.setup{
        options = {
          modified_icon = '✥',
          buffer_close_icon = '',
          mappings = true,
          always_show_bufferline = false,
        };
        highlights = {
          bufferline_selected = {
            gui = "bold",
          };
        };
      }
  end
}

appearance['glepnir/dashboard-nvim'] = {
  config = function ()
    vim.g.dashboard_preview_command = 'cat'
    vim.g.dashboard_preview_file = os.getenv('HOME') .. '/.config/nvim/neovim.cat'
    vim.g.dashboard_preview_file_height = 10
    vim.g.dashboard_preview_file_width = 80
    vim.g.dashboard_default_executive = 'telescope'
    vim.g.dashboard_custom_section = {
      last_session = {
        description = {'  Recently laset session                  SPC s l'},
        command =  'SessionLoad'},
      find_history = {
        description = {'  Recently opened files                   SPC f h'},
        command =  'DashboardFindHistory'},
      find_file  = {
        description = {'  Find  File                              SPC f f'},
        command = 'DashboardFindFile'},
      new_file = {
       description = {'  New   File                              SPC t f'},
       command =  'DashboardNewFile'},
      change_colorscheme = {
       description = {'  Change Colorscheme                      SPC t c'},
       command =  'DashboardChangeColorscheme'},
      find_word = {
       description = {'  Find  word                              SPC f w'},
       command = 'DashboardFindWord'},
      find_dotfiles = {
       description = {'  Open Personal dotfiles                  SPC f d'},
       command = 'Clap dotfiles'},
    }
  end
}

appearance['kyazdani42/nvim-tree.lua'] = {
  config = function()
    vim.g.lua_tree_hide_dotfiles = 1
    vim.g.lua_tree_indent_markers = 1
    vim.g.lua_tree_bindings = {
      edit = {'<CR>', 'l'},
      edit_vsplit = 's',
      edit_split = 'i',
    }
    vim.g.lua_tree_icons = {
      default =  '',
      symlink =  '',
      git = {
       unstaged = "✚",
       staged =  "✚",
       unmerged =  "≠",
       renamed =  "≫",
       untracked = "★",
      },
    }
  end
}

return appearance
