# Hook for desk activation
if command -v desk > /dev/null ; then
    [ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
fi
