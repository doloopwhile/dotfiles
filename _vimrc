set nocompatible
set nolazyredraw

set runtimepath+=~/.vim/neobundle/
call neobundle#begin(expand('~/.vim/bundle/'))

let g:neobundle#types#git#default_protocol = 'git'
source ~/.vim/vimrc.neobundle.vim
source ~/.vim/vimrc.syntastic.vim
source ~/.vim/vimrc.neobundle.colorscheme.vim
source ~/.vim/vimrc.neobundle.ft.vim

call neobundle#end()

"******************************************************************************
" Basic Configurations
"******************************************************************************
filetype plugin indent on
syntax on

" Gui Optimazation
" set guioptions=aciMrb
set guioptions=aciM

" Search
set ignorecase
set smartcase
set incsearch

" Indentation
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Temp files
set noswapfile " do not create temp files
set nobackup " do not create temp files

" Preview on autocompletion
set completeopt-=preview
" Clipboard
set clipboard=unnamed,unnamedplus,autoselect

" Other editing
set backspace=start,eol,indent "普通のエディタ風のBackSpace
set wildmode=list:longest " ファイル名補完をreadline風にする
autocmd BufWritePre * :%s/\s\+$//e " Delete tailing spaces at exit

" Visual
set notitle
set nowrap
set number
set showmatch
set wildmenu
set nofoldenable

set list
set listchars=tab:^\ ,trail:~
if exists('&ambiwidth')
    set ambiwidth=double
endif
set display=lastline

set showtabline=2
set laststatus=2 " ステータスラインの表示

" 行が長くなっても勝手に改行しない
set textwidth=0

" <Insert>の置換モードを無効にする
function! s:ForbidReplace()
    if v:insertmode isnot# 'i'
        call feedkeys("\<Insert>", "n")
    endif
endfunction
augroup ForbidReplaceMode
    autocmd!
    autocmd InsertEnter  * call s:ForbidReplace()
    autocmd InsertChange * call s:ForbidReplace()
augroup END

set modeline

" tag
set tags=./.tags;

" Automatically change current directory
set autochdir

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
"******************************************************************************
" Highlightings
"******************************************************************************
set cursorline
set nocursorcolumn
set hlsearch

autocmd CursorMoved syn sync fromstart

augroup MyColorScheme
  autocmd!
  " set t_Co=256

  " hi Normal ctermbg=none guifg=#C8E3E6

  autocmd ColorScheme * highlight WhitespaceEOL ctermbg=red guibg=red
  autocmd ColorScheme match WhitespaceEOL /\s\+$/
  autocmd WinEnter * match WhitespaceEOL /\s\+$/

  autocmd ColorScheme * hi Search ctermbg=blue ctermfg=white
  autocmd ColorScheme * hi SpecialKey ctermfg=red  guifg=red

  autocmd ColorScheme * hi WindowsNewLineCode ctermbg=red guibg=red
  autocmd ColorScheme match  WindowsNewLineCode //

  " 選択されているタブを反転
  autocmd ColorScheme * hi TabLine cterm=reverse gui=reverse

  " 補完候補の色
  autocmd ColorScheme * hi Pmenu ctermbg=white ctermfg=black
  autocmd ColorScheme * hi PmenuSel ctermbg=blue ctermfg=black

  " 行番号の色
  " autocmd ColorScheme * hi LineNr guifg=#7e8e91
  autocmd ColorScheme * hi clear CursorLine
augroup END


" 'cursorline' を必要な時にだけ有効にする
" http://d.hatena.ne.jp/thinca/20090530/1243615055
" を少し改造、number の highlight は常に有効にする

colorscheme molokai
"******************************************************************************
" Key Mappings
"******************************************************************************
" Normalモード時の移動を無効
nmap <Enter> <NOP>
nmap <BS> <NOP>
nmap <Space> <NOP>

" ファンクションキーを挿入モードで無効化
imap <F1> <NOP>
imap <F2> <NOP>
imap <F3> <NOP>
imap <F4> <NOP>
imap <F5> <NOP>
imap <F6> <NOP>
imap <F7> <NOP>
imap <F8> <NOP>
imap <F9> <NOP>
imap <F10> <NOP>
imap <F11> <NOP>
imap <F12> <NOP>
imap <F12> <NOP>
imap <F13> <NOP>
imap <F14> <NOP>
imap <F15> <NOP>
imap <F16> <NOP>
imap <F17> <NOP>
imap <F18> <NOP>
imap <F19> <NOP>
imap <F20> <NOP>
imap <F21> <NOP>
imap <F22> <NOP>
imap <F23> <NOP>
imap <F24> <NOP>
imap <C-F1> <NOP>
imap <C-F2> <NOP>
imap <C-F3> <NOP>
imap <C-F4> <NOP>
imap <C-F5> <NOP>
imap <C-F6> <NOP>
imap <C-F7> <NOP>
imap <C-F8> <NOP>
imap <C-F9> <NOP>
imap <C-F10> <NOP>
imap <C-F11> <NOP>
imap <C-F12> <NOP>
imap <C-F12> <NOP>
imap <C-F13> <NOP>
imap <C-F14> <NOP>
imap <C-F15> <NOP>
imap <C-F16> <NOP>
imap <C-F17> <NOP>
imap <C-F18> <NOP>
imap <C-F19> <NOP>
imap <C-F20> <NOP>
imap <C-F21> <NOP>
imap <C-F22> <NOP>
imap <C-F23> <NOP>
imap <C-F24> <NOP>
imap <D-Space> <NOP>

" 日本語をローマ字で検索
noremap  <Leader>/ :<C-u>Migemo<CR>

"履歴表示の暴発を防ぐ
" F5キーでコマンド履歴を開く
" " F6キーで検索履歴を開く
nnoremap <leader>q: <ESC>q:
nnoremap <leader>q/ <ESC>q/
nnoremap <leader>q? <ESC>q?
nnoremap <leader>q <ESC>q
nnoremap <leader>Q <ESC>Q

vnoremap < <gv
vnoremap > >gv

noremap 0 ^
noremap ^ 0
nnoremap q <Nop>
nnoremap qqq <ESC>:q<CR>
nnoremap Q <Nop>

noremap <S-Up> Up
noremap <S-Down> Down
noremap <S-Left> Left
noremap <S-Right> Right
" noremap gf <C-w>gf
noremap <C-z> <NOP>
noremap <Insert> <NOP>
nnoremap <Space>h 0
nnoremap <Space>l $
noremap <C-b> nop
nnoremap / /\v
nnoremap ttt <ESC>:tabnew<CR>
command!-nargs=0 Vimrc tabedit ~/.vimrc

vnoremap z/ <ESC>/\%V
vnoremap zs <ESC>:s/\%V/
vnoremap s :s/\v

nnoremap <expr> K ':!grep "' . expand('<cword>') . '" . -R \| more'

" emacs-like commandline
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
"******************************************************************************
" Others
"******************************************************************************
"PHP
let php_sql_query=1
let php_htmlInStrings=1
autocmd BufNewFile,BufRead *.php,*.inc,*.wui,*.view,*.cnf,*.mod,*.check,*.edit,*.conf setf php

autocmd Filetype php let b:surround_45 = "<?php \r ?>"

autocmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif


" au BufWritePost * mkview
" autocmd BufReadPost * loadview

" カーソル下のキーワードをバッファ内全体で置換する
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'
set tabpagemax=100

"******************************************************************************
" Commands
"******************************************************************************

" 最初の非空行以外を削除する
command! FL :execute 'g/^ *$\|^ *#/d' | 2,$ d

" 別のエディタで開く
command! EE :execute ':silent !scribes % &' | :execute ':redraw!'


function! s:insert_on_top(str)
    let current_pos = getpos(".")
    call cursor(1, 1)
    execute ":normal O" . a:str
    let back_pos = [
          \ current_pos[0],
          \ current_pos[1] + 1,
          \ current_pos[2],
          \ current_pos[3]
          \ ]
    call setpos(".", back_pos)
endfunction

" マジックコメントをファイル先頭に挿入する(重複チェックはしない)
function! s:magic_comment()
  call s:insert_on_top("# -*- coding: utf-8 -*-")
endfunction
command! -nargs=0 MagicComment call <SID>magic_comment()


" Shebangをファイル先頭に挿入する(重複チェックはしない)
function! s:shebang(name)
  call s:insert_on_top("#!/usr/bin/env " . a:name)
endfunction
command! -nargs=1 Shebang call <SID>shebang(<f-args>)
command! -nargs=1 SMagicComment call <SID>magic_comment() | call <SID>shebang(<f-args>)


" 行頭 → 非空白行頭 → 行 をローテートする by Linda_pp
" http://qiita.com/items/ee4bf64b1fe2c0a32cbd#comment-e2aafa1f4e60ae49a730
function! s:rotate_in_line()
  let c = col('.')

  if c == 1
    let cmd = '^'
  else
    let cmd = '$'
  endif

  execute "normal! ".cmd

  if c == col('.')
    if cmd == '^'
      normal! $
    else
      normal! 0
    endif
  endif
endfunction
" , に割り当てる
noremap <silent>,, <ESC>:call s:rotate_in_line()<CR>


" Save as junk file."{{{
command! -nargs=0 JJ call s:save_as_junk_file()

function! s:save_as_junk_file()
  let l:junk_dir = $HOME . '/Downloads'
  let l:prefix = 'junk'

  if expand('%') !~# '^' . l:junk_dir . '/' . l:prefix
    if !isdirectory(l:junk_dir)
      call mkdir(l:junk_dir, 'p')
    endif

    let l:pattern_to_replace = '\s\|\/'
    let l:firstline = substitute(getline(1), l:pattern_to_replace, "_", "g")
    let l:filename = (l:junk_dir . '/' . l:prefix . l:firstline) . strftime('%Y-%m-%d-%H%M%S.txt')
    execute 'file ' . l:filename
  end

  execute 'write'

endfunction
"}}}

" apply chmod +x to file with shebang
" autocmd BufWritePost * :call s:add_exec_mod()
" function! s:add_exec_mod()
"     let line = getline(1)
"     if strpart(line, 0, 2) == "#!"
"         call system("chmod +x ". expand("%"))
"     endif
" endfunction


command! -nargs=0 NewGuake call system('guake -n NEW && guake -e "cd `pwd`" && guake -t')

command! -nargs=0 NewTerminal call system('nohup xfce4-terminal --working-directory `pwd` &')

" Jump to Go-lang package source
function! GfGoImportFile()
  let path = expand('<cfile>')
  let path = system("go-import-jump " . path)
  return {
  \   'path': path,
  \   'line': 0,
  \   'col': 0,
  \ }
endfunction
call gf#user#extend('GfGoImportFile', 1000)

" Display syntax highlighting under the cursor
function! s:get_syn_id(transparent)
  let synid = synID(line("."), col("."), 1)
  if a:transparent
    return synIDtrans(synid)
  else
    return synid
  endif
endfunction
function! s:get_syn_attr(synid)
  let name = synIDattr(a:synid, "name")
  let ctermfg = synIDattr(a:synid, "fg", "cterm")
  let ctermbg = synIDattr(a:synid, "bg", "cterm")
  let guifg = synIDattr(a:synid, "fg", "gui")
  let guibg = synIDattr(a:synid, "bg", "gui")
  return {
        \ "name": name,
        \ "ctermfg": ctermfg,
        \ "ctermbg": ctermbg,
        \ "guifg": guifg,
        \ "guibg": guibg}
endfunction
function! s:get_syn_info()
  let baseSyn = s:get_syn_attr(s:get_syn_id(0))
  echo "name: " . baseSyn.name .
        \ " ctermfg: " . baseSyn.ctermfg .
        \ " ctermbg: " . baseSyn.ctermbg .
        \ " guifg: " . baseSyn.guifg .
        \ " guibg: " . baseSyn.guibg
  let linkedSyn = s:get_syn_attr(s:get_syn_id(1))
  echo "link to"
  echo "name: " . linkedSyn.name .
        \ " ctermfg: " . linkedSyn.ctermfg .
        \ " ctermbg: " . linkedSyn.ctermbg .
        \ " guifg: " . linkedSyn.guifg .
        \ " guibg: " . linkedSyn.guibg
endfunction
command! SyntaxInfo call s:get_syn_info()
