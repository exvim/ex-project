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
syntax match ex_pj_tree_line '\( |\)\+-\{0,1}'
" syntax match ex_pj_filter '^.* filter = .*$'

syntax match ex_pj_folder_label '\C\[F\]'
syntax match ex_pj_folder_name '\(\C\[F\]\)\@<=\S.*' contains=ex_pj_fold_start,ex_pj_fold_end

syntax match ex_pj_file_name '|-\zs[^\(\C\[F\]\)]\S.*' contains=ex_pj_fold_start,ex_pj_fold_end

" syntax match ex_pj_clang_src_label '\C\[c\]'
" syntax match ex_pj_clang_src_name '\(\[c\]\)\@<=\S.*' contains=ex_pj_fold_start,ex_pj_fold_end

" syntax match ex_pj_clang_header_label '\[\(h\|i\)\]'
" syntax match ex_pj_clang_header_name '\(\[h\|i\]\)\@<=\S.*' contains=ex_pj_fold_start,ex_pj_fold_end

" syntax match ex_pj_error_file_label '\[e\]'
" syntax match ex_pj_error_file_name '\(\[e\]\)\@<=\S.*' contains=ex_pj_fold_start,ex_pj_fold_end

hi link ex_pj_fold_start exTransparent
hi link ex_pj_fold_end exTransparent

hi link ex_pj_help Comment
hi link ex_pj_tree_line Comment
" hi link ex_pj_filter Constant

hi link ex_pj_folder_label Title
hi link ex_pj_folder_name Directory

" hi link ex_pj_file_label Question
hi link ex_pj_file_name Question

" hi link ex_pj_clang_src_label DiffChange
" hi link ex_pj_clang_src_name Normal

" hi link ex_pj_clang_header_label DiffAdd
" hi link ex_pj_clang_header_name Normal

" hi link ex_pj_error_file_label Error
" hi link ex_pj_error_file_name Normal

let b:current_syntax = "exproject"

" vim:ts=4:sw=4:sts=4 et fdm=marker:
