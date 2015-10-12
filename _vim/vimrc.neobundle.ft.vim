NeoBundle 'pangloss/vim-javascript'
NeoBundle 'JavaScript-syntax'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'groenewege/vim-less'
NeoBundle 'leshill/vim-json'
NeoBundle 'cespare/vim-toml'
NeoBundle "ekalinin/Dockerfile.vim"
NeoBundle 'slim-template/vim-slim'
NeoBundle 'lambdatoast/elm.vim'
NeoBundle 'syngan/vim-pukiwiki'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'mustache/vim-mustache-handlebars'
" NeoBundle 'rbtnn/rabbit-ui.vim'
" NeoBundle 'rbtnn/rabbit-ui-collection.vim'

exe "set rtp+=".globpath($HOME, "/gocode/src/github.com/nsf/gocode/vim")
augroup vimrcGo
  autocmd!
  autocmd FileType go highlight goErr ctermfg=214 guifg=#ffaf00
  autocmd BufEnter *.go highlight goErr ctermfg=214 guifg=#ffaf00
  autocmd FileType go match goErr /\<err\>/
  autocmd BufEnter *.go match goErr /\<err\>/
augroup END

" Format css/less/scss
" NeoBundle 'miripiruni/CSScomb-for-Vim'
"
" augroup vimrcCss
"   autocmd!
"   autocmd BufWritePre *.css,*.less call <SID>format_css()
" augroup END
"
" function! s:format_css()
"     let cursor = getpos(".")
"     CSScomb
"     %s/\v(^[ \t]*[a-zA-Z0-9_@-]+:)(|  +)[^ \t]@=/\1 /e
"     %s/\v(\n@<!\n|\n\n\n+)([ \t]*[^ \t]+) *\{/\\\2 {/e
"     %s/\v *\> */ > /eg
"     call setpos(".", cursor)
"     unlet cursor
" endfunction


" ShellScript
au BufNewFile,BufRead *.envrc setf sh


"******************************************************************************
" Filetype
"******************************************************************************
augroup MyPHP
  autocmd!
  autocmd BufEnter *.mod set ft=php
  autocmd BufEnter *.inc set ft=php
  autocmd BufEnter *.cnf set ft=php
  autocmd BufEnter *.check set ft=php
  autocmd BufEnter *.edit set ft=php
  autocmd BufEnter *.view set ft=php
  autocmd BufEnter *.hlp set ft=php

  autocmd FileType php set completeopt-=preview
augroup END
