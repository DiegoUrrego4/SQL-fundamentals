-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage a where isofficial = true;

select * from country;

select * from continent;

Select * from "language";


SELECT
	COUNT(*),
	b.languagecode,
	b. "language"
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5
	AND b.isofficial = TRUE
GROUP BY
	b.languagecode,
	b. "language"
ORDER by COUNT(*) DESC
LIMIT 1;


-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa
-- (no hacer subquery, tomar el código anterior)

SELECT
	*
FROM
	country a
	INNER JOIN countrylanguage b ON a.code = b.countrycode
WHERE
	a.continent = 5 and b.isofficial = TRUE and b.languagecode = 135;
