#!/bin/sh

wget https://github.com/linera-io/linera-protocol/archive/refs/tags/v0.14.1.zip
unzip v0.14.1.zip -d /app/data/inputs/linera-protocol-v0.14.1

python -m lightrag.api.lightrag_server
