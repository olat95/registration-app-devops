#!/bin/bash

short_hash=$(git rev-parse --short HEAD)
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

git add --all
git commit -m "Commit $short_hash at $timestamp"
git push -u origin main
