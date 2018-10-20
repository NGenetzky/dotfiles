dotsync_fetch(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone --depth=1 \
        'https://github.com/dotphiles/dotsync.git' \
        "${dest}"
  fi
}

add_this_host(){
    local conf="${1?}"
    sed -i "/endhosts/i$(hostname) git=ANY" \
        "${conf}"
}

get_hosts(){
    local conf="${1?}"
    sed -n '/\[hosts\]/,/\[endhosts\]/p' $CONFIG \
        | grep -v '^\[.*hosts' \
        | grep -v '^#' \
        | awk '{print $1}' \
        | egrep "$chk"
}
