#!/bin/bash

if [ "$#" -lt 1 ]; then
  echo Usage: $0 '<ipynb>'
  exit 1
fi

DIFF=$(git diff $1 | head -n 10)

if [ -n "$DIFF" ]; then
  DATE=$(date "+%Y-%m-%d_%H-%M-%S")
  git add $1
  git commit -m "Pushed version: $DATE"
  git pull && git push
fi
