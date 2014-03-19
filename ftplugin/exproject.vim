" local settings {{{1
silent! setlocal buftype=
silent! setlocal bufhidden=hide
silent! setlocal nobuflisted
silent! setlocal cursorline
silent! setlocal nonumber
silent! setlocal nowrap

silent! setlocal foldenable
silent! setlocal foldmethod=marker foldmarker={,} foldlevel=1
silent! setlocal foldtext=exproject#foldtext()
silent! setlocal foldminlines=0
silent! setlocal foldlevel=9999
silent! setlocal statusline=
" }}}1

" Key Mappings {{{1
" nnoremap <buffer> <silent> <ESC> :EXProjectClose<CR>
" nnoremap <buffer> <silent> <Space> :EXProjectToggleZoom<CR>

nmap <buffer> <CR> <Plug>ConfirmSelect
nmap <buffer> <2-LeftMouse> <Plug>ConfirmSelect

nmap <buffer> <S-Return> <Plug>ShiftConfirmSelect
nmap <buffer> <S-2-LeftMouse> <Plug>ShiftConfirmSelect

" nnoremap <silent> <buffer> <localleader>C    :call <SID>exPJ_CreateProject(1)<CR>
" nnoremap <silent> <buffer> <localleader>cf   :call <SID>exPJ_RefreshProject(1)<CR>
" nnoremap <silent> <buffer> <localleader>R    :call <SID>exPJ_CreateProject(0)<CR>
" nnoremap <silent> <buffer> <localleader>r    :call <SID>exPJ_RefreshProject(0)<CR>
" nnoremap <silent> <buffer> <localleader>e    :call <SID>exPJ_EchoPath()<CR>

" "
" nnoremap <silent> <buffer> <c-up> :call exUtility#CursorJump( 'ErrorLog.err', 'up' )<CR>
" nnoremap <silent> <buffer> <c-down> :call exUtility#CursorJump( 'ErrorLog.err', 'down' )<CR>

" nnoremap <silent> <buffer> <c-k> :call exUtility#CursorJump( '\C\[F\]', 'up' )<CR>
" nnoremap <silent> <buffer> <c-j> :call exUtility#CursorJump( '\C\[F\]', 'down' )<CR>

" "
" nnoremap <silent> <buffer> o  :call <SID>exPJ_CreateNewFile()<CR>
" nnoremap <silent> <buffer> O  :call <SID>exPJ_CreateNewFold()<CR>
" }}}1

" " Autocommands to keep the window the specified size
" au WinLeave <buffer> :call s:exPJ_RefreshWindow()
" au BufWritePost <buffer> :call s:exPJ_UpdateFilters()
" " au CursorMoved <buffer> :call exUtility#HighlightSelectLine()
" au CursorHold <buffer> :call s:exPJ_EchoPath()

" " init filter variables
" call s:exPJ_UpdateFilters ()

" vim:ts=4:sw=4:sts=4 et fdm=marker:
