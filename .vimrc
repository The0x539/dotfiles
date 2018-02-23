"Slightly modified Dracula color scheme
colorscheme dracula
highlight! def link NonText Ignore
highlight SpecialKey ctermbg=NONE ctermfg=DarkGray
set term=screen-256color

"Tabs have a width of 4, and are actual tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"Show commands
set showcmd

"Put cursor at start of tabs in normal mode (huge hack)
set list listchars=tab:\ \ 

"The internet told me to turn off modelines
set modelines=0
set nomodeline

"Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"Display line numbers on the left
set number

"Mouse support
if has('mouse')
	set mouse=a
endif

"Display trailing whitespace
highlight ExtraSpace ctermbg=234
syntax match ExtraSpace /\s\+$/ containedin=ALL
autocmd Syntax * syntax match ExtraSpace /\s\+$/ containedin=ALL

"Display leading spaces
highlight LeadingSpace ctermbg=234
syntax match LeadingSpace /^ \+/ containedin=ALL
autocmd Syntax * syntax match LeadingSpace /^ \+/ containedin=ALL
