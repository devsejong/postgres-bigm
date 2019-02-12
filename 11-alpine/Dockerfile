FROM postgres:11-alpine
LABEL maintainer "kazaoki lab."

RUN apk --update --no-cache add --virtual build-dependencies curl make gcc musl-dev postgresql-dev icu-dev \
    && cd /tmp \
    && curl -L -O https://ja.osdn.net/dl/pgbigm/pg_bigm-1.2-20161011.tar.gz \
    && tar zxfv pg_bigm-1.2-20161011.tar.gz \
    && cd pg_bigm-1.2-20161011 \
    && make USE_PGXS=1 \
    && make USE_PGXS=1 install \
    && echo "shared_preload_libraries = 'pg_bigm'" >> /usr/local/share/postgresql/postgresql.conf.sample \
    && rm -fr /tmp/pg_bigm-1.2-20161011 \
    && apk del --purge build-dependencies
