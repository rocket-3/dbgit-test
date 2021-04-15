name: public/film_in_stock.fnc
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: film_in_stock
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    arguments: p_film_id integer, p_store_id integer, OUT p_film_count integer
    ddl: |-
      CREATE OR REPLACE FUNCTION public.film_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer)
       RETURNS SETOF integer
       LANGUAGE sql
      AS $function$
           SELECT inventory_id
           FROM inventory
           WHERE film_id = $1
           AND store_id = $2
           AND inventory_in_stock(inventory_id);
      $function$
    name: film_in_stock
    rolname: postgres
    schema: public
  sql: |
    CREATE OR REPLACE FUNCTION public.film_in_stock(p_film_id integer, p_store_id integer, OUT p_film_count integer)
     RETURNS SETOF integer
     LANGUAGE sql
    AS $function$
         SELECT inventory_id
         FROM inventory
         WHERE film_id = $1
         AND store_id = $2
         AND inventory_in_stock(inventory_id);
    $function$
