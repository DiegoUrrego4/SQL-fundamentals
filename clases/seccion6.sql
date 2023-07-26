-- Unir consultas
-- COSAS IMPORTANTES A TENER EN CUENTA: Los números de columnas a unir deben ser iguales
-- Los tipos de las columnas (int, string, …, etc) deben coincidir. 
SELECT
	code, "name"
FROM
	continent
WHERE
	name LIKE '%America%'

UNION
SELECT
	code, "name"
FROM
	continent
WHERE
	code in(3, 5)
ORDER by "name" ASC;


-- Tarea: country a - name,continent (código númerico)
-- continent b - name as continentName

SELECT a."name" as country, a.continent as continent_code, b."name" as continent_name FROM country a
FULL OUTER JOIN continent b ON b.code = a.continent;

-- Tarea: Right outer join con exclusión
-- Todos los continentes que no tienen un pais asociado
SELECT b."name" as continent_name FROM country a
RIGHT JOIN continent b ON a.continent = b.code
WHERE a.continent IS NULL;

-- Tarea número de paises que tiene cada continente
SELECT
	COUNT(a.*) as number_of_countries,
	b."name" as continent_name
FROM
	country a
INNER JOIN continent b ON b.code = a.continent
GROUP BY
	b."name"
UNION
SELECT
	COUNT(a.*) as number_of_countries,
	b."name" as continent_name
FROM
	country a
RIGHT JOIN continent b ON b.code = a.continent
WHERE a.continent ISNULL
GROUP BY
	b."name"
ORDER by number_of_countries ASC;

-- Quiero saber los idiomas oficiales que se hablan por continente
SELECT * FROM countrylanguage WHERE isofficial = TRUE;

SELECT * from country;

SELECT * from continent;

SELECT DISTINCT
	a."language", c."name" as continent
FROM
	countrylanguage a
	INNER JOIN country b ON a.countrycode = b.code
	INNER JOIN continent c ON b.continent = c.code
WHERE
	isofficial = TRUE;



-- ¿Cuantos idiomas oficiales se hablan por continente?
SELECT COUNT(*), continent FROM (
SELECT DISTINCT
	a."language", c."name" as continent
FROM
	countrylanguage a
	INNER JOIN country b ON a.countrycode = b.code
	INNER JOIN continent c ON b.continent = c.code
WHERE
	isofficial = TRUE

) as totales
GROUP BY continent;


SELECT * FROM "language";
SELECT * from countrylanguage;


SELECT DISTINCT
	a."language", d."name", a.languagecode, c."name" as continent
FROM
	countrylanguage a
	INNER JOIN country b ON a.countrycode = b.code
	INNER JOIN continent c ON b.continent = c.code
	INNER JOIN "language" d ON d.code = a.languagecode
WHERE
	isofficial = TRUE;


