#!/bin/sh
set -e
jq -n -f manifest.jq --arg browser "$1" > manifest.json
rm -f archive.zip
zip archive.zip LICENSE manifest.json icon.png worker.js
