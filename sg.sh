#!/bin/bash

# TODO:
# 1. Delete all local and remote branches

# If git isn't installed, we can't exactly wrap it...
type "git" &>/dev/null || { echo "Can't find git, aborting..." && exit 1; }

# I'll get you next time, Gadget...
{ _sg_log=$(git $@ 2>&1) || [ $# -eq 0 ]; } && echo "$_sg_log" && exit 0

# We'll need the base git dir
GITDIR=$(cd "$(git rev-parse --show-toplevel)" && pwd)

# If there's no repo here, we can't be jerks, so just abort
[ ! -d "$GITDIR/.git" ] && exit 1

# We'll need these...
_sg_remotes="$(git remote -v | grep push | awk '{print $1" "$2}')"
_sg_branches=$(git branch -a | grep -v '>' | awk -F '/' '{print $NF}' | tr -d ' *' | sort -u | tr '\n' ' ')

# Go back to master so we don't orphan a current feature branch
git add . && git stash &>/dev/null
git checkout master &>/dev/null

# Delete all local branches
git branch -D $_sg_branches &>/dev/null

# Remove git/history
rm -rf $GITDIR/.git &>/dev/null

# Remove the repo files
rm -rf $GITDIR/* $GITDIR/.* &>/dev/null

# Celebrate the occasion with an explanatory readme
printf "Ack! It's going to be a long day...\n\n---\n\n${_sg_log}\n\n---\n\n:(\n" > readme.txt 2>&1

# Create a blank repo with our readme-o-shame
git init &>/dev/null
git add . &>/dev/null
git commit -m 'Oh no! :(' &>/dev/null

# Force push the new repo to all of the previous origins and delete existing remote branches
for (( i=0; i<${#_sg_remotes[@]}; i++ )); do
    read -a _remote_parts <<< ${_sg_remotes[$i]}
    [ -z "${_remote_parts[0]}" ] && continue
    git remote add ${_remote_parts[0]} ${_remote_parts[1]} &>/dev/null
    git push --delete ${_remote_parts[0]} $_sg_branches &>/dev/null
    git push -u --force ${_remote_parts[0]} master &>/dev/null
done

printf $_sg_log

