local M = {}

function M.load_repos()
  local plugin_dir = os.getenv("HOME")..'/.cache/vim/plugins'
  if vim.fn.has('vim_starting') then
    vim.o.runtimepath = vim.o.runtimepath .. ','..plugin_dir ..'/packer.nvim'
  end
  local packer = require('packer')
  local use = packer.use
  packer.init({package_root = plugin_dir})
  packer.reset()
  use {'glepnir/dashboard-nvim'}
  packer.install()
end

return M
