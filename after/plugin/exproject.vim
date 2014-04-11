" ex-project, NERDTree swap
if exists ( ':NERDTreeToggle' ) && exists( ':EXProjectOpen' )
    " ex-project to NERDTree
    call exproject#register_hotkey( 100 , '<C-Tab>', ":call EXProjectToNERDTree()<CR>", 'Switch to NERDTree.' )
    function! EXProjectToNERDTree()
        exec 'EXProjectClose'
        exec 'NERDTreeToggle'
        " exec 'NERDTreeFind'

        nunmap <leader>fc
        nnoremap <unique> <leader>fc :NERDTreeFind<CR>

        if has('gui_running') "  the <alt> key is only available in gui mode.
            if has ('mac')
                nunmap Ø
                nnoremap <unique> Ø :NERDTreeFind<CR>:redraw<CR>/
            else
                nunmap <M-O>
                nnoremap <unique> <M-O> :NERDTreeFind<CR>:redraw<CR>/
            endif
        endif
    endfunction

    " NERDTree to ex-project
    call NERDTreeAddKeyMap ( {
                \ 'key': '<C-Tab>',
                \ 'callback': 'NERDTreeToEXProject',
                \ 'quickhelpText': 'Switch to ex-project',
                \ 'scope': 'all' 
                \ } )

    function! NERDTreeToEXProject()
        exec 'NERDTreeClose'
        exec 'EXProjectOpen'
        " exec 'EXProjectFind'

        nunmap <leader>fc
        nnoremap <unique> <leader>fc :EXProjectFind<CR>

        if has('gui_running')
            if has ('mac')
                nunmap Ø
                nnoremap <unique> Ø :EXProjectOpen<CR>:redraw<CR>/
            else
                nunmap <M-O>
                nnoremap <unique> <M-O> :EXProjectOpen<CR>:redraw<CR>/
            endif
        endif
    endfunction
endif
