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
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['npxbr/gruvbox.nvim'] = {
  -- config = [[vim.cmd('colorscheme gruvbox')]],
  requires = {'rktjmp/lush.nvim'}
}

ui['ChristianChiarulli/nvcode-color-schemes.vim'] = {
  -- config = conf.nvcode_color_scheme
}


-- ui['glepnir/indent-guides.nvim'] = {
--   event = 'BufReadPre',
-- }


ui['lukas-reineke/indent-blankline.nvim'] = {
  event = 'BufRead',
  branch = 'lua',
  config = conf.indent_blakline
}


ui['akinsho/nvim-bufferline.lua'] = {
  config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['kyazdani42/nvim-tree.lua'] = {
  cmd = {'NvimTreeToggle','NvimTreeOpen'},
  config = conf.nvim_tree,
  requires = 'kyazdani42/nvim-web-devicons'
}

ui['lewis6991/gitsigns.nvim'] = {
  event = {'BufRead','BufNewFile'},
  config = conf.gitsigns,
  requires = {'nvim-lua/plenary.nvim',opt=true}
}

-- ui['kevinhwang91/nvim-hlslens'] = {

-- }

-- ui['beauwilliams/focus.nvim'] = {

-- }

-- ui['haringsrob/nvim_context_vt'] = {
--   requires = 'nvim-treesitter'
-- }

return ui
