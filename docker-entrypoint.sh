#!/bin/sh
set -e

echo "Starting container; waiting for DB & running migrations if any..."
# Example: wait for Postgres then run migrations. Adjust command to your ORM/migration tool.
if [ -n "$DATABASE_URL" ]; then
  echo "DATABASE_URL present"
fi

# Placeholder for running migrations, e.g.:
# npx prisma migrate deploy

exec "$@"
