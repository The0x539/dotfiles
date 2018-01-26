"Slightly modified Dracula color scheme
colorscheme dracula
highlight NonText ctermfg=0
set term=screen-256color

"Tabs have a width of 4, and are actual tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

"Show commands
set showcmd

"Put cursor at start of tabs in normal mode (bit of a hack)
set list listchars=tab:\ \ 
highlight OnlyTabs ctermbg=0
match OnlyTabs /\t/
