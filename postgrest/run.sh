docker run --rm --net=host \
  -e PGRST_DB_URI="postgres://postgres:postgres@localhost/phenix_displays_dev" \
  -e PGRST_DB_ANON_ROLE=postgres \
  postgrest/postgrest
