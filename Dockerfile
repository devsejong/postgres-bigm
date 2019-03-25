FROM postgres:9.6
MAINTAINER kazaoki lab.

RUN apt-get update \
    && apt-get install -y curl make gcc postgresql-server-dev-9.6 libicu-dev \
    && cd /tmp \
    && curl -L -O https://ja.osdn.net/dl/pgbigm/pg_bigm-1.2-20161011.tar.gz \
    && tar zxfv pg_bigm-1.2-20161011.tar.gz \
    && cd pg_bigm-1.2-20161011 \
    && make USE_PGXS=1 \
    && make USE_PGXS=1 install \
    && sed -i "s/#shared_preload_libraries.+$/shared_preload_libraries = 'pg_bigm'/" /usr/share/postgresql/postgresql.conf.sample \
    && rm -fr /tmp/pg_bigm-1.2-20161011 \
    && apt-get purge -y curl make gcc postgresql-server-dev-9.6 libicu-dev \
    && apt-get clean
