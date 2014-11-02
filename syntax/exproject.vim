if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" syntax highlight
syntax match ex_pj_help #^".*# contains=ex_pj_help_key
syntax match ex_pj_help_key '^" \S\+:'hs=s+2,he=e-1 contained contains=ex_pj_help_comma
syntax match ex_pj_help_comma ':' contained

syntax match ex_pj_fold '{\|}'
syntax match ex_pj_tree_line '\( |\)\+-\{0,1}.*' contains=ex_pj_folder_name,ex_pj_file_name

syntax match ex_pj_folder_label '\C\[F\]'
syntax match ex_pj_folder_name '\C\[F\].*'hs=s+3 contains=ex_pj_folder_label,ex_pj_fold

syntax match ex_pj_file_name '|-[^\[]\+'ms=s+2 contains=@ex_pj_special_files,ex_pj_fold

syntax match ex_pj_ft_clang_src '.*\.\(c\|cpp\|cxx\)\>' contained
syntax match ex_pj_ft_clang_header '.*\.\(h\)\>' contained
syntax match ex_pj_ft_script '.*\.\(js\|coffee\|typescript\|lua\|py\)\>' contained
syntax match ex_pj_ft_html '.*\.\(html\|xml\|json\)\>' contained
syntax match ex_pj_ft_style '.*\.\(css\|styl\|less\|sass\)\>' contained

syntax match ex_pj_ft_exvim '.*\.\(exvim\|vimentry\|vimproject\)\>' contained
syntax match ex_pj_ft_gulpfile 'gulpfile\.\(js\|coffee\)' contained
syntax match ex_pj_ft_gruntfile 'gruntfile\.\(js\|coffee\)' contained
syntax match ex_pj_ft_package_json 'package\.json' contained
syntax match ex_pj_ft_bower_json 'bower\.json' contained
syntax match ex_pj_ft_error '.*\.\(err\)\>' contained

syntax cluster ex_pj_special_files contains=
            \ex_pj_ft_exvim
            \,ex_pj_ft_error
            \,ex_pj_ft_gulpfile
            \,ex_pj_ft_package_json
            \,ex_pj_ft_bower_json
            \,ex_pj_ft_clang_src
            \,ex_pj_ft_clang_header
            \,ex_pj_ft_script
            \,ex_pj_ft_html
            \,ex_pj_ft_style


hi default link ex_pj_help Comment
hi default link ex_pj_help_key Label
hi default link ex_pj_help_comma Special

hi default link ex_pj_fold exTransparent
hi default link ex_pj_tree_line Comment

hi default link ex_pj_folder_label Title
hi default link ex_pj_folder_name Directory

hi default link ex_pj_file_name Normal

hi default link ex_pj_ft_exvim DiffAdd
hi default link ex_pj_ft_gulpfile DiffChange
hi default link ex_pj_ft_package_json DiffChange
hi default link ex_pj_ft_bower_json DiffChange
hi default link ex_pj_ft_error Error

hi default link ex_pj_ft_clang_src Normal
hi default link ex_pj_ft_clang_header Normal
hi default link ex_pj_ft_script Normal
hi default link ex_pj_ft_html helpVim
hi default link ex_pj_ft_style Label 

let b:current_syntax = "exproject"

" vim:ts=4:sw=4:sts=4 et fdm=marker:
