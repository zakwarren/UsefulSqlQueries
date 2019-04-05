-- Convert separate columns to a single comma-delimited string
select distinct  bdl.Field1
				,bdl.Field2
				,bdl.Field3
				,bdl.Field4
from (
		select distinct  e2.Field1
                        ,e2.Field2
                        ,e2.Field3
                        ,(
                            select t.Box as [Text()]
                            from Example e
                            where e.Field1 = e2.Field1
                            order by Field1
                            for XML path ('')
                        ) Field4
		from Example e2
	) bdl
where bdl.Field4 is not null
order by Field1;