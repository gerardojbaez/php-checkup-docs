#!/usr/bin/env sh

set -e

npm run build

git add -A
git commit -m "Build docs"
git push origin master
