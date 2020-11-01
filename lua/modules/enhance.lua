local enhance = {}

enhance['rhysd/accelerated-jk'] = true

enhance['norcalli/nvim-colorizer.lua'] = {
   ft = {
      'html',
      'css',
      'sass',
      'scss',
      'vim',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
  },
  config = function()
      require 'colorizer'.setup {
        css = { rgb_fn = true; };
        scss = { rgb_fn = true; };
        sass = { rgb_fn = true; };
        stylus = { rgb_fn = true; };
        vim = { names = true; };
        tmux = { names = false; };
        'javascript';
        'javascriptreact';
        'typescript';
        'typescriptreact';
        html = {
          mode = 'foreground';
        }
      }
  end
}

enhance['itchyny/vim-cursorword'] = {
  event = {'BufReadPre *','BufNewFile *'},
  config = function()
    vim.api.nvim_command('augroup user_plugin_cursorword')
      vim.api.nvim_command('autocmd!')
      vim.api.nvim_command('autocmd FileType defx,denite,fern,clap,vista let b:cursorword = 0')
      vim.api.nvim_command('autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif')
      vim.api.nvim_command('autocmd InsertEnter * let b:cursorword = 0')
      vim.api.nvim_command('autocmd InsertLeave * let b:cursorword = 1')
    vim.api.nvim_command('augroup END')
   end
}

enhance['hrsh7th/vim-eft'] = {
  config = function()
    vim.g.eft_ignorecase = true
  end
}

enhance['mhinz/vim-signify'] = {
  event = {'BufReadPre *','BufNewFile *'},
  config = function()
    vim.g.signify_sign_add = '▋'
    vim.g.signify_sign_change = '▋'
    vim.g.signify_sign_delete = '▋'
    vim.g.signify_sign_delete_first_line = '▘'
    vim.g.signify_sign_show_count = 0
 end
}



return enhance
