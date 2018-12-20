#!/bin/bash
kubectl exec pgsql-7bc5dd85bb-8tzp7 -- su postgres -c 'psql template1 -c "create extension if not exists hstore;"'
kubectl exec pgsql-7bc5dd85bb-8tzp7 -- su postgres -c 'psql template1 -c "create extension if not exists pg_trgm;"'
kubectl exec pgsql-7bc5dd85bb-8tzp7 -- su postgres -c 'psql **discourse** -c "create extension if not exists hstore;"'
kubectl exec pgsql-7bc5dd85bb-8tzp7 -- su postgres -c 'psql **discourse** -c "create extension if not exists pg_trgm;"'
