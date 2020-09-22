local M = {}
local global = require('global')

function M.load_repos()
  local plugin_dir = os.getenv("HOME")..'/.cache/vim/plugins/'
  local packer_dir = plugin_dir .. 'packer.nvim'
  local cmd = "git clone https://github.com/wbthomason/packer.nvim " ..packer_dir
  if vim.fn.has('vim_starting') then
    if not global.isdir(packer_dir) then
      os.execute(cmd)
    end
    -- vim.o.runtimepath = vim.o.runtimepath .. ','..packer_dir
    vim.o.packpath = vim.o.packpath .. ','..plugin_dir
  end
  local packer = require('packer')
  local use = packer.use
  packer.init({package_root = plugin_dir})
  packer.reset()
  use {'glepnir/dashboard-nvim'}
end

return M
