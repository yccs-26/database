-- 연도 > 2000 : games 테이블에서 year > 2000 으로 조건 추가
-- 메달 수상한 선수를 뽑을 것 (athletes - )
-- 수상한 선수들 중에서 국적이 2개 이상인 선수 

-- SELECT name, medal, team_id, athlete_id
-- FROM records
-- INNER JOIN athletes on athletes.id = records.athlete_id
-- WHERE name LIKE 'Chen J%' AND medal IS NOT NULL;


-- SELECT
--   athletes.name
-- FROM
--   records
--   INNER JOIN athletes on athletes.id = records.athlete_id
--   INNER JOIN games on games.id = records.game_id
-- WHERE
--   games.year >= 2000
--   AND records.medal IS NOT NULL
-- GROUP BY
--   athletes.name
-- HAVING
--   count(DISTINCT records.team_id) > 1
-- ORDER BY
--   athletes.name;

-- grouping을 name에서 id로 바꿈. 동명이인 때문에!  

  SELECT
  athletes.name
FROM
  records
  INNER JOIN athletes on athletes.id = records.athlete_id
  INNER JOIN games on games.id = records.game_id
WHERE
  games.year >= 2000
  AND records.medal IS NOT NULL
GROUP BY
  athletes.id
HAVING
  count(DISTINCT records.team_id) > 1
ORDER BY
  athletes.name;