local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_term = bind.map_term
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args

require('keymap.config')

local plug_map = {
    ["i|<TAB>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
    ["i|<S-TAB>"]    = map_cmd('v:lua.s_tab_complete()'):with_silent():with_expr(),
    ["i|<CR>"]       = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_nowait(),
    -- person keymap
    ["n|mf"]             = map_cr("<cmd>lua require('internal.fsevent').file_event()<CR>"):with_silent():with_nowait():with_noremap();
    ["n|gb"]             = map_cr("BufferLinePick"):with_noremap():with_silent(),
    -- Packer
    ["n|<leader>pu"]     = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pi"]     = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait();
    ["n|<leader>pc"]     = map_cr("PackerCompile"):with_silent():with_noremap():with_nowait();
    -- Lsp mapp work when insertenter and lsp start
    
    ["n|<leader>li"]     = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>ll"]     = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
    ["n|<leader>lr"]     = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
    ["n|<C-f>"]          = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_silent():with_noremap():with_nowait(),
    ["n|<C-b>"]          = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_silent():with_noremap():with_nowait(),
    ["n|[e"]             = map_cr('Lspsaga diagnostic_jump_next'):with_noremap():with_silent(),
    ["n|]e"]             = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap():with_silent(),
    ["n|K"]              = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|ga"]             = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
    ["v|ga"]             = map_cu("Lspsaga range_code_action"):with_noremap():with_silent(),
    ["n|gD"]             = map_cr('Lspsaga preview_definition'):with_noremap():with_silent(),
    ["n|<leader>lf"]             = map_cu('lua vim.lsp.buf.formatting()'):with_noremap():with_silent(),
    -- ["n|gi"]             = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
    ["n|gd"]             = map_cmd("<Cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent(),
    ["n|gs"]             = map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["i|<C-s>"]             = map_cmd('<Cmd>Lspsaga signature_help<CR>'):with_noremap():with_silent(),
    ["n|gR"]             = map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|gr"]             = map_cr('Telescope lsp_references'):with_noremap():with_silent(),
    ["n|gh"]             = map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    -- ["n|gt"]             = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>cw"]     = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
    ["n|<Leader>ce"]     = map_cr('Lspsaga show_line_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>ct"]      = map_args("Template"),
    ["n|<Leader>tf"]     = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    -- Plugin nvim-tree
    -- ["n|<Leader>e"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    ["n|<Leader>e"]      = map_cr('CHADopen'):with_noremap():with_silent(),
    ["n|<Leader>F"]      = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<Leader>om"]     = map_cu('MarkdownPreview'):with_noremap():with_silent(),
    -- Plugin DadbodUI
    ["n|<Leader>od"]     = map_cr('DBUIToggle'):with_noremap():with_silent(),
    -- Plugin neogit
    ["n|<Leader>gn"]      = map_cu("Neogit"):with_noremap():with_silent(),
    -- Plugin Floaterm
    ["n|<Leader>gz"]      = map_cu("FloatermNew --height=0.8 --width=0.8 lazygit"):with_noremap():with_silent(),
    ["n|<F12>"]      = map_cr('FloatermToggle'):with_noremap():with_silent(),
    ["t|<F12>"]      = map_term('FloatermToggle'):with_silent(),
    ["n|<F7>"]      = map_cr('FloatermNew'):with_noremap():with_silent(),
    ["t|<F7>"]      = map_term('FloatermNew'):with_silent(),
    ["n|<leader>tp"]      = map_cr('FloatermPrev'):with_noremap():with_silent(),
    ["t|<leader>tp"]      = map_term('FloatermPrev'):with_silent(),
    ["n|<leader>tn"]      = map_cr('FloatermNext'):with_noremap():with_silent(),
    ["t|<leader>tn"]      = map_term('FloatermNext'):with_silent(),
    -- Far.vim
    ["n|<Leader>rf"]     = map_cr('Farr --source=vimgrep'):with_noremap():with_silent();
    ["v|<Leader>rp"]     = map_cr('Farr --source=rgnvim'):with_noremap():with_silent();
    -- Plugin Telescope
    ["n|<Leader>bb"]     = map_cu('Telescope buffers'):with_noremap():with_silent(),
    ["n|<Leader>fa"]     = map_cu('DashboardFindWord'):with_noremap():with_silent(),
    ["n|<Leader>fb"]     = map_cu('Telescope file_browser'):with_noremap():with_silent(),
    -- ["n|<Leader>fb"]     = map_cu('DashboardJumpMark'):with_noremap():with_silent(),
    -- ["n|<Leader>ff"]     = map_cu('DashboardFindFile'):with_noremap():with_silent(),
    ["n|<Leader>ff"]     = map_cu('Telescope find_files find_command=fdfind,--type,f,-H,-E,.git'):with_noremap():with_silent(),
    ["n|<Leader>fg"]     = map_cu('Telescope git_files'):with_noremap():with_silent(),
    ["n|<Leader>fw"]     = map_cu('Telescope grep_string'):with_noremap():with_silent(),
    ["n|<Leader>fh"]     = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
    ["n|<Leader>fl"]     = map_cu('Telescope loclist'):with_noremap():with_silent(),
    ["n|<Leader>fm"]     = map_cu('Telescope marks'):with_noremap():with_silent(),
    ["n|<Leader>fv"]     = map_cu('Telescope help_tags'):with_noremap():with_silent(),
    ["n|<Leader>fd"]     = map_cu('Telescope lsp_document_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>fD"]     = map_cu('Telescope lsp_workspace_diagnostics'):with_noremap():with_silent(),
    ["n|<Leader>fo"]     = map_cu('Telescope dotfiles path='..os.getenv("HOME")..'/.dotfiles'):with_noremap():with_silent(),
    ["n|<Leader>fs"]     = map_cu('Telescope gosource'):with_noremap():with_silent(),
    ["n|<Leader>ft"]     = map_cu('Telescope treesitter'):with_noremap():with_silent(),
    ["n|<Leader>zl"]     = map_cu('Telescope jumplist'):with_noremap():with_silent(),
    -- prodoc
--     ["n|gcc"]            = map_cu('ProComment'):with_noremap():with_silent(),
--     ["x|gcc"]            = map_cr('ProComment'),
--     ["n|gcj"]            = map_cu('ProDoc'):with_silent():with_silent(),
    -- Plugin acceleratedjk
    ["n|j"]              = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
    ["n|k"]              = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
    -- Plugin QuickRun
    ["n|<Leader>r"]     = map_cr("<cmd> lua require'internal.quickrun'.run_command()"):with_noremap():with_silent(),
    -- Toggle virtual_text
    ["n|<Leader>lv"]     = map_cr("<cmd>lua require'internal.virtual_text'.toggle()<CR>"):with_noremap():with_silent(),
    -- Plugin Vista
    ["n|<Leader>v"]      = map_cu('Vista'):with_noremap():with_silent(),
    -- Plugin vim-operator-surround
    -- ["n|sa"]             = map_cmd("<Plug>(operator-surround-append)"):with_silent(),
    -- ["n|sd"]             = map_cmd("<Plug>(operator-surround-delete)"):with_silent(),
    -- ["n|sr"]             = map_cmd("<Plug>(operator-surround-replace)"):with_silent(),
    -- Plugin hrsh7th/vim-eft
    ["n|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["x|;"]              = map_cmd("v:lua.enhance_ft_move(';')"):with_expr(),
    ["n|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["x|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["o|f"]              = map_cmd("v:lua.enhance_ft_move('f')"):with_expr(),
    ["n|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["x|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    ["o|F"]              = map_cmd("v:lua.enhance_ft_move('F')"):with_expr(),
    -- Plugin vim_niceblock
    ["x|I"]              = map_cmd("v:lua.enhance_nice_block('I')"):with_expr(),
    ["x|gI"]             = map_cmd("v:lua.enhance_nice_block('gI')"):with_expr(),
    ["x|A"]              = map_cmd("v:lua.enhance_nice_block('A')"):with_expr(),
    -- Plugin vim-ipython-cell
    ["n|<Leader>as"]     = map_cu('SlimeSend1 ipython --matplotlib'):with_noremap():with_silent(),
    ["n|<Leader>ar"]     = map_cu('IPythonCellRun'):with_noremap():with_silent(),
    ["n|<Leader>aR"]     = map_cu('IPythonCellRunTime'):with_noremap():with_silent(),
    ["n|<Leader>ac"]     = map_cu('IPythonCellExecuteCell'):with_noremap():with_silent(),
    ["n|<Leader>aC"]     = map_cu('IPythonCellExecuteCellJump'):with_noremap():with_silent(),
    ["n|<Leader>al"]     = map_cu('IPythonCellClear'):with_noremap():with_silent(),
    ["n|<Leader>ax"]     = map_cu('IPythonCellClose'):with_noremap():with_silent(),
    ["n|[c"]     = map_cu('IPythonCellPrevCell'):with_noremap():with_silent(),
    ["n|]c"]     = map_cu('IPythonCellNextCell'):with_noremap():with_silent(),
    ["n|<Leader>ah"]             = map_cmd("<Plug>SlimeLineSend"):with_silent(),
    ["x|<Leader>ah"]             = map_cmd("<Plug>SlimeRegionSend"):with_silent(),
    ["n|<Leader>ap"]     = map_cu('IPythonCellPrevCommand'):with_noremap():with_silent(),
    ["n|<Leader>aQ"]     = map_cu('IPythonCellRestart'):with_noremap():with_silent(),
    ["n|<Leader>ad"]     = map_cu('SlimeSend1 %debug'):with_noremap():with_silent(),
    ["n|<Leader>aq"]     = map_cu('SlimeSend1 exit'):with_noremap():with_silent(),
    ["n|<A-p>"]             = map_cmd(":IPythonCellInsertAbove<CR>a"):with_silent(),
    ["n|<A-n>"]             = map_cmd(":IPythonCellInsertBelow<CR>a"):with_silent(),
    ["i|<A-p>"]             = map_cmd("<C-o>:IPythonCellInsertAbove<CR>"):with_silent(),
    ["i|<A-n>"]             = map_cmd("<C-o>:IPythonCellInsertBelow<CR>"):with_silent(),
    -- Plugin git
    ["n|<Leader>gl"]     = map_cu("require('gitsigns').blame_line()"):with_noremap():with_silent(),
    ["n|<Leader>gr"]     = map_cu("require('gitsigns').reset_hunk()"):with_noremap():with_silent(),
    ["n|<Leader>gR"]     = map_cu("require('gitsigns').reset_buffer()"):with_noremap():with_silent(),
    ["n|<Leader>gs"]     = map_cu("require('gitsigns').stage_hunk()"):with_noremap():with_silent(),
    ["n|<Leader>gu"]     = map_cu("require('gitsigns').undo_stage_hunk()"):with_noremap():with_silent(),
    ["n|<Leader>go"]     = map_cu('Telescope git_status'):with_noremap():with_silent(),
    ["n|<Leader>gc"]     = map_cu('Telescope git_commits'):with_noremap():with_silent(),
    ["n|<Leader>gC"]     = map_cu('Telescope git_bcommits'):with_noremap():with_silent(),
    -- Plugin hlslens
    -- ["n|*"]          = map_cmd("*<cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
    -- ["n|#"]          = map_cmd("#<cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
    -- ["n|g*"]          = map_cmd("g*<cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
    -- ["n|g#"]          = map_cmd("g#<cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
    -- ["n|n"]          = map_cmd("<Cmd>execute('normal! ' . v:count1 . 'n')<CR> <Cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
    -- ["n|N"]          = map_cmd("<Cmd>execute('normal! ' . v:count1 . 'N')<CR> <Cmd>lua require('hlslens').start()<CR>"):with_silent():with_noremap():with_nowait(),
};

bind.nvim_load_mapping(plug_map)
