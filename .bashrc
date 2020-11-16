alias ls='ls -lhAB --color=auto'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias grep='grep --color=always'
alias python='winpty python'

function start-ssh-agent {
    eval $(ssh-agent)
    ssh-add
}

# Trim directory path in prompt
export PROMPT_DIRTRIM=2

export HOSTS=/c/Windows/System32/drivers/etc/hosts
export TSMR=/c/Windows/tsmr_NZX.ini

