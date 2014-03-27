" default configuration {{{1
if !exists('g:ex_project_file')
    let g:ex_project_file = "./files.exproject"
endif

if !exists('g:ex_project_winsize')
    let g:ex_project_winsize = 30
endif

if !exists('g:ex_project_winsize_zoom')
    let g:ex_project_winsize_zoom = 60
endif

" left or right
if !exists('g:ex_project_winpos')
    let g:ex_project_winpos = 'left'
endif

"}}}

" commands {{{1
command! -n=1 -complete=file EXProject call exproject#open('<args>')
command! EXProjectOpen call exproject#open_window()
command! EXProjectClose call exproject#close_window()
command! EXProjectBuild call exproject#build_tree()
command! EXProjectFind call exproject#find_current_edit(1)
command! EXProjectRefresh call exproject#refresh_current_folder()
"}}}

" default key mappings {{{1
call exproject#register_hotkey( 1 , '<F1>'            , ":call exproject#toggle_help()<CR>"           , 'Toggle help.' )
call exproject#register_hotkey( 2 , '<Space>'         , ":call exproject#toggle_zoom()<CR>"           , 'Zoom in/out project window.' )
call exproject#register_hotkey( 3 , '<CR>'            , ":call exproject#confirm_select('')<CR>"      , 'File: Open it. Folder: Fold in/out.' )
call exproject#register_hotkey( 4 , '<2-LeftMouse>'   , ":call exproject#confirm_select('')<CR>"      , 'File: Open it. Folder: Fold in/out.' )
call exproject#register_hotkey( 5 , '<S-CR>'          , ":call exproject#confirm_select('shift')<CR>" , 'File: Split and open it. Folder: Open the folder in os file browser.' )
call exproject#register_hotkey( 6 , '<S-2-LeftMouse>' , ":call exproject#confirm_select('shift')<CR>" , 'File: Split and open it. Folder: Open the folder in os file browser.' )
call exproject#register_hotkey( 7 , '<leader>R'       , ":EXProjectBuild<CR>"                         , 'Rebuild project tree.' )
call exproject#register_hotkey( 8 , '<leader>r'       , ":EXProjectRefresh<CR>"                       , 'Refresh current folder.' )

" TODO:
" nnoremap <silent> <buffer> <leader>e    :call <SID>exPJ_EchoPath()<CR>

" "
" nnoremap <silent> <buffer> <c-up> :call exUtility#CursorJump( 'ErrorLog.err', 'up' )<CR>
" nnoremap <silent> <buffer> <c-down> :call exUtility#CursorJump( 'ErrorLog.err', 'down' )<CR>

" nnoremap <silent> <buffer> <c-k> :call exUtility#CursorJump( '\C\[F\]', 'up' )<CR>
" nnoremap <silent> <buffer> <c-j> :call exUtility#CursorJump( '\C\[F\]', 'down' )<CR>

" "
" nnoremap <silent> <buffer> o  :call <SID>exPJ_CreateNewFile()<CR>
" nnoremap <silent> <buffer> O  :call <SID>exPJ_CreateNewFold()<CR>
"}}}

" vim:ts=4:sw=4:sts=4 et fdm=marker:
