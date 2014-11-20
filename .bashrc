alias ls="ls -G"
export CLICOLOR=1  
export LSCOLORS=Gxfxcxdxbxegedabagacad
export PS1='\[\e[01;37m\]\t `if [ $? = 0 ]; then echo "\[\e[32m\]✔"; else echo "\[\e[31m\]✘"; fi` \[\e[00;37m\]\u\[\e[01;37m\]:`[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "\[\e[31m\]" || echo "\[\e[32m\]"`$(__git_ps1 "(%s)\[\e[00m\]")\[\e[01;36m\]\w\[\e[00m\]\$ '
