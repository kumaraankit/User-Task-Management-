-- Create database 'task' and users table
-- Run this file with psql against the Postgres container (see README instructions)

-- Create database (if it already exists this will raise a notice/error which is safe to ignore)

CREATE DATABASE task;

\connect task

-- Ensure uuid generation extension is available
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create users table
CREATE TABLE IF NOT EXISTS "users" (
  id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  name varchar(255) NOT NULL,
  email varchar(255) NOT NULL UNIQUE,
  username varchar(255) NOT NULL UNIQUE,
  password varchar(255) NOT NULL,
  address text
);
