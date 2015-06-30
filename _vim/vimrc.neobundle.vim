NeoBundle 'tomtom/tcomment_vim'

" 賢い「f」キー
NeoBundle 'rhysd/clever-f.vim'
let g:clever_f_ignore_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_show_prompt = 1
" let g:clever_f_chars_match_any_signs = ';' " ; はすべての記号にマッチする

" , y でヤンク履歴
" YankRing.vim
" http://nanasi.jp/articles/vim/yankring_vim.html
" https://github.com/yuroyoro/dotfiles/blob/master/.vimrc.plugins_setting
NeoBundle 'YankRing.vim'
noremap <Leader>y :YRShow<CR>

NeoBundle "osyo-manga/vim-anzu"
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

" 表の整形
NeoBundle 'godlygeek/tabular'
noremap <Leader>t :Tabular /\|/<CR>
noremap <Leader>s :Tabular /^\s*\S\+\zs/l0c1l0<CR>
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
NeoBundle 'kana/vim-gf-user'
NeoBundle 'kana/vim-gf-diff'
nmap gf <Plug>(gf-user-<C-w>gf)
vmap gf <Plug>(gf-user-<C-w>gf)


NeoBundle 'tryu/open-browser.vim'

let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


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

" ctrlp
NeoBundle "ctrlpvim/ctrlp.vim"
let g:ctrlp_map = '<Nop>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
noremap <Leader>p :CtrlPMixed<CR>
