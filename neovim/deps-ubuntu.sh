#!/usr/bin/env bash

set -euo pipefail

command -v pyenv || { echo "pyenv is not installed"; exit 1;  }
pyenv virtualenv  --version || { echo "pyenv virtualenv is not available"; exit 1; }

if ! pyenv versions | grep "2\.7\.18"; then
    pyenv install 2.7.18
fi

if ! pyenv versions | grep "neovim2"; then
    pyenv virtualenv 2.7.18 neovim2
    "$HOME/.pyenv/versions/neovim2/bin/python" -m pip install pynvim
fi

if ! pyenv versions | grep -E '3\.[[:digit:]]*\.[[:digit:]]*'; then
    pyenv install "$(pyenv install -l | tr -d ' ' | grep -E '^3\.[[:digit:]]*\.[[:digit:]]*$' | tail -n1)"
fi

if ! pyenv versions | grep "neovim3"; then
    pyenv virtualenv "$(pyenv versions | grep -E '3\.[[:digit:]]*\.[[:digit:]]*' | tail -n1 | sed -E 's/.*(3\.[[:digit:]]*\.[[:digit:]]*).*/\1/')" neovim3
    "$HOME/.pyenv/versions/neovim3/bin/python" -m pip install pynvim
fi

