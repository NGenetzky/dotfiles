# vim: set ft=sh foldmarker={,} foldlevel=1 foldmethod=marker :

function git_branch_ahead_behind {
    # I don't think it supports remotes with different branch names.
    # TODO: Investigate
    curr_branch=$(git rev-parse --abbrev-ref HEAD);
    curr_remote=$(git config branch.$curr_branch.remote);
    curr_merge_branch=$(git config branch.$curr_branch.merge | cut -d / -f 3);
    git rev-list --left-right --count $curr_branch...$curr_remote/$curr_merge_branch | tr -s '\t' '|';
}

function prompt_command {
    local NOCOLOR="\[\033[0m\]"
    local BLACK="\[\033[0;30m\]"
    local BLUE="\[\033[0;34m\]"
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local RED="\[\033[0;31m\]"
    local PURPLE="\[\033[0;35m\]"
    local BROWN="\[\033[0;33m\]"
    local LTGREY="\[\033[0;37m\]"
    local DKGREY="\[\033[1;30m\]"
    local LTBLUE="\[\033[1;34m\]"
    local LTGREEN="\[\033[1;32m\]"
    local LTCYAN="\[\033[1;36m\]"
    local LTRED="\[\033[1;31m\]"
    local LTPURPLE="\[\033[1;35m\]"
    local YELLOW="\[\033[1;33m\]"
    local WHITE="\[\033[1;37m\]"
    
    local BXTLC=`echo -e "\xE2\x94\x8c"`
    local BXTRC=`echo -e "\xE2\x94\x90"`
    local BXBLC=`echo -e "\xE2\x94\x94"`
    local BXBRC=`echo -e "\xE2\x94\x98"`
    local BXHL=`echo -e "\xE2\x94\x80"`
    
    local FC=$PURPLE
    local BC=$PURPLE
    
    TERMWIDTH=${COLUMNS}
    hostnam=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")
    usernam=$(whoami)
    newPWD="${PWD}"
        #memuse=$(free -m | grep ^Mem: | sed "s/ * /\t/g" | cut -f 3 | sed "s/\t/\//g")
        #swpuse=$(free -m | grep ^Swap: | sed "s/ * /\t/g" | cut -f 3 | sed "s/\t/\//g")
    
    gitbranch=$(git branch 2>/dev/null | grep ^\* | sed 's/^..//')
    gitstatusline="${gitbranch}"
    
    #   Add all the accessories below ...
    let p1size=$(echo -n "+--(${usernam}@${hostnam})--(${newPWD})--(${gitstatusline})--($(date '+%d %b %H:%M:%S'))-" | wc -c | tr -d " ")
    let f1size=${TERMWIDTH}-${p1size}
    
    f1=""
    while [ "$f1size" -gt "0" ]
    do
        f1="${f1}$BXHL"
        let f1size=${f1size}-1
    done
    
    if [ "$f1size" -lt "0" ]
    then
        let cut=3-${f1size}
        newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cut\}\)\(.*\)/\2/")"
    fi
    
    case $TERM in
        xterm*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
            ;;
        *)
            TITLEBAR=""
            ;;
    esac
    
PS2="$RED$BXHL>$NOCOLOR "

PS1="$TITLEBAR\
$BC$BXTLC$BXHL\
$FC$BXHL{$CYAN\$usernam$BLUE@$LTPURPLE\$hostnam$FC}$BXHL\
$FC$BXHL{$BROWN\${newPWD}$FC}$BXHL\
$BC\${f1}$BXHL\
$FC{$LTRED\${gitstatusline}$FC}\
$BC$BXHL$FC\
$BXHL{$RED$(date '+%d %b %H:%M:%S')$FC}$BXHL\
\n\
$BC$BXBLC\
$BC$PS2"
}

PROMPT_COMMAND=prompt_command
