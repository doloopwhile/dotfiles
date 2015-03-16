" Unite.vim
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable =1

" ファイルは tabdrop で開く
call unite#custom#default_action('file' , 'tabopen')
nnoremap <silent> ,y :<C-u>Unite history/yank<CR>
nnoremap <silent> ,t :<C-u>Unite -buffer-name=tab tab<CR>
nnoremap <silent> ,m :<C-u>Unite file_mru<CR>

"nnoremap <silent> ,e call s:unite_file_basename()
"function s:unite_file_basename()
"  :tabnew
"  :cd %:p:h
"  :Unite file -input=%:t:r
"endfunction

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g :<C-u>Unite grep:. -tab -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -tab -buffer-name=search-buffer<CR><C-R><C-W><CR>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume -tab search-buffer<CR>


NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> ,f :<C-u>VimFilerTab -quit<CR>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")

  " 絞り込みにuniteを使う
  nmap <buffer><silent>/ :<C-u>Unite file -default-action=vimfiler<CR>
endfunction

NeoBundle 'tacroe/unite-mark'
NeoBundle "osyo-manga/unite-quickfix"

NeoBundle 'koron/codic-vim'
NeoBundle 'rhysd/unite-codic.vim'
