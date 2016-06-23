" ctrlp
NeoBundle "ctrlpvim/ctrlp.vim"
" NeoBundle 'mattn/ctrlp-mark'

" NeoBundle 'DavidEGx/ctrlp-smarttabs'
nnoremap <Leader>p :CtrlPMixed<CR>
nnoremap ` :CtrlPMixed<CR>
nnoremap <Leader>z :CtrlPClearCache<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>l :execute ':CtrlPLine ' . buffer_name('%')<CR>

" nnoremap <Leader>d :CtrlPDir<CR>
" nnoremap <Leader>m :CtrlPMark<CR>

let g:ctrlp_map = ''
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_extensions = ['mark']

let g:ctrlp_prompt_mappings = {
\ 'PrtBS()':              ['<bs>', '<c-]>'],
\ 'PrtDelete()':          ['<del>'],
\ 'PrtDeleteWord()':      ['<c-w>'],
\ 'PrtClear()':           ['<c-u>'],
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'AcceptSelection("e")': ['<2-LeftMouse>'],
\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
\ 'AcceptSelection("t")': ['<cr>'],
\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
\ 'ToggleFocus()':        ['<s-tab>'],
\ 'ToggleRegex()':        ['<c-r>'],
\ 'ToggleByFname()':      ['<c-d>'],
\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
\ 'PrtExpandDir()':       ['<tab>'],
\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
\ 'PrtInsert()':          ['<c-\>'],
\ 'PrtCurStart()':        ['<c-a>'],
\ 'PrtCurEnd()':          ['<c-e>'],
\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
\ 'PrtCurRight()':        ['<c-l>', '<right>'],
\ 'PrtClearCache()':      ['<F5>'],
\ 'PrtDeleteEnt()':       ['<F7>'],
\ 'CreateNewFile()':      ['<c-y>'],
\ 'MarkToOpen()':         ['<c-z>'],
\ 'OpenMulti()':          ['<c-o>'],
\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
\ }

NeoBundle 'mattn/ctrlp-veco'

" function s:grep_in_git_project(pattern)
"   execute '!git grep "' . a:pattern . '" "$(git rev-parse --show-toplevel)"'
" end
"
" command! -nargs=1 GrepInGitProject call <SID>grep_in_git_project(<f-args>)


let g:ctrlsf_default_root='project'
let g:ctrlsf_mapping = {
\ 'tab': 't',
\}

NeoBundle 'dyng/ctrlsf.vim'
vmap        <Leader>g <Plug>CtrlSFVwordPath
nmap <expr> <Leader>g ':CtrlSF ' . expand('<cword>')
