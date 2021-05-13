local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    preselect = 'always';
    allow_prefix_unmatch = false;
    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = {priority = 3000};
      -- nvim_lsp = {priority = 1000};
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = false;
    };
  }
end

function config.vim_vsnip()
  vim.g.vsnip_snippet_dir = os.getenv('HOME') .. '/.config/nvim/snippets'
end

function config.telescope()
  if not packer_plugins['plenary.nvim'].loaded then
    vim.cmd [[packadd plenary.nvim]]
    vim.cmd [[packadd popup.nvim]]
    vim.cmd [[packadd telescope-fzy-native.nvim]]
  end

  local previewers = require('telescope.previewers')

  -- Disable highlighting for certain files
  -- local _bad = { '.*%.json', '.*%.lua' } -- Put all filetypes that slow you down in this array
  -- local _bad = { '.*%.json' } -- Put all filetypes that slow you down in this array
  -- local not_bad_files = function(filepath)
  --   for _, v in ipairs(_bad) do
  --     if filepath:match(v) then
  --       return false
  --     end
  --   end

  --   return true
  -- end

  -- local new_maker = function(filepath, bufnr, opts)
  --   opts = opts or {}
  --   if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  --   opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
  --   previewers.buffer_previewer_maker(filepath, bufnr, opts)
  -- end

  local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}

    -- if opts.use_ft_detect == nil then opts.use_ft_detect = true end
    -- opts.use_ft_detect = opts.use_ft_detect == false and false or not_bad_files(filepath)
    -- print(opts.use_ft_detect)
    -- if opts.use_ft_detect then
    --   return
    -- end

    filepath = vim.fn.expand(filepath)
    vim.loop.fs_stat(filepath, function(_, stat)
      if not stat then return end
      if stat.size > 100000 then
        return
      else
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      end
    end)
  end

  require('telescope').setup {
    defaults = {
      -- buffer_previewer_maker = new_maker,
    buffer_previewer_maker = new_maker,
      vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
          '--glob=!git/*'
      },
      prompt_prefix = '🔭 ',
      prompt_position = 'top',
      selection_caret = " ",
      sorting_strategy = 'ascending',
      results_width = 0.6,
      file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
      -- fzf = {
      --   override_generic_sorter = false, -- override the generic sorter
      --   override_file_sorter = true,     -- override the file sorter
      --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      --                                  -- the default case_mode is "smart_case"
      -- }
    }
  }

  require'telescope'.load_extension('project')
  require('telescope').load_extension('fzy_native')
  -- require('telescope').load_extension('fzf')
  require'telescope'.load_extension('dotfiles')
  require'telescope'.load_extension('gosource')
end

function config.vim_sonictemplate()
  vim.g.sonictemplate_postfix_key = '<C-,>'
  vim.g.sonictemplate_vim_template_dir = os.getenv("HOME").. '/.config/nvim/template'
end

function config.smart_input()
  require('smartinput').setup {
    ['go'] = { ';',':=',';' }
  }
end

function config.emmet()
  vim.g.user_emmet_complete_tag = 0
  vim.g.user_emmet_install_global = 0
  vim.g.user_emmet_install_command = 0
  vim.g.user_emmet_mode = 'i'
end

return config
