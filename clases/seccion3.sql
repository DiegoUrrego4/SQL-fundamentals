SELECT
    id,
    upper(name) as upper_name,
    lower(name) as lower_name,
    length(name) as name_lenght,
    (20 * 2) as constante,
    '*'||id||'-'|| name||'*' as custom_name_concat,
    concat('*',id, '-',  name, '*'),
name
FROM users;


SELECT
    name,
    substring(name, 0, POSITION(' ' in name)) as first_name, --Cortar palabras
    substring(name, POSITION(' ' in name) + 1) as last_name,
    TRIM(substring(name, POSITION(' ' in name))) as trimmed_last_name
FROM users;

SELECT * FROM users;

update users
set
    first_name = substring(name, 0, POSITION(' ' in name)),
    last_name = substring(name, POSITION(' ' in name) + 1)