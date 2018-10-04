fetch_dotdrop(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone \
      "https://github.com/deadc0de6/dotdrop.git" \
      "${dest}"
  fi
}

bootstrap_dotdrop(){
  local src="${1?}"
  pip3 install -r "${src}/requirements.txt"
}

install_dotdrop(){
  local src="${1?}"
  (
    cd "${src}"
    python3.4 "${src}/setup.py" install
  )
}
