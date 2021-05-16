#!/usr/bin/env bash
set -eu

# mopen
# updated at 2021/05/16 (Sun)
# walkingmask
# open media file using Google Chrome

function usage() {
  echo "Usage: mopen media_file" 1>&2
  exit 1
}

function not_exist_google_chrome() {
  echo "Google Chrome required" 1>&2
  exit 1
}

[ $# -lt 1 ] && usage

[ -e /Applications/Google\ Chrome.app/ ] || not_exist_google_chrome

open -a Google\ Chrome "$1"
