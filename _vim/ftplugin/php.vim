set shiftwidth=2
set softtabstop=2
function! PHPFoldSetting(lnum)
    let l:line = getline(a:lnum)
    if l:line =~ 'function'
        return '>1'
    elseif getline(a:lnum + 1) =~ ' \* '
        return 0
    elseif getline(a:lnum) =~ ' \* '
        return 0
    else
        return '='
    endif
endfunction

autocmd BufEnter *.php set foldmethod=expr foldexpr=PHPFoldSetting(v:lnum)
