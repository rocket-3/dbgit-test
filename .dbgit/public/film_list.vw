name: public/film_list.vw
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: film_list
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: |-
      create or replace view public.film_list as  SELECT film.film_id AS fid,
          film.title,
          film.description,
          category.name AS category,
          film.rental_rate AS price,
          film.length,
          film.rating,
          group_concat((((actor.first_name)::text || ' '::text) || (actor.last_name)::text)) AS actors
         FROM ((((category
           LEFT JOIN film_category ON ((category.category_id = film_category.category_id)))
           LEFT JOIN film ON ((film_category.film_id = film.film_id)))
           JOIN film_actor ON ((film.film_id = film_actor.film_id)))
           JOIN actor ON ((film_actor.actor_id = actor.actor_id)))
        GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating;
    object_name: film_list
    object_schema: public
    owner: postgres
  sql: |-
    create or replace view public.film_list as  SELECT film.film_id AS fid,
        film.title,
        film.description,
        category.name AS category,
        film.rental_rate AS price,
        film.length,
        film.rating,
        group_concat((((actor.first_name)::text || ' '::text) || (actor.last_name)::text)) AS actors
       FROM ((((category
         LEFT JOIN film_category ON ((category.category_id = film_category.category_id)))
         LEFT JOIN film ON ((film_category.film_id = film.film_id)))
         JOIN film_actor ON ((film.film_id = film_actor.film_id)))
         JOIN actor ON ((film_actor.actor_id = actor.actor_id)))
      GROUP BY film.film_id, film.title, film.description, category.name, film.rental_rate, film.length, film.rating;
