dotsync_fetch(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone --depth=1 \
        'https://github.com/dotphiles/dotsync.git' \
        "${dest}"
  fi
}
