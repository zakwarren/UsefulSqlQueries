-- Generate one million rows!
with e1(n) as (
	select 1
    union all
    select 1
    union all
    select 1
    union all
	select 1
    union all
    select 1
    union all
    select 1
    union all
	select 1
    union all
    select 1
    union all
    select 1
    union all
    select 1
) -- 10
,e2(n) as (
    select 1
    from e1
        cross join e1
) -- 10*10
,e3(n) as (
    select 1
    from e1
        cross join e2
) -- 10*100
,e4(n) as (
    select 1
    from e1
    cross join e3
) -- 10*1000
,e5(n) as (
    select 1
    from e1
        cross join e4
) -- 10*10000
,e6(n) as (
    select 1
    from e1
        cross join e5
) -- 10*100000
select row_number() over (order by n) as n
from e6
order by n;