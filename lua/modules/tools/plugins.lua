local tools = {}
local conf = require('modules.tools.config')

tools['kristijanhusak/vim-dadbod-ui'] = {
  cmd = {'DBUIToggle','DBUIAddConnection','DBUI','DBUIFindBuffer','DBUIRenameBuffer'},
  config = conf.vim_dadbod_ui,
  requires = {{'tpope/vim-dadbod',opt = true}}
}

tools['editorconfig/editorconfig-vim'] = {
  ft = { 'go','typescript','javascript','vim','rust','zig','c','cpp' }
}

tools['glepnir/indent-guides.nvim'] = {
  event = 'BufReadPre *',
  config = conf.indent_guides
}

tools['glepnir/prodoc.nvim'] = {
  event = 'BufReadPre *'
}

tools['b3nj5m1n/kommentary'] = {
  config = function()
    require('kommentary.config').configure_language("default", {
        prefer_single_line_comments = true,
    })
  end
}


tools['liuchengxu/vista.vim'] = {
  cmd = 'Vista',
  config = conf.vim_vista
}

tools['mhartington/formatter.nvim'] = {
  ft = { 'typescript','typescriptreact','lua','python','cpp' },
  config = conf.fomatter_nvim
}

tools['brooth/far.vim'] = {
  cmd = {'Far','Farp'},
  config = function ()
    vim.g['far#source'] = 'rg'
  end
}

tools['iamcco/markdown-preview.nvim'] = {
  ft = 'markdown',
  config = function ()
    vim.g.mkdp_auto_start = 0
  end
}


tools['jpalardy/vim-slime'] = {
  ft = 'python',
  config = function ()
    vim.g.slime_target = 'tmux'
    vim.g.slime_python_ipython = 1
    SOCKET_NAME = ""
    for w in os.getenv("TMUX"):gmatch("([^,]+)") do
      SOCKET_NAME = w
      break
    end

    vim.g.slime_default_config = {
                --socket_name= '/tmp//tmux-1000/default',
                socket_name= SOCKET_NAME,
                target_pane= '{top-right}' }
    vim.g.slime_dont_ask_default = 1
  end
}


tools['hanschen/vim-ipython-cell'] = {
  ft = 'python'
}

return tools
