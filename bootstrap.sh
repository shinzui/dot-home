#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

if [ "$(uname -s)" = 'Darwin' ]; then
  echo "Using OS X"

  [ -z "$(which brew)" ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

export ELLIPSIS_USER="shinzui"
curl -sL ellipsis.sh | sh

"$HOME/.ellipsis/bin/ellipsis" install home zsh vim tmux
