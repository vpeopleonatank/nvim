local config = {}

function config.galaxyline()
  require('modules.ui.eviline')
end

function config.indent_guides()
  require('indent_guides').setup {
    -- even_colors = { fg ='#45524E',bg='#95F5D7'};
    -- odd_colors = {fg='#45524E',bg='#95F5D7'};

-- even_colors = { fg ='#2a3834',bg='#332b36' };
-- odd_colors = {fg='#332b36',bg='#2a3834'};
    even_colors = { fg ='None',bg='None'};
    odd_colors = {fg='None',bg='None'};
  }
end

function config.nvim_bufferline()
  require('bufferline').setup{
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      mappings = true,
      always_show_bufferline = false,
    }
  }
end

function config.dashboard()
  local home = os.getenv('HOME')
  -- vim.g.dashboard_preview_command = 'cat'
  -- vim.g.dashboard_preview_pipeline = 'lolcat'
  -- vim.g.dashboard_preview_file = home .. '/.config/nvim/static/pokemon.txt'
  vim.g.dashboard_preview_file_height = 14
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
    find_word = {
     description = {'  Find  word                              SPC f w'},
     command = 'DashboardFindWord'},
    find_dotfiles = {
     description = {'  Open Personal dotfiles                  SPC f d'},
     command = 'Telescope dotfiles path=' .. home ..'/.dotfiles'},
    go_source = {
     description = {'  Find Go Source Code                     SPC f s'},
     command = 'Telescope gosource'},
  }
end

function config.nvim_tree()
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_bindings = {
    ["l"] = ":lua require'nvim-tree'.on_keypress('edit')<CR>",
    ["s"] = ":lua require'nvim-tree'.on_keypress('vsplit')<CR>",
    ["i"] = ":lua require'nvim-tree'.on_keypress('split')<CR>",
  }
  vim.g.nvim_tree_icons = {
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

function config.vim_signify()
  vim.g.signify_sign_add = '▋'
  vim.g.signify_sign_change = '▋'
  vim.g.signify_sign_delete = '▋'
  vim.g.signify_sign_delete_first_line = '▘'
  vim.g.signify_sign_show_count = 0
end

return config
