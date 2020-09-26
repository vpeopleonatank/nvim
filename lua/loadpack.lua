local pack = {}
local global = require('global')

function pack:new()
  local instance = {}
  setmetatable(instance,self)
  self.__index = self
  self.repos = {}
  return instance
end

function pack:parse_config()
  local plugins_dir = global.vim_path .. global.path_sep..'plugins'
  local cmd = nil
  if global.is_mac then
    cmd = [[ruby -e 'require "json"; require "yaml"; print JSON.generate YAML.load $stdin.read']]
  elseif global.is_linux then
    cmd = [[python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))']]
  end
  local p = io.popen('find "'..plugins_dir..'" -name "*.yaml"')
  for file in p:lines() do
    local cfg = vim.api.nvim_eval(vim.fn.system(cmd,global.readAll(file)))
    for _,v in pairs(cfg) do
      table.insert(v,v.repo)
      table.insert(self.repos,v)
    end
  end
end

function pack:load_repos()
  self:parse_config()
  local plugin_dir = os.getenv("HOME")..'/.cache/vim/plugins'
  local packer_dir = plugin_dir .. '/pack/packer/start/packer.nvim'
  local cmd = "git clone https://github.com/wbthomason/packer.nvim " ..packer_dir
  if vim.fn.has('vim_starting') then
    if not global.isdir(packer_dir) then
      os.execute(cmd)
    end
    vim.o.packpath = vim.o.packpath .. ',' .. plugin_dir
    package.path = package.path .. ';' .. plugin_dir .. '/pack/packer/start/packer.nvim/lua/?.lua'
  end
  local packer = require('packer')
  local use = packer.use
  packer.init({package_root = plugin_dir..'/pack'})
  packer.reset()
--   print(global.dump(self.repos))
  for _,repo in pairs(self.repos) do
    use(repo)
  end
  vim.api.nvim_command('filetype plugin indent on')

  if vim.fn.has('vim_starting') == 1 then
    vim.api.nvim_command('syntax enable')
  end
end

return pack
