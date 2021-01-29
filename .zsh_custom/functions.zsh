#!/bin/zsh

dots() { 
    git --git-dir=$HOME/.dotfiles --work-tree=$HOME $@
}
compdef dots=git

dev() { cd ~/develop/$1 ;}
_dev()  {
    _files -/ -W ~/develop
}
compdef _dev dev

gh() { cd ~/github/$1 ;}
_gh()  {
    _files -/ -W ~/github
}
compdef _gh gh

gl() { cd ~/gitlab/$1 ;}
_gl()  {
    _files -/ -W ~/gitlab
}
compdef _gl gl

gitauth() { git config user.name "Max Thyron" ; git config user.email mkthyron@gmail.com ;}
bgitauth() { git config user.name "Karsakov Maxim" ; git config user.email mkthyron@gmail.com ;}

jdk() {
    version=$1
    export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
    java -version
 }

buu() {
    { echo "----------- UPDATE -----------" && brew update -v && echo "----------- UPGRADE -----------" && brew upgrade;} | tee /usr/local/var/log/brew_uu_$(date +"%Y_%m_%d_%I_%M_%p").log;
    find /usr/local/var/log/brew_uu_* -Btime +10 -exec rm -f {} \;
}
