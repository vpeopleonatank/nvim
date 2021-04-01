local editor = {}
local conf = require('modules.editor.config')

editor['Raimondi/delimitMate'] = {
  event = 'InsertEnter',
  config = conf.delimimate,
}

editor['rhysd/accelerated-jk'] = {
  opt = true
}

editor['norcalli/nvim-colorizer.lua'] = {
  ft = { 'html','css','sass','vim','typescript','typescriptreact'},
  config = conf.nvim_colorizer
}

editor['itchyny/vim-cursorword'] = {
  event = {'BufReadPre','BufNewFile'},
  config = conf.vim_cursorwod
}

editor['hrsh7th/vim-eft'] = {
  opt = true,
  config = function()
    vim.g.eft_ignorecase = true
  end
}

editor['kana/vim-operator-replace'] = {
  keys = {{'x','p'}},
  config = function()
    vim.api.nvim_set_keymap("x", "p", "<Plug>(operator-replace)",{silent =true})
  end,
  requires = 'kana/vim-operator-user'
}

-- editor['rhysd/vim-operator-surround'] = {
--   event = 'BufRead',
--   requires = 'kana/vim-operator-user'
-- } 

editor['blackCauldron7/surround.nvim'] = {
  config = function()
    require"surround".setup{}
  end
}

editor['kana/vim-niceblock']  = {
  opt = true
}

editor['romainl/vim-cool'] = {

}

editor['phaazon/hop.nvim'] = {
  branch = 'pre-extmarks',
  config = function()
    vim.api.nvim_set_keymap('n', 'gsj', "<cmd>lua require'hop'.hint_words()<cr>", {})
    vim.api.nvim_set_keymap('n', 'gsk', "<cmd>lua require'hop'.hint_char1()<cr>", {})
    vim.api.nvim_set_keymap('n', 'gsl', "<cmd>lua require'hop'.hint_char2()<cr>", {})
  end
}

editor['karb94/neoscroll.nvim'] = {

}


return editor
