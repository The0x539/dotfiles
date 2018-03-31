call plug#begin('~/.config/nvim/plugged')
Plug 'dag/vim-fish' " Fish script syntax highlighting
Plug 'scrooloose/NERDTree' " File system explorer
Plug 'Valloric/YouCompleteMe' " Code completion
call plug#end()

colorscheme dracula_black
highlight NonText ctermfg=0

" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<LF>
map <C-w> :quit<LF>

set mouse=a
map <ScrollWheelUp> <Up>
map <ScrollWheelDown> <Down>

set number

let g:python3_host_prog = '/usr/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

