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

-- ui['tamago324/lir.nvim'] = {
--   config = function ()
--     local actions = require'lir.actions'
--     local mark_actions = require 'lir.mark.actions'
--     local clipboard_actions = require'lir.clipboard.actions'

--     require'lir'.setup {
--       show_hidden_files = false,
--       devicons_enable = true,
--       mappings = {
--         ['l']     = actions.edit,
--         ['<C-s>'] = actions.split,
--         ['<C-v>'] = actions.vsplit,
--         ['<C-t>'] = actions.tabedit,

--         ['h']     = actions.up,
--         ['q']     = actions.quit,

--         ['K']     = actions.mkdir,
--         ['N']     = actions.newfile,
--         ['R']     = actions.rename,
--         ['@']     = actions.cd,
--         ['Y']     = actions.yank_path,
--         ['.']     = actions.toggle_show_hidden,
--         ['D']     = actions.delete,

--         ['J'] = function()
--           mark_actions.toggle_mark()
--           vim.cmd('normal! j')
--         end,
--         ['C'] = clipboard_actions.copy,
--         ['X'] = clipboard_actions.cut,
--         ['P'] = clipboard_actions.paste,
--       },
--       float = {
--         size_percentage = 0.5,
--         winblend = 15,
--         border = true,
--         borderchars = {"╔" , "═" , "╗" , "║" , "╝" , "═" , "╚", "║"},

--         -- -- If you want to use `shadow`, set `shadow` to `true`.
--         -- -- Also, if you set shadow to true, the value of `borderchars` will be ignored.
--         -- shadow = false,
--       },
--       hide_cursor = true,
--     }

--     require'nvim-web-devicons'.setup({
--       override = {
--         lir_folder_icon = {
--           icon = "",
--           color = "#7ebae4",
--           name = "LirFolderNode"
--         },
--       }
--     })

--     -- use visual mode
--     function _G.LirSettings()
--       vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

--       -- echo cwd
--       vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
--     end

--     vim.cmd [[augroup lir-settings]]
--     vim.cmd [[  autocmd!]]
--     vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
--     vim.cmd [[augroup END]]
--   end,
--   requires = 'kyazdani42/nvim-web-devicons'
-- }

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

ui['nvim-lua/lsp-status.nvim'] = {

}

return ui
