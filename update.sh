#!/usr/bin/env bash
set -e

current_branch="$(git symbolic-ref --short -q HEAD)"

cp -f Dockerfile.template Dockerfile.generated
sed -i "s#?PROMETHEUS_VERSION?#$current_branch#g" Dockerfile.generated

if [ ! -f Dockerfile ] || ! cmp -s Dockerfile.generated Dockerfile; then
    rm Dockerfile 2>/dev/null || true
    mv Dockerfile.generated Dockerfile
else
    rm Dockerfile.generated
fi
