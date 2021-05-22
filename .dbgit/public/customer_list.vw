name: public/customer_list.vw
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: customer_list
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: |-
      create or replace view public.customer_list as  SELECT cu.customer_id AS id,
          ((cu.first_name || ' '::text) || cu.last_name) AS name,
          a.address,
          a.postal_code AS "zip code",
          a.phone,
          city.city,
          country.country,
              CASE
                  WHEN cu.activebool THEN 'active'::text
                  ELSE ''::text
              END AS notes,
          cu.store_id AS sid
         FROM (((customer cu
           JOIN address a ON ((cu.address_id = a.address_id)))
           JOIN city ON ((a.city_id = city.city_id)))
           JOIN country ON ((city.country_id = country.country_id)));
    object_name: customer_list
    object_schema: public
    owner: postgres
  sql: |-
    create or replace view public.customer_list as  SELECT cu.customer_id AS id,
        ((cu.first_name || ' '::text) || cu.last_name) AS name,
        a.address,
        a.postal_code AS "zip code",
        a.phone,
        city.city,
        country.country,
            CASE
                WHEN cu.activebool THEN 'active'::text
                ELSE ''::text
            END AS notes,
        cu.store_id AS sid
       FROM (((customer cu
         JOIN address a ON ((cu.address_id = a.address_id)))
         JOIN city ON ((a.city_id = city.city_id)))
         JOIN country ON ((city.country_id = country.country_id)));
