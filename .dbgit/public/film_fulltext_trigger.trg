name: public/film_fulltext_trigger.trg
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: film_fulltext_trigger
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film
      FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('fulltext', 'pg_catalog.english',
      'title', 'description')
    tgname: film_fulltext_trigger
    trigger_table: film
  sql: CREATE TRIGGER film_fulltext_trigger BEFORE INSERT OR UPDATE ON public.film
    FOR EACH ROW EXECUTE PROCEDURE tsvector_update_trigger('fulltext', 'pg_catalog.english',
    'title', 'description')
