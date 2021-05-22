name: public/last_updated.trg
dbType: POSTGRES
dbVersion: '11.7'
sqlObject:
  name: last_updated
  schema: public
  owner: postgres
  dependencies: !!set {
    }
  options:
    ddl: CREATE TRIGGER last_updated BEFORE UPDATE ON public.store FOR EACH ROW EXECUTE
      PROCEDURE last_updated()
    tgname: last_updated
    trigger_table: store
  sql: CREATE TRIGGER last_updated BEFORE UPDATE ON public.store FOR EACH ROW EXECUTE
    PROCEDURE last_updated()
