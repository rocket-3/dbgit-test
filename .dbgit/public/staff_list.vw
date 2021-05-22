name: public/staff_list.vw
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: staff_list
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: |-
      create or replace view public.staff_list as  SELECT s.staff_id AS id,
          ((s.first_name || ' '::text) || s.last_name) AS name,
          a.address,
          a.postal_code AS "zip code",
          a.phone,
          city.city,
          country.country,
          s.store_id AS sid
         FROM (((staff s
           JOIN address a ON ((s.address_id = a.address_id)))
           JOIN city ON ((a.city_id = city.city_id)))
           JOIN country ON ((city.country_id = country.country_id)));
    object_name: staff_list
    object_schema: public
    owner: postgres
  sql: |-
    create or replace view public.staff_list as  SELECT s.staff_id AS id,
        ((s.first_name || ' '::text) || s.last_name) AS name,
        a.address,
        a.postal_code AS "zip code",
        a.phone,
        city.city,
        country.country,
        s.store_id AS sid
       FROM (((staff s
         JOIN address a ON ((s.address_id = a.address_id)))
         JOIN city ON ((a.city_id = city.city_id)))
         JOIN country ON ((city.country_id = country.country_id)));
