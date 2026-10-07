# Hands-On Lab: Audit Logging, Category Trees, and Safe Migrations

A PostgreSQL lab covering trigger-based audit logging, recursive category trees, versioned Flyway migrations, and least-privilege access control.

## Prerequisites

- PostgreSQL 14+
- Flyway CLI
- A local PostgreSQL database named `bootcamp`

## Lab structure

```
migrations/
  V1__core_tables.sql
  V2__audit_log.sql
  V3__categories.sql
  V4__least_privilege.sql
verify/
  audit.sql
  categories.sql
  security.sql
flyway.conf.example
```

## Run the lab

Create the database first:

```bash
createdb bootcamp
```

Run migrations:

```bash
flyway -url=jdbc:postgresql://localhost/bootcamp -user=postgres migrate
flyway info
```

Or copy `flyway.conf.example` to `flyway.conf` and adjust the connection settings.

> Do not commit real database passwords. The example configuration intentionally uses placeholders.

## Verify audit logging

```psql -d bootcamp -f verify/audit.sql
```

The verification updates student 1, deletes student 3, and queries the resulting JSONB audit records.

## Verify the category tree

```psql -d bootcamp -f verify/categories.sql
```

The recursive CTE walks the hierarchy from root categories to descendants.

## Verify security

```psql -d bootcamp -f verify/security.sql
```

The security migration creates `app_read` and `app_write`. It grants connection/schema access and table privileges while avoiding broad database-owner privileges.

## Important PostgreSQL note

The `api` login password must be supplied securely in a real environment. This lab does **not** store a production password in Git. Configure the login separately with a secure secret.

## Migration order

| Version | Purpose |
|---|---|
| V1 | Core `students` table and seed data |
| V2 | Reusable audit table, function, and student trigger |
| V3 | Self-referencing category tree and seed data |
| V4 | Least-privilege roles and grants |

## Expected outcomes

- Student changes appear in `audit_log` with old/new JSONB snapshots.
- The category query produces an indented hierarchy.
- Flyway reports all four migrations as successful.
- `app_read` has read-only table access.
- `app_write` has SELECT/INSERT/UPDATE/DELETE table access.

## Cleanup

For a disposable lab database:

```bash
dropdb bootcamp
```
