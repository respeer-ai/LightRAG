#!/bin/sh

[ -f /app/.env ] && . /app/.env
LINERA_TAG=${LINERA_TAG:-master}
mkdir -p /app/data/inputs

if [ ! -d /app/data/inputs/linera-protocol-${LINERA_TAG} ]; then
git clone https://github.com/linera-io/linera-protocol.git
cd linera-protocol
git checkout ${LINERA_TAG}
rm .github -rf
cd -
mv linera-protocol /app/data/inputs/linera-protocol-${LINERA_TAG}
fi

if [ ! -d /app/data/inputs/async-graphql-${ASYNC_GRAPHQL_COMMIT} ]; then
if [ "x" != "x$ASYNC_GRAPHQL_COMMIT" ]; then
git clone https://github.com/async-graphql/async-graphql.git
cd async-graphql
git checkout ${ASYNC_GRAPHQL_COMMIT}
rm .github -rf
cd -
mv async-graphql /app/data/inputs/async-graphql_${ASYNC_GRAPHQL_COMMIT}
fi
fi

if [ ! -d /app/data/inputs/linera-documentation-${LINERA_DOCUMENTATION_COMMIT} ]; then
if [ "x" != "x$LINERA_DOCUMENTATION_COMMIT" ]; then
git clone https://github.com/linera-io/linera-documentation.git
cd linera-documentation
git checkout ${LINERA_DOCUMENTATION_COMMIT}
rm .github -rf
cd -
mv linera-documentation /app/data/inputs/linera-documentation-${LINERA_DOCUMENTATION_COMMIT}
fi
fi

python -m lightrag.api.lightrag_server --auto-scan-at-startup
