local api = vim.api
local lspconfig = require 'lspconfig'
local global = require 'core.global'
local format = require('modules.completion.format')
local u = require("utils")

if not packer_plugins['lspsaga.nvim'].loaded then
  vim.cmd [[packadd lspsaga.nvim]]
end

local saga = require 'lspsaga'
saga.init_lsp_saga({
  code_action_icon = '💡'
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

function _G.reload_lsp()
  vim.lsp.stop_client(vim.lsp.get_active_clients())
  vim.cmd [[edit]]
end

function _G.open_lsp_log()
  local path = vim.lsp.get_log_path()
  vim.cmd("edit " .. path)
end

vim.cmd('command! -nargs=0 LspLog call v:lua.open_lsp_log()')
vim.cmd('command! -nargs=0 LspRestart call v:lua.reload_lsp()')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = false,
    -- Enable virtual text, override spacing to 4
    virtual_text = true,
    signs = {
      enable = true,
      priority = 20
    },
    -- Disable a feature
    update_in_insert = false,
})

local enhance_attach = function(client,bufnr)
  if client.resolved_capabilities.document_formatting then
    format.lsp_before_save()
  end
  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lspconfig.gopls.setup {
  cmd = {"gopls","--remote=auto"},
  on_attach = enhance_attach,
  capabilities = capabilities,
  init_options = {
    usePlaceholders=true,
    completeUnimported=true,
  }
}

lspconfig.sumneko_lua.setup {
  cmd = {
    global.home.."/workstation/lua-language-server/bin/Linux/lua-language-server",
    "-E",
    global.home.."/workstation/lua-language-server/main.lua"
  };
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {"vim","packer_plugins"}
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true},{}),
      },
    },
  }
}

lspconfig.tsserver.setup {
  -- cmd = {
  --     "typescript-language-server", "--stdio", "--tsserver-path",
  --     "/usr/local/bin/tsserver-wrapper"
  -- },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    enhance_attach(client)

    u.buf_map(bufnr, "i", ".", ".<C-x><C-o>")

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup {
        -- debug = true,
        enable_import_on_completion = true,
        complete_parens = true,
        signature_help_in_parens = true,
        eslint_bin = "eslint_d",
        eslint_enable_diagnostics = true,
        enable_formatting = true,
        formatter = "eslint_d",
        formatter_args = {
            "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME"
        },
        -- format_on_save = true,
        update_imports_on_move = true
    }
    ts_utils.setup_client(client)

    u.buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
    u.buf_map(bufnr, "n", "gI", ":TSLspRenameFile<CR>")
    u.buf_map(bufnr, "n", "gt", ":TSLspImportAll<CR>")
    u.buf_map(bufnr, "n", "qq", ":TSLspFixCurrent<CR>")
  end
}

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--cross-file-rename",
    "--all-scopes-completion",
  },
  filetypes = {"c", "cpp", "objc", "objcpp", "cuda", "hpp", "h"},
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
}

local servers = {
  'dockerls','bashls','pyright', 'html', 'cssls', 'jsonls'
}

for _,server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach
  }
end
