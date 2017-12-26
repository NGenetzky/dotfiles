
if [ ! -f ~/.dircolors ]; then
    wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
fi

eval $(dircolors -b $HOME/.dircolors)
