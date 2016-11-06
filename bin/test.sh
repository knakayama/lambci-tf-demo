#!/usr/bin/env bash

if [[ "$LAMBCI_BRANCH" =~ (release/)?dev/? ]]; then
  make remote-enable ENV="dev"
  make terraform ENV="dev" ARGS="get -update"
  make terraform ENV="dev" ARGS="plan"
elif [[ "$LAMBCI_BRANCH" =~ (release/)?stg/? ]]; then
  make remote-enable ENV="stg"
  make terraform ENV="stg" ARGS="get -update"
  make terraform ENV="stg" ARGS="plan"
elif [[ "$LAMBCI_BRANCH" =~ (release/)?prd/?|^master$ ]]; then
  make remote-enable ENV="prd"
  make terraform ENV="prd" ARGS="get -update"
  make terraform ENV="prd" ARGS="plan"
fi
