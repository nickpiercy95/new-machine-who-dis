alias ls='ls -lhAB --color=auto'
alias mv='mv -v'
alias cp='cp -v'
alias grep='grep --color=always'
alias python='winpty python'

function start-ssh-agent {
    eval $(ssh-agent)
    ssh-add
}

# Trim directory path in prompt
export PROMPT_DIRTRIM=2
