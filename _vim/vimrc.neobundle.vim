NeoBundle 'tomtom/tcomment_vim'
"
" 賢い「f」キー
NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_ignore_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_show_prompt = 1
let g:clever_f_chars_match_any_signs = ';' " ; はすべての記号にマッチする

" , y でヤンク履歴
" YankRing.vim
" http://nanasi.jp/articles/vim/yankring_vim.html
" https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.plugins_setting
" NeoBundle 'YankRing.vim'
" noremap <Leader>y :YRShow<CR>

NeoBundle 'LeafCage/yankround.vim'
let g:yankround_max_history = 100
nnoremap <silent><Leader>y :<C-u>CtrlPYankRound<CR>
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

NeoBundle "osyo-manga/vim-anzu"
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" 表の整形
NeoBundle 'godlygeek/tabular'
noremap ,t :Tabular /\|/<CR>
noremap ,s :Tabular /\s*\S\+\zs/l0c1<CR>
noremap ,f :Tabular /,\zs/l1r0<CR>
" NeoBundle 'thinca/vim-quickrun'
" let g:quickrun_config = {
" \   "_" : {
" \       "outputter/buffer/split" : "botright 7sp",
" \       "outputter/buffer/close_on_empty" : 1
" \   },
" \   "pyrex" :{
" \       "type" : "cython"
" \   },
" \   "cython" : {
" \       "command"   : "cython",
" \   }
" \}
" let g:quickrun_config['markdown'] = {
" \   'outputter': 'browser',
" \   'command': 'markdown'
" \ }

" NeoBundle 'jimsei/winresizer'


" カーソル下にファイル名らしき文字列はないが Git の diff の出力らしきテキストがある場合、
" diff で示されるファイルを開いて該当する変更箇所までカーソルを移動します。
let g:gf_user_no_default_key_mappings=1
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
nmap gf <Plug>(gf-user-<C-w>gf)
vmap gf <Plug>(gf-user-<C-w>gf)


" カーソル下のURLを開く
NeoBundle 'open-browser.vim'
let g:netrw_nogx = 1
nmap gb <Plug>(openbrowser-smart-search)
vmap gb <Plug>(openbrowser-smart-search)


" Realtime preview by Vim. (Markdown, textile)
NeoBundle 'kannokanno/previm'

" NeoBundle 'junegunn/vim-easy-align'

" Move cursor as word in CamelCase
NeoBundle 'vim-scripts/camelcasemotion'

" CamlCase <=> snake_case
NeoBundle 'tpope/vim-abolish'

" Fla**ybird
NeoBundle 'mattn/flappyvird-vim'

" tags
NeoBundle 'szw/vim-tags'

" gist
NeoBundle 'mattn/gist-vim'

" Recent used files
NeoBundle 'mru.vim'


" Text object
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-function'

" Expand region
NeoBundle "terryma/vim-expand-region"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" incsearch
NeoBundle 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

NeoBundle 'thinca/vim-fontzoom'
let g:fontzoom_no_default_key_mappings=1
nmap ,= <Plug>(fontzoom-larger)
nmap ,- <Plug>(fontzoom-smaller)
nmap ,0 :<C-u>Fontzoom!<CR>

" True <=> False
NeoBundle 'AndrewRadev/switch.vim'
nnoremap <C-b> :Switch<CR>
let g:switch_custom_definitions =
    \ [
    \   ['pick', 'fixup', 'reword', 'edit', 'squash']
    \ ]

NeoBundle 'tpope/vim-fugitive'

" NeoBundle 'kana/vim-smartinput'
NeoBundle 'copypath.vim'
nnoremap <C-c>p <ESC>:<C-u>CopyPath<CR>
nnoremap <C-c>f <ESC>:<C-u>CopyFileName<CR>


" NeoBundle 'kana/vim-textobj-user'
" NeoBundle 'tkhren/vim-textobj-numeral'
" NeoBundle 'kana/vim-submode'
"
" set nrformats-=octal
" function! Increment(step)
"     let inc_key = a:step > 0 ? '^A' : '^X'
"     let @z = '"zyadjvad"zp'. abs(a:step) . inc_key
"     return '@z'
" endfunction
"
" nmap <expr> + Increment(1)
" nmap <expr> - Increment(-1)

"" 補足1) `^A`と`^X`は、`<C-v><C-a>`それぞれ`<C-v><C-x>`で入力できる特殊文字
"" 補足2) `ad` は '[-+]?\d+' にマッチするテキストオブジェクト 

" 連番
NeoBundle 'deris/vim-rengbang'
