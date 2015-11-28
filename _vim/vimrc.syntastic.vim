NeoBundle 'scrooloose/syntastic'
" phpcs
let Vimphpcs_Standard='~/phpcs/Tapirus'
" command! P :execute 'CodeSniff'
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 1
let g:syntastic_php_phpcs_args = '--report=csv --standard=/home/kenji.omoto/.hde-phpcs-ruleset/Tapirus'

let g:syntastic_ruby_checkers=['rubocop']

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

let g:syntastic_sql_checkers=['pgsanity']
" let g:syntastic_sql_checker_args='--ignore=E501,E225'

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
noremap <Leader>l :ll<CR>

let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_sh_shellcheck_args = '-e SC2002'

let g:syntastic_java_checkers=[]
let g:syntastic_scala_checkers=[]
