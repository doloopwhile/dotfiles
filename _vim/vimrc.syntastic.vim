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
let g:syntastic_ruby_rubocop_args='--display-cop-names'

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

let g:syntastic_sql_checkers=['pgsanity']
" let g:syntastic_sql_checker_args='--ignore=E501,E225'

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_sh_shellcheck_args = '-e SC2002'

let g:syntastic_java_checkers=[]
let g:syntastic_scala_checkers=[]

let g:syntastic_javascript_checkers=['jscs']

" noremap <silent> <buffer> <expr> j <SID>jk_location_list(v:count1)
" noremap <silent> <buffer> <expr> k <SID>jk_location_list(-v:count1)

" wrap :cnext/:cprevious and :lnext/:lprevious
"http://stackoverflow.com/questions/27198612/vim-location-list-how-to-go-to-first-location-if-at-last-location
noremap [ :call LocationListNextWrap()<CR>
function! LocationListNextWrap()
  try
    execute "lnext"
  catch /^Vim\%((\a\+)\)\=:E553/
    execute "lfirst"
  catch /^Vim\%((\a\+)\)\=:E\%(776\|42\):/
  endtry
endfunction
