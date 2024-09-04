--find characters whose experince is between min and max
--more experince than the least and less than the most
--uncorrelated subquery
SELECT name, experience
FROM fanatsy.characters
WHERE experience > (
  SELECT MIN(experience)
  FROM fanatsy.characters
)
AND experience < (
  SELECT MAX(experience)
  FROM fanatsy.characters
)


--find the differnce between a character`s experince and their mentor`s
--correlated subquery
SELECT id AS mentee_id, mentor_id,
(
  SELECT experience
  FROM fanatsy.characters AS mentor_table
  WHERE id = mentee_table.mentor_id
) - experience AS experience_differnce
FROM fanatsy.characters AS mentee_table
WHERE mentor_id IS NOT NULL;
