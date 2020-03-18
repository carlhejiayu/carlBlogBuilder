#!/bin/sh

GITHUB_WEBHOST_REPO=/Users/carlhe/workspace/carlhejiayu.github.io
# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -d $GITHUB_WEBHOST_REPO

# Go To Public folder
cd $GITHUB_WEBHOST_REPO

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
