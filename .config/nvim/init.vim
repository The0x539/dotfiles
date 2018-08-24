call plug#begin('~/.config/nvim/plugged')
	Plug 'dag/vim-fish'                   " Fish script syntax highlighting
	Plug 'scrooloose/NERDTree'            " File system explorer
	Plug 'dracula/vim', {'as': 'dracula'} " Dracula color scheme
	Plug 'pangloss/vim-javascript'        " Improved JS syntax highlighting
call plug#end()

" set termguicolors
colorscheme dracula
highlight Normal ctermbg=NONE
highlight LineNr ctermbg=NONE ctermfg=NONE guifg=fg guibg=bg
highlight NonText ctermbg=NONE ctermfg=0 guibg=bg guifg=bg


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

command WQ wq
command Wq wq
command W w
command Q q
nnoremap ; :
