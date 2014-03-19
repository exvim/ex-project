" default configuration {{{1
if !exists('g:ex_project_file')
    let g:ex_project_file = "./files.exproject"
endif

if !exists('g:ex_project_winsize')
    let g:ex_project_winsize = 30
endif

if !exists('g:ex_project_winsize_zoom')
    let g:ex_project_winsize_zoom = 80
endif

" left or right
if !exists('g:ex_project_winpos')
    let g:ex_project_winpos = 'left'
endif

"}}}

" commands {{{1
command! -n=1 EXProject call exproject#open('<args>')
"}}}

" vim:ts=4:sw=4:sts=4 et fdm=marker:
