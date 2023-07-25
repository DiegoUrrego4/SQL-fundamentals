select first_name, last_name, followers
from users
where
    -- followers > 4600 AND followers < 4700
followers between 4600 and 4700
order by followers asc;

select * from users;

-- ¿Cuantos registros tiene la tabla?
select
    count(*) as total_users,
    min(followers) as min_followers,
    max(followers) as max_followers,
    round(avg(followers)) as avg_followers,
    sum(followers) / count(*) as avg_manual
from users;

select first_name, last_name, followers
from users
where followers = 4 or followers = 4999
order by followers asc;


select count(*), followers
from users
where followers = 4 or followers = 4999
group by followers;

select count(*), followers
from users
where followers between 4500 and 4999
group by followers
order by followers desc;

-- ORDEN EN SENTENCIAS:
-- SELECT
-- WHERE
-- JOIN
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT
-- OFFSET 

select count(*), country
from users
group by country
order by count(*) desc;

select
    count(*),
    country
from users
group by country
having count(*) > 5
order by count(*) desc;

select distinct  country from users; -- Esto me devuelve los datos presentes, sin datos repetidos

select * from users;

select
    count(*),
    substring(email, position('@' in email) + 1) as domain
from users
group by domain
having count(*) > 1;

-- SUBQUERYS
select *
FROM (select count(*)                                     as total,
             substring(email, position('@' in email) + 1) as domain,
             'Fernando'                                   as name,
             37                                           as age
      from users
      group by domain
      having count(*) > 1
      order by domain asc) as email_domains;