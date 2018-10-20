fetch_ansible(){
  local dest="${1?}"
  if [ ! -d "${dest}" ]; then
    git clone \
      "https://github.com/ansible/ansible.git" \
      "${dest}"
  fi
}

bootstrap_ansible(){
  local src="${1?}"
  pip3 install -r "${src}/requirements.txt"
}

install_ansible(){
  local src="${1?}"
  (
    cd "${src}"
    python3 "${src}/setup.py" install
  )
}
