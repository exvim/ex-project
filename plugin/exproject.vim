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

if !exists('g:ex_project_enable_help')
    let g:ex_project_enable_help = 1
endif

"}}}

" commands {{{1
command! -n=? -complete=file EXProject call exproject#open('<args>')
command! EXProjectOpen call exproject#open_window()
command! EXProjectClose call exproject#close_window()
command! EXProjectToggle call exproject#toggle_window()
command! EXProjectBuild call exproject#build_tree()
command! EXProjectFind call exproject#find_current_edit(1)
command! EXProjectRefresh call exproject#refresh_current_folder()
"}}}

" default key mappings {{{1
call exproject#register_hotkey( 1  , 1, '<F1>'            , ":call exproject#toggle_help()<CR>"                        , 'Toggle help.' )
call exproject#register_hotkey( 2  , 1, '<Space>'         , ":call exproject#toggle_zoom()<CR>"                        , 'Zoom in/out project window.' )
call exproject#register_hotkey( 3  , 1, '<CR>'            , ":call exproject#confirm_select('')<CR>"                   , 'File: Open it. Folder: Fold in/out.' )
call exproject#register_hotkey( 4  , 1, '<2-LeftMouse>'   , ":call exproject#confirm_select('')<CR>"                   , 'File: Open it. Folder: Fold in/out.' )
call exproject#register_hotkey( 5  , 1, '<S-CR>'          , ":call exproject#confirm_select('shift')<CR>"              , 'File: Split and open it. Folder: Open the folder in os file browser.' )
call exproject#register_hotkey( 6  , 1, '<S-2-LeftMouse>' , ":call exproject#confirm_select('shift')<CR>"              , 'File: Split and open it. Folder: Open the folder in os file browser.' )
call exproject#register_hotkey( 7  , 1, '<C-k>'           , ":call exproject#cursor_jump( '\\C\\[F\\]', 'up' )<CR>"    , 'Move cursor up to the nearest folder.' )
call exproject#register_hotkey( 8  , 1, '<C-j>'           , ":call exproject#cursor_jump( '\\C\\[F\\]', 'down' )<CR>"  , 'Move cursor down to the nearest folder.' )
call exproject#register_hotkey( 9  , 1, '<leader>R'       , ":EXProjectBuild<CR>"                                      , 'Rebuild project tree.' )
call exproject#register_hotkey( 10 , 1, '<leader>r'       , ":EXProjectRefresh<CR>"                                    , 'Refresh current folder.' )
call exproject#register_hotkey( 11 , 1, 'o'               , ":call exproject#newfile()<CR>"                            , 'Create new file.' )
call exproject#register_hotkey( 12 , 1, 'O'               , ":call exproject#newfolder()<CR>"                          , 'Create new folder.' )

" TODO:
" nnoremap <silent> <buffer> <leader>e    :call <SID>exPJ_EchoPath()<CR>
"}}}

call ex#register_plugin( 'exproject', {} )
call ex#register_plugin( 'nerdtree', { 'bufname': 'NERD_tree_\d\+', 'buftype': 'nofile' } )

" vim:ts=4:sw=4:sts=4 et fdm=marker:
