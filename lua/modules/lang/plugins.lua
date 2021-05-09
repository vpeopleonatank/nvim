local lang = {}
local conf = require('modules.lang.config')

lang['nvim-treesitter/nvim-treesitter'] = {
  event = 'BufRead',
  after = 'telescope.nvim',
  config = conf.nvim_treesitter,
}
lang['ziglang/zig.vim'] = {
  ft = { 'zig','zir' }
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  after = 'nvim-treesitter'
}

lang['romgrk/nvim-treesitter-context'] = {
  after = 'nvim-treesitter'
}

-- lang['code-biscuits/nvim-biscuits'] = {
--   after = 'nvim-treesitter'
-- }
-- lang['JoosepAlviste/nvim-ts-context-commentstring'] = {
--   require = 'nvim-treesitter'
-- }


return lang
