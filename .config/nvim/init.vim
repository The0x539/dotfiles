if &compatible
	set nocompatible
end

source ~/.config/nvim/plugins.vim

"If a popup menu is visible, rebind tab to navigate through it
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect
"set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring']
let g:completion_enable_auto_paren = 1

filetype plugin indent on
syntax enable
set termguicolors
colorscheme dracula
highlight Normal guibg=NONE

" We don't actually need these for anything, do we?
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_node_provider = 0

let g:vim_json_warnings = 0
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'wl-copy'
let g:vimsyn_embed = 'lP'

set tabstop=4 shiftwidth=4
set mouse=a
nnoremap ; :

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufLeave,FocusLost,InsertEnter,TermEnter   * set norelativenumber
	autocmd BufEnter,FocusGained,InsertLeave,TermLeave * if &filetype !=# 'help' | set relativenumber | end
	autocmd TermLeave * set number
	autocmd TermEnter * set nonumber
augroup END

augroup signcoltoggle
	autocmd!
	autocmd FileType * let &signcolumn = luaeval('#vim.lsp.buf_get_clients()') > 0 ? 'yes' : 'no'
augroup END

augroup term
	autocmd TermOpen  * startinsert
	"mostly copied from some comment on reddit
	autocmd TermClose term://*
		\ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") |
		\ 	call nvim_input('<CR>') |
		\ end
augroup END

command Reload source ~/.config/nvim/init.vim
