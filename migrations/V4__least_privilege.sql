CREATE ROLE app_read;
CREATE ROLE app_write;

GRANT CONNECT ON DATABASE bootcamp TO app_read, app_write;
GRANT USAGE ON SCHEMA public TO app_read, app_write;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO app_read;

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public TO app_write;

-- Password deliberately omitted from source control.
-- Configure the api login separately with a secure secret:
-- CREATE USER api LOGIN PASSWORD '<set-secure-password>' IN ROLE app_write;
