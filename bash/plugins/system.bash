
export PATH="${HOME}/.local/bin/:${PATH}"

set_editor(){
    local editor="$(command -v nvim)"
    if  ! command -v "${editor}" > /dev/null ; then
        local editor="$(command -v nvim.appimage)"
    fi
    if  ! command -v "${editor}" > /dev/null ; then
        local editor="$(command -v vim)"
    fi
    export EDITOR="${editor}"
}
set_editor
unset set_editor
export VISUAL="${EDITOR}"
alias v="${EDITOR}"


export TERM='xterm-256color'

