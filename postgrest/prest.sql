WITH pgrst_source AS (
  SELECT "public"."deals"."id", "public"."deals"."name", "public"."deals"."price",
  COALESCE((SELECT json_agg("deals".*) FROM (
          SELECT row_to_json("deal_clients_clients".*) AS "clients"
          FROM "public"."deal_clients" LEFT JOIN LATERAL(
            SELECT "public"."clients"."id" FROM "public"."clients"
            WHERE "public"."deal_clients"."client_id" = "public"."clients"."id"
   ) AS "deal_clients_clients" ON TRUE
   WHERE "public"."deals"."id" = "public"."deal_clients"."deal_id") "deals"), '[]') AS "deal_clients"
   FROM "public"."deals"
WHERE  "public"."deals"."id" = 3)
SELECT
coalesce(json_agg(_postgrest_t), '[]')
FROM ( SELECT * FROM pgrst_source ) _postgrest_t

