#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 <<-EOSQL
    CREATE DATABASE schellar;
EOSQL