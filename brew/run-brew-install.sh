#!/bin/sh

## install homebrew if missing
if ! command -v brew &> /dev/null
then
    echo "installing homebrew..."
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "installing homebrew...done"
fi

## install Brewfile
brew bundle install --file brew/Brewfile

