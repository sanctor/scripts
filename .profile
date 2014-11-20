export PATH=`pwd`/depot_tools:"$PATH"

# Setting PATH for Python 3.2
# The orginal version is saved in .profile.pysave
PATH="/usr/local/bin:/opt/local/bin:/Users/golubenkos/android-sdk/tools:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH=/opt/subversion/bin:/usr/local/Cellar/git/1.8.3.3/bin:$PATH
export PATH=/Users/golubenkos/Qt5.1.0/5.1.0/clang_64/bin:$PATH
export PATH=/Users/golubenkos/.gem/ruby/2.0.0/bin:$PATH

export JAVA_HOME=$(/usr/libexec/java_home)

export http_proxy=proxy.liga.net:3128
export https_proxy=proxy.liga.net:3128
#export socksProxyPort=3128
#export socksProxyHost=proxy.liga.net

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

alias jenkins="nohup java -jar ~/jenkins.war --httpPort=8081 --ajp13Port=8010 > /tmp/jenkins.log 2>&1 &"