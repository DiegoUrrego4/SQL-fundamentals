select *
from country;

alter table country
    add primary key (code);

select *
from country where code = 'NLD';

delete
from country
where code2 = 'NA';

-- Pone la restricción a una columna
alter table country add check ( surfacearea >= 0 );

select *
from country;

-- Pone la restricción a una columna
alter table country
    add check ( surfacearea >= 0 );

select distinct continent
from country;

alter table country
    add check (
            (continent = 'Asia'::text) OR
            (continent = 'South America'::text) OR
            (continent = 'North America'::text) OR
            (continent = 'Central America'::text) OR
            (continent = 'Oceania'::text) OR
            (continent = 'Antarctica'::text) OR
            (continent = 'Africa'::text) OR
            (continent = 'Europe'::text)
        );

-- Borrar checks
ALTER TABLE country DROP CONSTRAINT country_continent_check;


select * FROM country WHERE code = 'MEX';

update country
set continent = 'Central America'
where code = 'CRI';

select *
from country
where continent = 'Africa';

create index "country_continent" on country (
                                             continent
    );

select *
from city
where name = 'Jinzhou'
  and countrycode = 'CHN'
  and district = 'Liaoning';

select *
from city;

create unique index "unique_name_countrycode_district" on city (
                                                                name, countrycode, district
    );

create index "index_district" on city (district);

-- CREAR LLAVES FORANEAS
ALTER TABLE city
    ADD CONSTRAINT fk_country_code
        FOREIGN KEY (countrycode)
            REFERENCES country (code); -- ON DELETE CASCADE



INSERT INTO country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


select *
from country
where code = 'NAM';

select *
from city
where countrycode = 'NAM';

select *
from countrylanguage
where countrycode = 'NAM';

delete from countrylanguage where countrycode = 'NAM';

ALTER TABLE countrylanguage
    ADD CONSTRAINT fk_country_code
        FOREIGN KEY (countrycode)
            REFERENCES country (code);

select *
from country where code = 'AFG';

-- País
select *
from country where code = 'AFG';

-- Ciudad
select *
from city where countrycode = 'AFG';

select a.name, a.continent,
       (select "code" from continent b where b.name = a.continent)
from country a;

select *
from country where name = 'Aruba';

update country a
set continent = (select "code" from continent b where b.name = a.continent);

select *
from country;

-- Cambiar tipo a columna 
alter table country
alter column continent type int4
USING continent::integer;