#!/bin/sh

TAG=${TAG:-v0.14.1}

mkdir -p /app/data/inputs
wget https://github.com/linera-io/linera-protocol/archive/refs/tags/${TAG}.zip
unzip ${TAG}.zip -d /app/data/inputs
rm /app/data/inputs/linera-protocol-${TAG}/.github -rf

python -m lightrag.api.lightrag_server --auto-scan-at-startup
