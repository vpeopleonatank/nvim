autocmd filetype cpp nnoremap <F2> :w <bar> FloatermSend g++ -std=c++14 % -o %:r <CR>
autocmd filetype cpp nnoremap <F3> :exec 'FloatermSend ./%:r' <bar> FloatermToggle<CR>
autocmd filetype cpp nnoremap <F4> :exec 'FloatermSend ./%:r < %:r.inp' <bar> FloatermToggle<CR>
