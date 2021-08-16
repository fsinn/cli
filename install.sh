#!/usr/bin/env bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

function setup_colors() {
    if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
        NOFORMAT='\033[0m' RED='\033[0;31m'
    else
        NOFORMAT='' RED=''
    fi
}

function log_error() {
    echo -e "${RED}${1}${NOFORMAT}"
}

if ! command -v brew &> /dev/null
then
    cat << EOF
brew not found. Install it using

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
EOF
fi

if [ "$#" -ne 1 ]
then
    log_error "No username passed, aborting!"
    exit 1
fi

username="${1}"

"${script_dir}"/fonts/fonts.sh
"${script_dir}"/term/iterm/iterm.sh "${username}"
"${script_dir}"/term/fish/fish.sh
