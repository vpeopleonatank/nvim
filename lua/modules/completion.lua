local completion = {}

completion['nvim-lua/completion-nvim'] = {
    event = {'BufReadPre *','BufNewFile *'},
    config = "autocmd BufReadPre,BufNewFile * lua require'completion'.on_attach()",
    setup = function ()
        vim.g.completion_enable_auto_hover = 0
        vim.g.completion_auto_change_source = 1
        vim.g.completion_matching_ignore_case = 1
        vim.g.completion_enable_snippet = 'vim-vsnip'
        vim.g.completion_confirm_key = ""
        vim.g.completion_chain_complete_list = {
            {complete_items = {'lsp'}},
            {complete_items = {'snippet'}},
            {complete_items = {'buffers'}},
            {complete_items = {'path'}},
            {mode = '<c-p>'},
            {mode = '<c-n>'},
        }
    end,
}

completion['hrsh7th/vim-vsnip'] = {
    event = 'InsertCharPre *',
    config =  function()
       vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
    end
}

completion['hrsh7th/vim-vsnip-integ'] = {
    event = 'InsertCharPre *',
}

completion['mattn/vim-sonictemplate'] = {
    cmd = 'Template',
    ft = {'go','typescript','lua','javascript','vim','rust','markdown'},
    config = function ()
        vim.g.sonictemplate_postfix_key = '<C-j>'
        vim.g.sonictemplate_vim_template_dir = os.getenv("HOME") .. '/.config/nvim/template'
    end
}

completion['Raimondi/delimitMate'] = {
    event = 'InsertEnter *',
    config = function()
        vim.g.delimitMate_expand_cr = 0
        vim.g.delimitMate_expand_space = 1
        vim.g.delimitMate_smart_quotes = 1
        vim.g.delimitMate_expand_inside_quotes = 0
        vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
    end
}

completion['mattn/emmet-vim'] = {
  event = 'InsertEnter *',
  on_ft = {'html','css','javascript','javascriptreact','vue','typescript','typescriptreact'},
  config = function()
    vim.g.user_emmet_complete_tag = 0
    vim.g.user_emmet_install_global = 0
    vim.g.user_emmet_install_command = 0
    vim.g.user_emmet_mode = 'i'
  end
}

return completion
