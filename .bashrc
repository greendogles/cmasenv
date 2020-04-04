

[ -z "$PS1" ] && return

#---------------------------
# EXPORTS
#---------------------------
export MY_FS="$HOME/cmasenv"
export VIMRC="$HOME/.vimrc" 
export WORKSPACE="$HOME/workspace"
export PAFY_BACKEND="internal"

#--------------------------
# COMMAND PROMPT
#---------------------------
black="30"
lightGrey="37"
darkGrey="1;30"
blue="34"
lightBlue="1;34"
green="32"
lightGreen="1;32"
cyan="36"
red="31"
lightRed="1;31"
purple="35"
lightPurple="1;35"
brown="33"
white="39"
yellow="93"
lightYellow="1;93"
italic="3"
ps1_user="\[\e[${white}m\]\u\[\e[m\]"
ps1_date="\[\e[${brown}m\]\d \t\[\e[m\]"
ps1_host="\[\e[${purple}m\]\H\[\e[m\]"
ps1_pwd="\[\e[${cyan}m\]\w\[\e[m\]"
ps1_dollar="\[\e[${green}m\]\$\[\e[m\]"
ps1_input="\[\e[${italic}m\]"; trap 'echo -ne ' DEBUG
SEP_COLOUR=${lightGreen}
HOST_COLOUR=${green}
ps1_host="\[\e[${HOST_COLOUR}m\]\H\[\e[m\]"
SEP="\[\e[${SEP_COLOUR}m\]<>\[\e[m\]"
SEP_1="\[\e[${SEP_COLOUR}m\]<$?>\[\e[m\]"

prompt_branch() {
  git status 2> /dev/null | grep "On branch " | sed -E "s/On branch (.*)/\1/g"
}

export PS1="${SEP}${ps1_date}${SEP}${ps1_host}${SEP}\n${SEP}\[\e[${yellow}m\]\$(prompt_branch)${SEP}${ps1_pwd}${SEP}${ps1_bad}\n${ps1_dollar} ${ps1_input}"

export PS2="\[\e[${green}m\]>\[\e[m\]"


#---------------------------
#ALIASES
#---------------------------
alias bashrc="vim ~/.bashrc"
alias vimrc="vim $VIMRC"
alias workspace="cd $WORKSPACE && ls"
alias todo="vim ~/cmasenv/docs/todo.txt"

alias updateplugins="$MY_FS/scripts/updatePlugins.sh"
alias plan="$MY_FS/scripts/plan.sh"
alias my="$MY_FS/scripts/fss.sh $MY_FS"
alias fss="$MY_FS/scripts/fss.sh"
alias mksc="$MY_FS/base/scripts/mksc.sh"

alias ide="open -a 'IntelliJ IDEA CE'"
alias weather="open -a Safari https://www.bbc.co.uk/weather/0/2650225 &"
alias news="open -a Safari https://news.ycombinator.com/news; echo 'Make a proper script for this, -h for hacker, -r for rugby etc.'" 
alias music="open -a spotify"
alias sky='open -a "sky go"'
alias chrome="open -a 'google chrome'"
# alias sudo : 'If the last char of the alias value is blank, then the next command word following the alias is also checked for alias expansion.' HENCE, the space after sudo. This is so that when using > $sudo vi  the vi alias to vim works when using sudo, allowing syntax colours.alias sudo="sudo "
alias sudo="sudo "

#---------------------------
# FUNCTIONS
#---------------------------
google() {
  var=$(echo ${1} | sed 's/ /+/g')
  open -a Safari http://www.google.co.uk/search?q=${var} &
}

rugby() {
  open -a Safari http://www.bbc.co.uk/sport/rugby-union/ &
  open -a Safari http://www.planetrugby.com &
  open -a Safari http://www.skysports.com/rugby-union &
}

cheat() {
  curl cheat.sh/$1
}
