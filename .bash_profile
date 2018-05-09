alias vi=vim
shopt -s extglob

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

refresh_agent () {
    pgrep ssh-agent > /dev/null 2>&1
    if [ $? != 0 ]; then
        ssh-agent > ~/.ssh_agent.sh
    fi
    ssh-add -l >/dev/null 2>&1
    if [ $? != 0 ]; then
        if ls ~/.ssh/id_!(*pub) >/dev/null 2>&1; then
            . ~/.ssh_agent.sh &&
            ssh-add $(ls ~/.ssh/id_!(*pub))
        fi
    fi
}

PREFIX=''
PLATFORM=$(uname)
if [[ $PLATFORM == 'Darwin' ]]; then
    PREFIX=$(brew --prefix)
fi

prompt_command() {
    refresh_agent
    if [ -f $PREFIX/etc/bash_completion ]; then
        . $PREFIX/etc/bash_completion
        GIT_PROMPT=$(ls ${PREFIX}/etc/bash_completion.d/git-prompt*)
        if [ -f "$GIT_PROMPT" ]; then
            . $GIT_PROMPT
            export GIT_PS1_SHOWDIRTYSTATE=true
            BRANCH="\$(__git_ps1 '(%s) ')" 
        fi
    fi
    export PS1="\h:\u:\w ${BRANCH}"
}

PROMPT_COMMAND=prompt_command

export LESS='-iRX -x 4'
export PAGER=less
