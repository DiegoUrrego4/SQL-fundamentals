

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa

-- Forma Fernando
SELECT COUNT(*) as total, b."name" as continent FROM country a
INNER JOIN continent b ON a.continent = b.code
WHERE b."name" NOT LIKE '%America%'
GROUP by  a.continent,b."name"
UNION
SELECT COUNT(*), 'America' as "name" FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE b."name" LIKE '%America%'
ORDER BY total ASC;

-- Mi forma
SELECT COUNT(*) as total, b."name" as continent FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE a.continent IN (2,3,1,5,7)
GROUP by  a.continent,b."name"
UNION
SELECT COUNT(*), 'America' as "name" FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE a.continent IN (6,8,4)
ORDER BY total ASC;

-- Tarea: ¿Cuál es el país con más ciudades?
-- Campos: total de ciudades y el nombre del país
-- Usar INNER JOIN

SELECT
	COUNT(*) AS number_of_cities,
	a. "name" AS country
FROM
	country a
	INNER JOIN city b ON a.code = b.countrycode
GROUP BY
	a. "name"
ORDER by number_of_cities DESC
LIMIT 1;

