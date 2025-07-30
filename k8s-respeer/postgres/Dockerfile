FROM postgres:16.4

RUN apt-get update && \
    apt-get install -y build-essential libpq-dev postgresql-server-dev-16 git

RUN git clone https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install

