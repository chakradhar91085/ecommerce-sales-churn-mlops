#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE retail_dw;
EOSQL
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname retail_dw -f /docker-entrypoint-initdb.d/schema.sql
