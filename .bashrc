export HISTSIZE=1000000
export HISTFILESIZE=1000000
export HISTCONTROL=ignoreboth

if [ -x brew ]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH

    # Comment this section out if you want the OSX defaults for ls, etc.
    if [ -d $(brew --prefix coreutils)/libexec/gnubin ]; then
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
        export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
        alias ls="ls --color=auto"
    fi
fi

alias vi=vim

shopt -s histappend
# Google Cloud
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc' ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
fi
