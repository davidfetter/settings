export PS1="\h:\u:\w "
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

PREFIX=''
PLATFORM=$(uname)
if [[ $PLATFORM == 'Darwin' ]]; then
    PREFIX=$(brew --prefix)
fi

if [ -f $PREFIX/etc/bash_completion ]; then
    . $PREFIX/etc/bash_completion
    if [ -f $PREFIX/etc/bash_completion.d/git-prompt.sh ]; then
        . $PREFIX/etc/bash_completion.d/git-prompt.sh
        export GIT_PS1_SHOWDIRTYSTATE=true
        export PS1='\h:\u:\w $(__git_ps1 "(%s) ")' 
    fi
fi
