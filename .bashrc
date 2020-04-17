##############################################
# USER-DEFINED ALIASES
##############################################
alias live-nvidia-smi='watch -n 0.5 -d nvidia-smi'
alias ls='ls --color=always'
alias watchme='watch -n 0,5 -d'

##############################################
# CUSTOM FUNCTIONS FOR PROMPT PERSONALIZATION
##############################################
#conda config --set changeps1 true|false

conda_env ()
{
    if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
        printf "($CONDA_DEFAULT_ENV)"
    fi
}

# ENABLE THIS IF YOU WANT A STAR IN THE BRANCH NAME WHEN DIRTY
export GIT_PS1_SHOWDIRTYSTATE=1
colorized_git_branch()
{
    if [ ! -z "$(__git_ps1)" ]; then
        if [ -z "$(git status --porcelain)" ]; then
#        if [[ ! "$(__git_ps1)" =~ "*" ]]; then
            # CLEAN STATUS
            printf "\033[32m$(__git_ps1)"
        else
            # DIRTY STATUS
            printf "\033[31m$(__git_ps1)"
        fi
    fi
}
##############################################
# PROMPT CUSTOMIZATION
##############################################
# SHOUDL BE USED WITH: conda config --set changeps1 true
#export PS1="$(conda_env) [\u@\h \W]\$(__git_ps1)\$ "
# BELOW WITH COLOR
export PS1="\[\033[35m\]$(conda_env) \[\033[00m\][\u\[\033[34m\]@\[\033[00m\]\h \[\033[33m\]\W]\$(colorized_git_branch) \033[00m\$ "