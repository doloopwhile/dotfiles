" ctrlp
NeoBundle "ctrlpvim/ctrlp.vim"
" NeoBundle 'DavidEGx/ctrlp-smarttabs'
let g:ctrlp_map = ''
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_extensions = ['smarttabs']

nnoremap <Leader>p :CtrlPMixed<CR>
nnoremap <Leader>t :CtrlPSmartTabs<CR>
nnoremap <Leader>m :CtrlPMRU<CR>
nnoremap <Leader>l :CtrlPLine<CR>

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
