name: public/last_updated.fnc
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: last_updated
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    arguments: ''
    ddl: |-
      CREATE OR REPLACE FUNCTION public.last_updated()
       RETURNS trigger
       LANGUAGE plpgsql
      AS $function$
      BEGIN
          NEW.last_update = CURRENT_TIMESTAMP;
          RETURN NEW;
      END $function$
    name: last_updated
    rolname: postgres
    schema: public
  sql: |
    CREATE OR REPLACE FUNCTION public.last_updated()
     RETURNS trigger
     LANGUAGE plpgsql
    AS $function$
    BEGIN
        NEW.last_update = CURRENT_TIMESTAMP;
        RETURN NEW;
    END $function$
