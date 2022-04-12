Run like so?

```sh
docker run --net=host \
  -e PGRST_DB_URI=postgres://postgres:postgres@localhost/phenix_displays_dev \
  -e PGRST_DB_SCHEMA=public \
  -e PGRST_DB_ANON_ROLE=postgres \
  --rm postgrest/postgrest:v9.0.0.20220211
```

query?


```sh
curl "localhost:3000/deals?id=eq.3&select=id,name,price,deal_clients(clients(id))"
[{"id":3,"name":"Dealer","price":1.01,"deal_clients":[{"clients":{"id":1}},
 {"clients":{"id":125}},
 {"clients":{"id":89}}]}]
```

> note the fk names are not that good: should be `(deal_)clients{[{client{id}]}` the second is `clients`.

output

```
2022-04-11 17:11:34.815 CEST [29313] postgres@phenix_displays_dev LOG:  execute 0: BEGIN ISOLATION LEVEL READ COMMITTED READ ONLY
2022-04-11 17:11:34.815 CEST [29313] postgres@phenix_displays_dev LOG:  execute 1: select set_config($1, $2, true), set_config($3, $4, true), set_config($5, $6, true), set_config($7, $8, true), set_config($9, $10, true), set_config($11, $12, true), set_config($13, $14, true)
2022-04-11 17:11:34.815 CEST [29313] postgres@phenix_displays_dev DETAIL:  parameters: $1 = 'search_path', $2 = 'public, public', $3 = 'role', $4 = 'postgres', $5 = 'request.jwt.claims', $6 = '{"role":"postgres"}', $7 = 'request.method', $8 = 'GET', $9 = 'request.path', $10 = '/deals', $11 = 'request.headers', $12 = '{"accept":"*/*","user-agent":"curl/7.81.0","host":"localhost:3000"}', $13 = 'request.cookies', $14 = '{}'
2022-04-11 17:11:34.824 CEST [29313] postgres@phenix_displays_dev LOG:  execute 2: WITH pgrst_source AS ( SELECT "public"."deals"."id", "public"."deals"."name", "public"."deals"."price", COALESCE ((SELECT json_agg("deals".*) FROM (SELECT row_to_json("deal_clients_clients".*) AS "clients"FROM "public"."deal_clients"  LEFT JOIN LATERAL( SELECT "public"."clients"."id"FROM "public"."clients"  WHERE "public"."deal_clients"."client_id" = "public"."clients"."id"   ) AS "deal_clients_clients" ON TRUE  WHERE "public"."deals"."id" = "public"."deal_clients"."deal_id"  ) "deals" ), '[]') AS "deal_clients"FROM "public"."deals"  WHERE  "public"."deals"."id" = $1   )  SELECT null::bigint AS total_result_set, pg_catalog.count(_postgrest_t) AS page_total, array[]::text[] AS header, coalesce(json_agg(_postgrest_t), '[]')::character varying AS body, nullif(current_setting('response.headers', true), '') AS response_headers, nullif(current_setting('response.status', true), '') AS response_status FROM ( SELECT * FROM pgrst_source ) _postgrest_t
2022-04-11 17:11:34.824 CEST [29313] postgres@phenix_displays_dev DETAIL:  parameters: $1 = '3'
2022-04-11 17:11:34.825 CEST [29313] postgres@phenix_displays_dev LOG:  execute 3: COMMIT
```

microscope?

```
WITH pgrst_source AS (
  SELECT "public"."deals"."id", "public"."deals"."name", "public"."deals"."price", 
	COALESCE ((SELECT json_agg("deals".*) FROM (
		SELECT row_to_json("deal_clients_clients".*) AS "clients" 
		FROM "public"."deal_clients" LEFT JOIN LATERAL( 
      SELECT "public"."clients"."id" FROM "public"."clients" 
			WHERE "public"."deal_clients"."client_id" = "public"."clients"."id")
	  AS "deal_clients_clients" ON TRUE
    WHERE "public"."deals"."id" = "public"."deal_clients"."deal_id") 
   "deals" ), '[]') 
   AS "deal_clients" 
   FROM "public"."deals"  
WHERE  "public"."deals"."id" = $1) 
SELECT null::bigint AS total_result_set, pg_catalog.count(_postgrest_t) AS page_total, array[]::text[] AS header, 
coalesce(json_agg(_postgrest_t), '[]')::character varying AS body, 
nullif(current_setting('response.headers', true), '') AS response_headers, 
nullif(current_setting('response.status', true), '') AS response_status 
FROM ( SELECT * FROM pgrst_source ) _postgrest_t
```

Approach to building the query is interesting and simpler than hasura!
Plans look approx the same with an handwritten sql I understand :)


```sh
(echo 'explain '; cat hand.sql) | sudo -u postgres psql phenix_displays_dev
(echo 'explain '; cat prest.sql) | sudo -u postgres psql phenix_displays_dev
```
