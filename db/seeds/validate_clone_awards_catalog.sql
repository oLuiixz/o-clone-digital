-- Clone Awards catalog validation. Run after migration 004 and seed.
-- This is read-only: it does not create or alter competition data.
WITH track_summary AS (
  SELECT t.slug, t.name,
         COUNT(DISTINCT l.id)::int AS levels,
         COUNT(c.id)::int AS challenges,
         COALESCE(SUM(c.xp),0)::int AS total_xp,
         COUNT(DISTINCT c.xp)::int AS distinct_xp_values
  FROM clone_awards_tracks t
  LEFT JOIN clone_awards_levels l ON l.track_id=t.id
  LEFT JOIN clone_awards_challenges c ON c.level_id=l.id AND c.track_id=t.id AND c.is_active=true
  WHERE t.slug IN ('negocio-dark','revenda-streaming','venda-sites-ecommerce','criar-ecommerce','sites-com-ia')
  GROUP BY t.slug,t.name
),
level_summary AS (
  SELECT t.slug,l.level_number,COUNT(c.id)::int AS challenge_count,
         MIN(c.xp)::int AS min_xp,MAX(c.xp)::int AS max_xp,
         SUM(c.xp)::int AS level_xp
  FROM clone_awards_tracks t
  JOIN clone_awards_levels l ON l.track_id=t.id
  LEFT JOIN clone_awards_challenges c ON c.level_id=l.id AND c.track_id=t.id AND c.is_active=true
  WHERE t.slug IN ('negocio-dark','revenda-streaming','venda-sites-ecommerce','criar-ecommerce','sites-com-ia')
  GROUP BY t.slug,l.level_number
)
SELECT 'track' AS check_type, slug AS item,
       jsonb_build_object('levels',levels,'challenges',challenges,'total_xp',total_xp,
         'expected_levels',15,'expected_challenges',150,'expected_xp',15000,
         'ok',levels=15 AND challenges=150 AND total_xp=15000) AS result
FROM track_summary
UNION ALL
SELECT 'level' AS check_type, slug || ':L' || level_number AS item,
       jsonb_build_object('challenge_count',challenge_count,'min_xp',min_xp,'max_xp',max_xp,
         'expected_count',10,'expected_xp_each',30+(level_number-1)*10,
         'ok',challenge_count=10 AND min_xp=30+(level_number-1)*10 AND max_xp=30+(level_number-1)*10) AS result
FROM level_summary
ORDER BY check_type,item;
