#!/bin/sh
set -e

echo "Starting container; waiting for DB & running migrations if any..."

# Wait for Postgres to be ready (if pg_isready exists)
if command -v pg_isready >/dev/null 2>&1; then
  echo "Waiting for Postgres..."
  until pg_isready -h ${POSTGRES_HOST:-db} -p ${POSTGRES_PORT:-5432} -U ${POSTGRES_USER:-user}; do
    echo "Postgres is not ready - sleeping 1s"
    sleep 1
  done
  echo "Postgres appears to be ready"
fi

# Run TypeORM migrations if the script is present in package.json
if npm run | grep -q "typeorm:migrate"; then
  echo "Running TypeORM migrations..."
  npm run typeorm:migrate || echo "TypeORM migrations failed or no migrations present"
fi

exec "$@"
