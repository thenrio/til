\set v1 '1440'

select
  coalesce(json_agg(g), '[]')
from (
  SELECT
    displays.id,
    displays.name,
    row_to_json(displays_players_1.*)::jsonb AS players
  FROM
    displays
    LEFT JOIN LATERAL (
      SELECT
        players_1.remote_id
      FROM
        players AS players_1
      WHERE
        players_1.id = displays.player_id
    ) AS displays_players_1 ON TRUE
  WHERE
    displays.id = :'v1'
) g
