if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" syntax highlight
" syntax match ex_pj_file_label '\C\[[^F]*\]'
syntax match ex_pj_help #^".*#
syntax match ex_pj_fold_start '{'
syntax match ex_pj_fold_end '}'
syntax match ex_pj_tree_line '\( |\)\+-\{0,1}.*' contains=ex_pj_folder_name,ex_pj_file_name
" syntax match ex_pj_filter '^.* filter = .*$'

syntax match ex_pj_folder_label '\C\[F\]'
syntax match ex_pj_folder_name '\C\[F\]\S.*'hs=s+3 contains=ex_pj_folder_label,ex_pj_fold_start,ex_pj_fold_end

syntax match ex_pj_file_name '|-[^\[]\S.*'ms=s+2 contains=@ex_pj_special_files,ex_pj_fold_start,ex_pj_fold_end

syntax match ex_pj_ft_exvim '.*\.\(exvim\|vimentry\|vimproject\)$' contained
syntax match ex_pj_ft_clang_src '.*\.\(c\|cpp\|cxx\)$' contained
syntax match ex_pj_ft_clang_header '.*\.h$' contained
syntax match ex_pj_ft_error '.*\.err$' contained

syntax cluster ex_pj_special_files contains=
            \ex_pj_ft_exvim
            \,ex_pj_ft_clang_src
            \,ex_pj_ft_clang_header
            \,ex_pj_ft_error


hi link ex_pj_fold_start exTransparent
hi link ex_pj_fold_end exTransparent

hi link ex_pj_help Comment
hi link ex_pj_tree_line Comment
" hi link ex_pj_filter Constant

hi link ex_pj_folder_label Title
hi link ex_pj_folder_name Directory

" hi link ex_pj_file_label Question
hi link ex_pj_file_name Normal

hi link ex_pj_ft_exvim DiffAdd
hi link ex_pj_ft_clang_src String
hi link ex_pj_ft_clang_header Label
hi link ex_pj_ft_error Error

let b:current_syntax = "exproject"

" vim:ts=4:sw=4:sts=4 et fdm=marker:
