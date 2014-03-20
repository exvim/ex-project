" variables {{{1
let s:cur_project_file = "" 
" }}}

" functions {{{1

" s:init_buffer {{{2
function! s:init_buffer()
    " NOTE: this maybe a BUG of Vim.
    " When I open exproject window and read the file through vimentry scripts,
    " the events define in exproject/ftdetect/exproject.vim will not execute.
    " I guess this is because when you are in BufEnter event( the .vimentry
    " enters ), and open the other buffers, the Vim will not trigger other
    " buffers' event 
    " This is why I set the filetype manually here. 
    set filetype=exproject
endfunction

" exproject#foldtext {{{2
function exproject#foldtext()
    let line = getline(v:foldstart)
    let line = substitute(line,'\[F\]\(.\{-}\) {.*','\[+\]\1 ','')
    return line
endfunction

" exproject#open {{{2
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

" exproject#open_window {{{2
function exproject#open_window()
    call ex#window#open( 
                \ s:cur_project_file, 
                \ g:ex_project_winsize,
                \ g:ex_project_winpos,
                \ 0,
                \ 1,
                \ function('s:init_buffer')
                \ )
endfunction

" exproject#toggle_widnow {{{2
function exproject#toggle_widnow()
    let result = exproject#close_window()
    if result == 0
        call exproject#open_window()
    endif
endfunction

" exproject#close_window {{{2
function exproject#close_window()
    if s:cur_project_file != ""
        let winnr = bufwinnr(s:cur_project_file)
        if winnr != -1
            call ex#window#close(winnr)
            return 1
        endif
    endif
    return 0
endfunction

" exproject#confirm_select {{{2
" modifier: '' or 'shift'

function exproject#confirm_select(modifier) " <<<
    " check if the line is valid file line
    let curline = getline('.') 
    if match(curline, '\C\[.*\]') == -1
        call ex#warning('Please select a folder/file')
        return
    endif

    let editcmd = 'e'
    if a:modifier == 'shift'
        let editcmd = 'bel sp'
    endif

    " initial variable
    let cursor_line = line('.')
    let cursor_col = col('.')

    " if this is a fold, do fold operation or open the path by terminal
    if foldclosed('.') != -1 || match(curline, '\C\[F\]') != -1
        if a:modifier == 'shift'
            " TODO: call ex#terminal ( 'remain', 'nowait', 'cd '. s:exPJ_GetPath(s:exPJ_cursor_line) )
        else
            normal! za
        endif
        return
    endif

    let fullpath = exproject#getpath(cursor_line) . exproject#getname(cursor_line)

    silent call cursor(cursor_line,cursor_col)

    " simplify the file name
    let fullpath = fnamemodify( fullpath, ':p' )
    let fullpath = escape(fullpath,' ')

    " switch filetype
    let filetype = fnamemodify( fullpath, ':e' )
    if filetype == 'err'
        " TODO:
        " call ex#hint('load quick fix list: ' . fullpath)
        " call exUtility#GotoPluginBuffer()
        " silent exec 'QF '.fullpath
        " " NOTE: when open error by QF, we don't want to exec exUtility#OperateWindow below ( we want keep stay in the exQF plugin ), so return directly 
        return 
    elseif filetype == 'exe'
        " TODO:
        " call ex#hint('debug ' . fullpath)
        " call exUtility#GotoEditBuffer()
        " call exUtility#Debug( fullpath )
        return
    else " default
        " put the edit file
        call ex#hint(fnamemodify(fullpath, ':p:.'))

        " goto edit window
        call ex#window#goto_edit_window()

        " do not open again if the current buffer is the file to be opened
        if fnamemodify(expand('%'),':p') != fnamemodify(fullpath,':p')
            silent exec editcmd.' '.fullpath
        endif
    endif

    " TODO:
    " " go back if needed
    " call exUtility#OperateWindow ( s:exPJ_select_title, g:exPJ_close_when_selected, g:exPJ_backto_editbuf, 0 )
endfunction

" exproject#search_for_pattern {{{2
function exproject#search_for_pattern( linenr, pattern )
    for linenum in range(a:linenr , 1 , -1)
        if match( getline(linenum) , a:pattern ) != -1
            return linenum
        endif
    endfor
    return 0
endfunction

" exproject#getname {{{2
function exproject#getname( linenr )
    let line = getline(a:linenr)
    let line = substitute(line,'.\{-}\[.\{-}\]\(.\{-}\)','\1','')
    let idx_end_1 = stridx(line,' {')
    let idx_end_2 = stridx(line,' }')
    if idx_end_1 != -1
        let line = strpart(line,0,idx_end_1)
    elseif idx_end_2 != -1
        let line = strpart(line,0,idx_end_2)
    endif
    return line
endfunction

" exproject#getpath {{{2
" Desc: Get the full path of the line, by YJR
function exproject#getpath( linenr )
    let foldlevel = exproject#getfoldlevel(a:linenr)
    let fullpath = ""

    " recursively make full path
    if match(getline(a:linenr),'[^^]-\C\[F\]') != -1
        let fullpath = exproject#getname( a:linenr )
    endif

    let level_pattern = repeat('.',foldlevel-1)
    let searchpos = a:linenr
    while foldlevel > 1 " don't parse level:0
        let foldlevel -= 1
        let level_pattern = repeat('.',foldlevel*2)
        let fold_pattern = '^'.level_pattern.'-\C\[F\]'
        let searchpos = exproject#search_for_pattern(searchpos , fold_pattern)
        if searchpos
            let fullpath = exproject#getname(searchpos).'/'.fullpath
        else
            call ex#warning('Fold not found')
            break
        endif
    endwhile

    return fullpath
endfunction

" exproject#getfoldlevel {{{2
function exproject#getfoldlevel(linenr) " <<<
    let curline = getline(a:linenr)
    let curline = strpart(curline,0,strridx(curline,'|')+1)
    let str_len = strlen(curline)
    return str_len/2
endfunction

" }}}1

" vim:ts=4:sw=4:sts=4 et fdm=marker:
