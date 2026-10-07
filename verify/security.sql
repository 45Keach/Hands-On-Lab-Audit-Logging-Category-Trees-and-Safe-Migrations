SELECT grantee, table_schema, table_name, privilege_type
FROM information_schema.role_table_grants
WHERE grantee IN ('app_read', 'app_write')
  AND table_schema = 'public'
ORDER BY grantee, table_name, privilege_type;

SELECT rolname, rolcanlogin, rolinherit
FROM pg_roles
WHERE rolname IN ('app_read', 'app_write', 'api')
ORDER BY rolname;
