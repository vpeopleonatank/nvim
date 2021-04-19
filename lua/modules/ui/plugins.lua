local ui = {}
local conf = require('modules.ui.config')

ui['glepnir/zephyr-nvim'] = {
  config = [[vim.cmd('colorscheme zephyr')]]
}

ui['glepnir/dashboard-nvim'] = {
  config = conf.dashboard
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
--   event = 'BufReadPre',
-- }


ui['lukas-reineke/indent-blankline.nvim'] = {
  branch = 'lua',
  event = 'BufRead',
}

ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = {'kyazdani42/nvim-web-devicons'}
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf._gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

-- ui['kevinhwang91/nvim-hlslens'] = {

-- }

-- ui['beauwilliams/focus.nvim'] = {

-- }

return ui
