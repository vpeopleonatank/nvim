local filetype = {}

filetype['Shougo/context_filetype.vim'] = {
   event = 'BufReadPost *'
}

filetype['ziglang/zig.vim'] = {
   ft = {'zig', 'zir'}
}

-- filetype['ekalinin/Dockerfile.vim'] = {
--    ft = {'Dockerfile', 'docker-compose'}
-- }
--
-- filetype['nvim-treesitter/nvim-treesitter'] = {
--    event =  'BufRead *',
--    config = {
--     require'nvim-treesitter.configs'.setup {
--         highlight = {
--           enable = true,
--         },
--         indent = {
--           enable = true,
--         },
--         textobjects = {
--           select = {
--             enable = true,
--             keymaps = {
--               ["af"] = "@function.outer",
--               ["if"] = "@function.inner",
--               ["ac"] = "@class.outer",
--               ["ic"] = "@class.inner",
--             },
--           },
--         },
--       ensure_installed = 'all'
--     }
--   }
-- }
--
-- filetype['iamcco/markdown-preview.nvim'] = {
--    ft = {'markdown', 'pandoc.markdown', 'rmd'},
--    run = 'sh -c "cd app & yarn install"',
--    config = function()
--     vim.g.mkdp_auto_start = 0
--    end
-- }

return filetype
