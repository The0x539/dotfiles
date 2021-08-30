colorscheme dracula-transparent

set-face global Whitespace "%opt{blue}"

set-face global LineNumbers "%opt{blue}"
set-face global LineNumberCursor "%opt{yellow}+b"
set-face global LineNumbersWrapped "%opt{gray}"

set-face global PrimaryCursor "+r"
set-face global PrimaryCursorEol "default,%opt{orange}"
set-face global SecondaryCursor "default,rgb:4d5b86"
set-face global PrimarySelection "default,%opt{gray}"
set-face global SecondarySelection "default,%opt{gray}"

set-face global MenuBackground "%opt{white},%opt{gray}"
set-face global MenuForeground "%opt{white},%opt{blue}+b"

set-face global function "%opt{green}"
set-face global parameter "%opt{orange}+i"
set-face global variable "default"
set-face global selfKeyword "%opt{purple}+i"
set-face global module "default"
set-face global type "%opt{cyan}"
set-face global keyword "%opt{pink}"
set-face global meta "%opt{green}+i"
set-face global macro "%opt{purple}"
set-face global operator "%opt{white}"

set-face global InlayHint "%opt{blue}"

add-highlighter global/mch show-matching
set-face global MatchingChar "+u"
