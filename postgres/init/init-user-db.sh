#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $(cat /run/secrets/POSTGRES_NC_USER) WITH PASSWORD '$(cat /run/secrets/POSTGRES_NC_PASSWORD)';
    CREATE USER $(cat /run/secrets/POSTGRES_PROWLARR_USER) WITH PASSWORD '$(cat /run/secrets/POSTGRES_PROWLARR_PASSWORD)';
    CREATE DATABASE "$(cat /run/secrets/POSTGRES_NC_DB)";
    CREATE DATABASE "$(cat /run/secrets/POSTGRES_PROWLARR_DB_MAIN)";
    CREATE DATABASE "$(cat /run/secrets/POSTGRES_PROWLARR_DB_LOG)";
    GRANT ALL PRIVILEGES ON DATABASE "$(cat /run/secrets/POSTGRES_NC_DB)" TO $(cat /run/secrets/POSTGRES_NC_USER);
    GRANT ALL PRIVILEGES ON DATABASE "$(cat /run/secrets/POSTGRES_PROWLARR_DB_MAIN)" TO $(cat /run/secrets/POSTGRES_PROWLARR_USER);
    GRANT ALL PRIVILEGES ON DATABASE "$(cat /run/secrets/POSTGRES_PROWLARR_DB_LOG)" TO $(cat /run/secrets/POSTGRES_PROWLARR_USER);
    
EOSQL
