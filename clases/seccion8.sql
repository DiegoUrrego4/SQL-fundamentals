-- Manejo de fechas
-- Funciones
select now(), current_date, current_time,
       date_part('hours', now()) as hours,
       date_part('minutes', now()) as minutes,
       date_part('seconds', now()) as seconds,
       date_part('days', now()) as days,
       date_part('months', now()) as months,
       date_part('years', now()) as years;

select *
from employees
where hire_date > '1998-02-05'
order by hire_date asc;

select max(hire_date) as mas_nuevo,
       min(hire_date) as primer_empleado
from employees;

select *
from employees
where hire_date BETWEEN '1999-01-01' AND '2000-01-01'
order by hire_date desc;

-- Actualizaciones a las fechas -> Intervalos
select max(hire_date),
--     max(hire_date) + interval '1 days' as days,
--     max(hire_date) + interval '1 months' as months,
--     max(hire_date) + interval '1 years' as years,
--     max(hire_date) + interval '1.1 years' -- 1 día y un mes
--     max(hire_date) + interval '1.1 years' + interval '1 day' as year -- 1 día y un mes y un día
       date_part('year', now()),
       make_interval(YEARS := date_part('year', now())::integer),
       max(hire_date) + make_interval(YEARS := 23)
from employees;


-- Diferencia entre fechas
select hire_date,
       make_interval(YEARS := date_part('years', current_date)::integer - extract(years from hire_date)::integer)
from employees
order by hire_date desc;

-- Actualizar BD empleados
select *
from employees;

update employees
set hire_date = hire_date + make_interval(years := 23);

-- Condiciones: Clausula CASE - THEN
select first_name,
       last_name,
       hire_date,
       case
           when hire_date > now() - interval '1 year' then '1 año o menos'
           when hire_date > now() - interval '3 year' then '1 a 3 años'
           when hire_date > now() - interval '6 year' then '3 a 6 años'
           else '+ de 6 años'
       end as rango_antiguedad
from employees
order by hire_date desc ;