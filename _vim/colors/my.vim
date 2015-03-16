" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:
" Last Change:

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "my"

highlight Comment     ctermfg=8                   guifg=#FFFFFF
highlight Constant    ctermfg=14 cterm=none       guifg=#FFFFFF   gui=none
highlight Identifier  ctermfg=6                   guifg=#00AAAA
highlight Statement   ctermfg=3  cterm=bold       guifg=#FFFF55   gui=bold
highlight PreProc     ctermfg=10                  guifg=#33AA33
highlight Type        ctermfg=2                   guifg=#33AA33 gui=none
" highlight Special     ctermfg=12                       guifg=#5555FF
highlight Special     ctermfg=12                       guifg=#FFFFFF
highlight Error       ctermbg=9                        guibg=#FF5555
highlight Todo        ctermfg=4  ctermbg=3             guifg=#000080 guibg=#FFFF55
" highlight Directory   ctermfg=2                        guifg=#55FF55
highlight StatusLine  ctermfg=11 ctermbg=12 cterm=none guifg=#ffff00 guibg=#0000ff gui=none
highlight Normal                                       guifg=#ffffff guibg=#000000
highlight Search      ctermbg=3 guibg=#FFFF55
