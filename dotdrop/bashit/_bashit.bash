fetch_bashit(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone --depth=1 \
      "https://github.com/Bash-it/bash-it.git" \
      "${dest}"
  fi
}
