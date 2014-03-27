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

" vim:ts=4:sw=4:sts=4 et fdm=marker:
