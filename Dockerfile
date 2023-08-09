FROM postgres:15.3
LABEL maintainer "devsejong"

RUN set -ex \
    && apt-get update \
    && apt-get install -y curl make gcc postgresql-server-dev-15 libicu-dev \
    && cd /tmp \
    && curl -L -O https://github.com/pgbigm/pg_bigm/releases/download/v1.2-20200228/pg_bigm-1.2-20200228.tar.gz \
    && tar zxfv pg_bigm-1.2-20200228.tar.gz \
    && cd pg_bigm-1.2-20200228 \
    && make USE_PGXS=1 \
    && make USE_PGXS=1 install \
    && sed -i "s/#shared_preload_libraries.+$/shared_preload_libraries = 'pg_bigm'/" /usr/share/postgresql/postgresql.conf.sample \
    && rm -fr /tmp/pg_bigm-1.2-20200228 \
    && apt-get purge -y curl make gcc postgresql-server-dev-15 libicu-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*