#!/usr/bin/env bash

if [[ "$LAMBCI_BRANCH" =~ ^release/(dev|stg|prd)$ ]]; then
  _env="$(echo "$LAMBCI_BRANCH" | grep -oE '(dev|stg|prd)$')"
  make terraform ENV="$_env" ARGS="get -update"
  make terraform ENV="$_env" ARGS="apply"
  make terraform ENV="$_env" ARGS="remote push"
fi
