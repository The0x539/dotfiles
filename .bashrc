# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Colors
     NC='\033[00m'
  BLACK='\033[0;30m'
    RED='\033[0;31m'
  GREEN='\033[0;32m'
  BROWN='\033[0;33m'
   BLUE='\033[0;34m'
 PURPLE='\033[0;35m'
   CYAN='\033[0;36m'
  LGRAY='\033[0;37m'
  DGRAY='\033[1;30m'
   LRED='\033[1;31m'
 LGREEN='\033[1;32m'
 YELLOW='\033[1;33m'
  LBLUE='\033[1;34m'
LPURPLE='\033[1;35m'
  LCYAN='\033[1;36m'
  WHITE='\033[1;37m'

# User specific aliases and functions
alias branch="git branch 2>/dev/null | grep \* | sed 's/* //'"
function pbranch {
	if [ "$(branch)" != "" ]; then
		echo -n " (${BROWN}$(branch)${NC})"
	fi
}
function ppwd {
	if [ "$USER" == "root" ]; then
		echo -n $RED
	else
		echo -n $GREEN
	fi
	echo -n "\w${NC}"
}
function promptend {
	if [ "$USER" == "root" ]; then
		echo -n "# "
	else
		echo -n "> "
	fi
}
PATH=~/.local/bin:$PATH
tabs 4
USERHOST="\u${CYAN}@${NC}\h"
PROMPT_COMMAND='PS1="${USERHOST} $(ppwd)$(pbranch)$(promptend)"'
