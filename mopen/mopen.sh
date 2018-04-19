#!/usr/bin/env bash
set -eu

function usage() {
    echo "Usage: mopen media_file" 1>&2
    exit 1
}

function not_exist_google_chrome() {
    echo "Please install Google Chrome." 1>&2
    exit 1
}

[ $# -lt 1 ] && usage

[ -e /Applications/Google\ Chrome.app/ ] || not_exist_google_chrome

open -a Google\ Chrome "$1"
