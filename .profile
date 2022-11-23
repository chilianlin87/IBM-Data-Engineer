# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Set the tab stops
if [ -f ~/.bash_tab_stops ]; then
    . ~/.bash_tab_stops
fi



alias unixfolder="cd /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/Coursera/UnixWorkbench"
alias exer="cd /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/Coursera/ETL-Data-Pipelines"
alias edbp="nano ~/.profile"
alias nanorcedit="sudo nano /etc/nanorc"
alias bashsearch="egrep -rnw /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bashCS/ -e "
alias bashedit="nano /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bashCS/bashcheetsheet.sh"
alias homelocation="echo C:/\Users/\h204095/\AppData/\Local/\Packages/\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc/\LocalState/\rootfs/\home/\chili"
alias bigdata="egrep -rnw /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bigdataCS/ -e "
alias bigdataedit="nano /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bigdataCS/cheatsheet.sh"
alias airflowedit="nano /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bigdatacs/airflowcheatsheet.sh"
alias kafkaedit="nano /mnt/c/Users/h204095/Desktop/IBM-Data-Engineering/bigdatacs/kafkacheatsheet.sh"
alias pysearch="egrep -rn /mnt/c/Intelligrated/Python/Cheatsheet/ -e "
alias pyedit="nano /mnt/c/Intelligrated/Python/Cheatsheet/PythonCheatsheet.py"
#export PATH="/mnt/c/Users/h204095/Desktop/IBM Data Engineering/Coursera/UnixWorkbench/ExecutableCode":$PATH
export JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64



