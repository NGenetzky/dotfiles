#!/bin/bash

readonly DL_DIR="${HOME}/Downloads/"

wget_download(){
    local url="${1?}"
    local name="${2?}"

    local path="${DL_DIR}/${name}"
    wget -O "${path}" "${url}"
}