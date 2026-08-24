\set v1 '1440'

WITH pgrst_source AS (
  SELECT
    "public"."displays"."id",
    "public"."displays"."name",
    row_to_json("displays_players_1".*)::jsonb AS "players"
  FROM
    "public"."displays"
    LEFT JOIN LATERAL (
      SELECT
        "players_1"."remote_id"
      FROM
        "public"."players" AS "players_1"
      WHERE
        "players_1"."id" = "public"."displays"."player_id"
    ) AS "displays_players_1" ON TRUE
  WHERE
    "public"."displays"."id" = :'v1'
)
SELECT
  NULL::bigint AS total_result_set,
  pg_catalog.count(_postgrest_t) AS page_total,
  coalesce(json_agg(_postgrest_t), '[]') AS body,
  nullif(current_setting('response.headers', TRUE), '') AS response_headers,
  nullif(current_setting('response.status', TRUE), '') AS response_status,
  '' AS response_inserted
FROM
  (
    SELECT
      *
    FROM
      pgrst_source
  ) _postgrest_t
