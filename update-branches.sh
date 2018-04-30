#!/usr/bin/env bash
set -e

current_branch="$(git symbolic-ref --short -q HEAD)"
[ "$current_branch" = "master" ] ||
    ( echo >&2 "ERROR: Must be on master branch, aborting."; exit 1 )

for branch in $(git ls-remote --tags --refs -h git@github.com:prometheus/prometheus.git v\* | awk -F'refs/tags/' '{print $2}' | grep -v v1); do

    echo
    echo ">>> Updating branch '$branch'"
    echo

    # If the branch exists, force-delete it:
    if git rev-parse -q --verify "$branch" >/dev/null; then
        git branch -qD "$branch"
    fi

    # Create the branch from master, update its version, and push it to GitHub:
    git checkout -qb "$branch"
    ./set-version.sh
    git push -qf origin "$branch"

    git checkout -q master

done
