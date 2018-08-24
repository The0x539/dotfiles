# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Colors
     NC=$(tput sgr0)
  BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
  GREEN=$(tput setaf 10)
 YELLOW=$(tput setaf 3)
   BLUE=$(tput setaf 14)
MAGENTA=$(tput setaf 13)
   CYAN=$(tput setaf 6)
  WHITE=$(tput setaf 7)

git_branch_green=$(printf "\x1b[38;2;80;250;123m")
cwd_blue=$(printf "\x1b[38;2;95;215;255m")
cwd_root_red=$(printf "\x1b[38;2;255;84;84m")
operator_purple=$(printf "\x1b[38;2;174;129;255m")

# User specific aliases and functions
alias branch="git branch 2>/dev/null | grep \* | sed 's/* //'"
function pbranch {
	if [ "$(branch)" != "" ]; then
		echo -n " (\[${git_branch_green}\]$(branch)\[${NC}\])"
	fi
}
function ppwd {
	if [ "$USER" == "root" ]; then
		echo -n "\[$cwd_root_red\]"
	else
		echo -n "\[$cwd_blue\]"
	fi
	echo -n "\w\[${NC}\]"
}
function promptend {
	echo -n " "
}
PATH=~/.local/bin:$PATH
tabs 4
USERHOST="\u\[${operator_purple}\]@\[${NC}\]\h"
PROMPT_COMMAND='PS1="${USERHOST} $(ppwd)$(pbranch)$(promptend)"'
