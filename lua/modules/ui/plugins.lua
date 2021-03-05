local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['dracula/vim'] = {
  -- config = [[vim.cmd('colorscheme dracula')]]
}

ui['glepnir/galaxyline.nvim'] = {
  branch = 'main',
  config = conf.galaxyline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['npxbr/gruvbox.nvim'] = {
  -- config = [[vim.cmd('colorscheme gruvbox')]],
  requires = {'rktjmp/lush.nvim'}
}

ui['ChristianChiarulli/nvcode-color-schemes.vim'] = {
  -- config = conf.nvcode_color_scheme
}


ui['yonlu/omni.vim'] = {
  -- config = [[vim.cmd('colorscheme omni')]],
}


-- ui['glepnir/indent-guides.nvim'] = {
--   event = 'BufReadPre ',
--   config = conf.indent_guides
-- }

ui['glepnir/indent-guides.nvim'] = {
  event = 'BufReadPre',
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['mhinz/vim-signify'] = {
  event = {'BufReadPre','BufNewFile'},
  config = conf.vim_signify
}

return ui
