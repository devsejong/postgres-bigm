#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load PostGIS into both template_database and $POSTGRES_DB
for DB in "$POSTGRES_DB" "${@}"; do
    echo "Apply pg_bigm extensions '$DB'"
    psql --dbname="$DB" -c "
        CREATE EXTENSION IF NOT EXISTS pg_bigm;
    "
done
