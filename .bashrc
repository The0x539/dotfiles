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

# User specific aliases and functions
alias branch="git branch 2>/dev/null | grep \* | sed 's/* //'"
function pbranch {
	if [ "$(branch)" != "" ]; then
		echo -n " (\[${GREEN}\]$(branch)\[${NC}\])"
	fi
}
function ppwd {
	if [ "$USER" == "root" ]; then
		echo -n "\[$RED\]"
	else
		echo -n "\[$BLUE\]"
	fi
	echo -n "\w\[${NC}\]"
}
function promptend {
	echo -n " "
}
PATH=~/.local/bin:$PATH
tabs 4
USERHOST="\u\[${MAGENTA}\]@\[${NC}\]\h"
PROMPT_COMMAND='PS1="${USERHOST} $(ppwd)$(pbranch)$(promptend)"'
