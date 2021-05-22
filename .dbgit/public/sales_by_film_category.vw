name: public/sales_by_film_category.vw
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: sales_by_film_category
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: |-
      create or replace view public.sales_by_film_category as  SELECT c.name AS category,
          sum(p.amount) AS total_sales
         FROM (((((payment p
           JOIN rental r ON ((p.rental_id = r.rental_id)))
           JOIN inventory i ON ((r.inventory_id = i.inventory_id)))
           JOIN film f ON ((i.film_id = f.film_id)))
           JOIN film_category fc ON ((f.film_id = fc.film_id)))
           JOIN category c ON ((fc.category_id = c.category_id)))
        GROUP BY c.name
        ORDER BY (sum(p.amount)) DESC;
    object_name: sales_by_film_category
    object_schema: public
    owner: postgres
  sql: |-
    create or replace view public.sales_by_film_category as  SELECT c.name AS category,
        sum(p.amount) AS total_sales
       FROM (((((payment p
         JOIN rental r ON ((p.rental_id = r.rental_id)))
         JOIN inventory i ON ((r.inventory_id = i.inventory_id)))
         JOIN film f ON ((i.film_id = f.film_id)))
         JOIN film_category fc ON ((f.film_id = fc.film_id)))
         JOIN category c ON ((fc.category_id = c.category_id)))
      GROUP BY c.name
      ORDER BY (sum(p.amount)) DESC;
