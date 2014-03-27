" local settings {{{1
silent! setlocal buftype=
silent! setlocal bufhidden=hide
silent! setlocal nobuflisted

silent! setlocal cursorline
silent! setlocal nonumber
silent! setlocal nowrap
silent! setlocal statusline=

silent! setlocal foldenable
silent! setlocal foldmethod=marker foldmarker={,} foldlevel=1
silent! setlocal foldtext=exproject#foldtext()
silent! setlocal foldminlines=0
silent! setlocal foldlevel=9999
" }}}1

" Key Mappings {{{1
" nnoremap <silent> <buffer> <ESC> :EXProjectClose<CR>
nnoremap <silent> <buffer> <Space> :call exproject#toggle_zoom()<CR>

nnoremap <silent> <buffer> <Plug>ConfirmSelect :call exproject#confirm_select('')<CR>
nmap <silent> <buffer> <CR> <Plug>ConfirmSelect
nmap <silent> <buffer> <2-LeftMouse> <Plug>ConfirmSelect

nnoremap <silent> <buffer> <Plug>ShiftConfirmSelect :call exproject#confirm_select('shift')<CR>
nmap <silent> <buffer> <S-Return> <Plug>ShiftConfirmSelect
nmap <silent> <buffer> <S-2-LeftMouse> <Plug>ShiftConfirmSelect

nnoremap <silent> <buffer> <leader>R :EXProjectBuild<CR>
nnoremap <silent> <buffer> <leader>r :EXProjectRefresh<CR>
" nnoremap <silent> <buffer> <leader>e    :call <SID>exPJ_EchoPath()<CR>

" "
" nnoremap <silent> <buffer> <c-up> :call exUtility#CursorJump( 'ErrorLog.err', 'up' )<CR>
" nnoremap <silent> <buffer> <c-down> :call exUtility#CursorJump( 'ErrorLog.err', 'down' )<CR>

" nnoremap <silent> <buffer> <c-k> :call exUtility#CursorJump( '\C\[F\]', 'up' )<CR>
" nnoremap <silent> <buffer> <c-j> :call exUtility#CursorJump( '\C\[F\]', 'down' )<CR>

" "
" nnoremap <silent> <buffer> o  :call <SID>exPJ_CreateNewFile()<CR>
" nnoremap <silent> <buffer> O  :call <SID>exPJ_CreateNewFold()<CR>
" }}}1

" auto command {{{1
" au CursorHold <buffer> :call s:exPJ_EchoPath()
" }}}1

" vim:ts=4:sw=4:sts=4 et fdm=marker:
