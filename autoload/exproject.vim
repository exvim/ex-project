" variables " {{{1
let s:cur_project_file = "" 
" }}}

" exproject#open " {{{
function exproject#open(filename)
    " if the filename is empty, use default project file
    let filename = a:filename
    if filename == ""
        let filename = g:ex_project_file
    endif

    " if we open a different project, close the old one first.
    if filename !=# s:cur_project_file
        if s:cur_project_file != ""
            let winnr = bufwinnr(s:cur_project_file)
            if winnr != -1
                call ex#window#close(winnr)
            endif
        endif

        " reset project filename and title.
        let s:cur_project_file = a:filename
    endif

    " open and goto the window
    let winnr = bufwinnr(s:cur_project_file)
    if winnr == -1
        call exproject#open_window()
    else
        exe winnr . 'wincmd w'
    endif
endfunction

" exproject#open_window " {{{
function exproject#open_window()
    call ex#window#open( 
                \ s:cur_project_file, 
                \ g:ex_project_winsize,
                \ g:ex_project_winpos,
                \ 0,
                \ 1
                \ )
endfunction

" exproject#toggle_widnow " {{{
function exproject#toggle_widnow()
    if s:cur_project_file != ""
        let winnr = bufwinnr(s:cur_project_file)
        if winnr != -1
            call ex#window#close(winnr)
            return
        endif
    endif

    call exproject#open_window()
endfunction

" vim:ts=4:sw=4:sts=4 et fdm=marker:
