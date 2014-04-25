" local settings {{{1
silent! setlocal buftype=
silent! setlocal bufhidden=hide
silent! setlocal nobuflisted

silent! setlocal cursorline
silent! setlocal nonumber
silent! setlocal nowrap
silent! setlocal statusline=

silent! setlocal foldenable
silent! setlocal foldmethod=marker foldmarker={,}
silent! setlocal foldtext=exproject#foldtext()
silent! setlocal foldminlines=0
" }}}1

" Key Mappings Binding {{{1
call exproject#bind_mappings()
" }}}1

" auto command {{{1
augroup ex_project
    au!
    au BufWritePre <buffer> call exproject#on_save()
    " au CursorHold <buffer> :call s:exPJ_EchoPath()
augroup END
" }}}1

" vim:ts=4:sw=4:sts=4 et fdm=marker:
