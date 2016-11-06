#!/usr/bin/env bash

TF_VER="0.7.9"
BIN_PATH="${HOME}/.local/bin"

[[ ! -d "$BIN_PATH" ]] && mkdir -p "$BIN_PATH"

curl "https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip" \
  -o "${HOME}/terraform.zip"
unzip "${HOME}/terraform.zip" -d "$BIN_PATH"
