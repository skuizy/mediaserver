#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER ncuser WITH PASSWORD 'ncpw';
    CREATE USER prowlarr WITH PASSWORD 'prowlarr';
    CREATE DATABASE ncdb;
    CREATE DATABASE "prowlarr-main";
    CREATE DATABASE "prowlarr-log";
    GRANT ALL PRIVILEGES ON DATABASE ncdb TO ncuser;
    GRANT ALL PRIVILEGES ON DATABASE "prowlarr-main" TO prowlarr;
    GRANT ALL PRIVILEGES ON DATABASE "prowlarr-log" TO prowlarr;
    
EOSQL
