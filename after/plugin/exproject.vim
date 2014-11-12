" ex-project, NERDTree swap
if exists ( ':NERDTreeToggle' ) && exists( ':EXProjectOpen' )
    " ex-project to NERDTree
    call exproject#register_hotkey( 100 , 1, '<C-Tab>', ":call EXProjectToNERDTree()<CR>", 'Switch to NERDTree.' )
    function! EXProjectToNERDTree()
        exec 'EXProjectClose'
        exec 'NERDTreeToggle'
        " exec 'NERDTreeFind'

        if maparg('<leader>fc','n') != ""
            nunmap <leader>fc
        endif
        nnoremap <unique> <leader>fc :NERDTreeFind<CR>

        if has('gui_running') "  the <alt> key is only available in gui mode.
            if has ('mac')
                if maparg('Ø','n') != ""
                    nunmap Ø
                endif
                nnoremap <unique> Ø :NERDTreeFind<CR>:redraw<CR>/
            else
                if maparg('<M-O>','n') != ""
                    nunmap <M-O>
                endif
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

        if maparg('<leader>fc','n') != ""
            nunmap <leader>fc
        endif
        call exproject#register_hotkey( 100, 0, '<leader>fc', ":EXProjectFind<CR>", 'Find current edit buffer in project window.' )

        if has('gui_running')
            if has ('mac')
                if maparg('Ø','n') != ""
                    nunmap Ø
                endif
                call exproject#register_hotkey( 101, 0, 'Ø', ":EXProjectOpen<CR>:redraw<CR>/", 'Open project window and stay in search mode.' )
            else
                if maparg('<M-O>','n') != ""
                    nunmap <M-O>
                endif
                call exproject#register_hotkey( 101, 0, '<M-O>', ":EXProjectOpen<CR>:redraw<CR>/", 'Open project window and stay in search mode.' )
            endif
        endif
    endfunction
endif
