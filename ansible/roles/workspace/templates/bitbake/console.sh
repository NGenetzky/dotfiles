bitbake_set_path(){
  local p="$(readlink -f ${1?})"
  [[ -d ${p} ]] || return 1

  local pbin="${p}/bin"
  if [[ ":$PATH:" != *":${pbin}:"* ]]; then
    export PATH="${pbin}:${PATH}"
  fi

  local plib="${p}/lib"
  if [[ ":$PYTHONPATH:" != *":${plib}:"* ]]; then
    export PYTHONPATH="${plib}:$PYTHONPATH"
  fi
}
bitbake_build(){
  local p="$(readlink -f ${1?})"
  export BBPATH="${p}"
  cd "${p}"
}

bitbake_set_path "{{ workspace_localenv }}/share/bitbake/"
bitbake_build "{{ workspace_topdir }}"

unset bitbake_set_path
unset bitbake_build
