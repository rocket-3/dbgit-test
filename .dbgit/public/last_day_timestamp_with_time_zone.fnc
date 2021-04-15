name: public/last_day.fnc
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: last_day
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    arguments: timestamp with time zone
    ddl: |-
      CREATE OR REPLACE FUNCTION public.last_day(timestamp with time zone)
       RETURNS date
       LANGUAGE sql
       IMMUTABLE STRICT
      AS $function$
        SELECT CASE
          WHEN EXTRACT(MONTH FROM $1) = 12 THEN
            (((EXTRACT(YEAR FROM $1) + 1) operator(pg_catalog.||) '-01-01')::date - INTERVAL '1 day')::date
          ELSE
            ((EXTRACT(YEAR FROM $1) operator(pg_catalog.||) '-' operator(pg_catalog.||) (EXTRACT(MONTH FROM $1) + 1) operator(pg_catalog.||) '-01')::date - INTERVAL '1 day')::date
          END
      $function$
    name: last_day
    rolname: postgres
    schema: public
  sql: |
    CREATE OR REPLACE FUNCTION public.last_day(timestamp with time zone)
     RETURNS date
     LANGUAGE sql
     IMMUTABLE STRICT
    AS $function$
      SELECT CASE
        WHEN EXTRACT(MONTH FROM $1) = 12 THEN
          (((EXTRACT(YEAR FROM $1) + 1) operator(pg_catalog.||) '-01-01')::date - INTERVAL '1 day')::date
        ELSE
          ((EXTRACT(YEAR FROM $1) operator(pg_catalog.||) '-' operator(pg_catalog.||) (EXTRACT(MONTH FROM $1) + 1) operator(pg_catalog.||) '-01')::date - INTERVAL '1 day')::date
        END
    $function$
