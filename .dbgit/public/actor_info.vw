name: public/actor_info.vw
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: actor_info
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: |-
      create or replace view public.actor_info as  SELECT a.actor_id,
          a.first_name,
          a.last_name,
          group_concat(DISTINCT ((c.name || ': '::text) || ( SELECT group_concat(f.title) AS group_concat
                 FROM ((film f
                   JOIN film_category fc_1 ON ((f.film_id = fc_1.film_id)))
                   JOIN film_actor fa_1 ON ((f.film_id = fa_1.film_id)))
                WHERE ((fc_1.category_id = c.category_id) AND (fa_1.actor_id = a.actor_id))
                GROUP BY fa_1.actor_id))) AS film_info
         FROM (((actor a
           LEFT JOIN film_actor fa ON ((a.actor_id = fa.actor_id)))
           LEFT JOIN film_category fc ON ((fa.film_id = fc.film_id)))
           LEFT JOIN category c ON ((fc.category_id = c.category_id)))
        GROUP BY a.actor_id, a.first_name, a.last_name;
    object_name: actor_info
    object_schema: public
    owner: postgres
  sql: |-
    create or replace view public.actor_info as  SELECT a.actor_id,
        a.first_name,
        a.last_name,
        group_concat(DISTINCT ((c.name || ': '::text) || ( SELECT group_concat(f.title) AS group_concat
               FROM ((film f
                 JOIN film_category fc_1 ON ((f.film_id = fc_1.film_id)))
                 JOIN film_actor fa_1 ON ((f.film_id = fa_1.film_id)))
              WHERE ((fc_1.category_id = c.category_id) AND (fa_1.actor_id = a.actor_id))
              GROUP BY fa_1.actor_id))) AS film_info
       FROM (((actor a
         LEFT JOIN film_actor fa ON ((a.actor_id = fa.actor_id)))
         LEFT JOIN film_category fc ON ((fa.film_id = fc.film_id)))
         LEFT JOIN category c ON ((fc.category_id = c.category_id)))
      GROUP BY a.actor_id, a.first_name, a.last_name;
