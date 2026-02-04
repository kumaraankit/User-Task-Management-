-- Initial migration: Create users table
CREATE TABLE IF NOT EXISTS "users" (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL UNIQUE,
  username varchar(255) NOT NULL UNIQUE,
  password varchar(255) NOT NULL,
  address text
);
