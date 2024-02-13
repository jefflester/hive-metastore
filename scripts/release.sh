#!/usr/bin/env bash

# Safeties on: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
set -euo pipefail

DEFAULT_TAG=jefflester/hive-metastore:3.1.3-full
TAG=${TAG:-$DEFAULT_TAG}

docker buildx ls | grep multiarch || docker buildx create --name multiarch --use

docker buildx build --push \
    --platform linux/arm64,linux/amd64 \
    --tag "$TAG" \
    .
