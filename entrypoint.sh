#!/bin/sh

TAG=${TAG:-v0.14.1}

mkdir -p /app/data/inputs
wget https://github.com/linera-io/linera-protocol/archive/refs/tags/${TAG}.zip
unzip ${TAG}.zip -d /app/data/inputs
rm /app/data/inputs/linera-protocol-${TAG}/.github -rf

cd /app/data/inputs
git clone https://github.com/async-graphql/async-graphql.git
cd async-graphql
git checkout ${ASYNC_GRAPHQL_COMMIT}

cd /app/data/inputs
git clone https://github.com/linera-io/linera-documentation.git
cd linera-documentation
git checkout ${LINERA_DOCUMENTATION_COMMIT}

python -m lightrag.api.lightrag_server --auto-scan-at-startup
