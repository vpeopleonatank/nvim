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
      runtime = {version = "LuaJIT", path = vim.split(package.path, ';')},
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

cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
              -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- only show one line of comment set to 0 if you do not want API comments be shown

  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",

  handler_opts = {
    border = "single"   -- double, single, shadow, none
  },
  decorator = {"`", "`"}  -- or decorator = {"***", "***"}  decorator = {"**", "**"} see markdown help
}
lspconfig.pyright.setup {
    cmd = {global.data_path .. "/lspinstall/python/node_modules/.bin/pyright-langserver", "--stdio"},
    -- on_attach = require'lsp'.common_on_attach,
    on_attach = function(client, bufnr)
      require'lsp_signature'.on_attach(cfg)
    end,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = ""},
            signs = true,
            underline = true,
            -- update_in_insert = true
        })
    },
	 settings = {
      python = {
        analysis = {
          typeCheckingMode = "off",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
}

lspconfig.jsonls.setup {
    cmd = {
        "node", global.data_path .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
        "--stdio"
    },

    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
            end
        }
    }
}

local python_arguments = {}

local flake8 = {
    LintCommand = "flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}

local isort = {formatCommand = "isort --quiet -", formatStdin = true}

local yapf = {formatCommand = "yapf --quiet", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)
table.insert(python_arguments, isort)
table.insert(python_arguments, black)

local luaFormat = {
    formatCommand = "lua-format -i --no-keep-simple-function-one-line --column-limit=120",
    formatStdin = true
}

local lua_fmt = {
    formatCommand = "luafmt --indent-count 2 --line-width 120 --stdin",
    formatStdin = true
}

local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}

local eslint = {
    lintCommand = "./node_modules/.bin/eslint -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "./node_modules/.bin/eslint --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local tsserver_args = {}
table.insert(tsserver_args, prettier)
table.insert(tsserver_args, eslint)

local markdownPandocFormat = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}

-- Not yet get efm server work
-- lspconfig.efm.setup {
--     -- init_options = {initializationOptions},
--     cmd = {global.data_path .. "/lspinstall/efm/efm-langserver"},
--     init_options = {documentFormatting = true, codeAction = false},
--     filetypes = {"lua", "python", "javascriptreact", "javascript", "typescript",
--                 "typescriptreact","sh", "html", "css", "json", "yaml", "markdown", "vue"},
--     -- filetypes = {"lua", "python", "sh", "html", "css", "json", "yaml", "markdown"},
--     settings = {
--         rootMarkers = {".git/"},
--         languages = {
--             python = python_arguments,
--             lua = luaFormat,
--             sh = {shfmt},
--             javascript = tsserver_args,
--             javascriptreact = tsserver_args,
-- 			typescript = tsserver_args,
-- 			typescriptreact = tsserver_args,
--             html = {prettier},
--             css = {prettier},
--             json = {prettier},
--             yaml = {prettier},
--             markdown = {markdownPandocFormat}
--             -- javascriptreact = {prettier, eslint},
--             -- javascript = {prettier, eslint},
--             -- markdown = {markdownPandocFormat, markdownlint},
--         }
--     }
-- }

local servers = {
'bashls', 'html', 'cssls',
}

for _,server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = enhance_attach
  }
end
