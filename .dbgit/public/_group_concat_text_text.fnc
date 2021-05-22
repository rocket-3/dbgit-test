name: public/_group_concat.fnc
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: _group_concat
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    arguments: text, text
    ddl: |-
      CREATE OR REPLACE FUNCTION public._group_concat(text, text)
       RETURNS text
       LANGUAGE sql
       IMMUTABLE
      AS $function$
      SELECT CASE
        WHEN $2 IS NULL THEN $1
        WHEN $1 IS NULL THEN $2
        ELSE $1 || ', ' || $2
      END
      $function$
    name: _group_concat
    rolname: postgres
    schema: public
  sql: |
    CREATE OR REPLACE FUNCTION public._group_concat(text, text)
     RETURNS text
     LANGUAGE sql
     IMMUTABLE
    AS $function$
    SELECT CASE
      WHEN $2 IS NULL THEN $1
      WHEN $1 IS NULL THEN $2
      ELSE $1 || ', ' || $2
    END
    $function$
