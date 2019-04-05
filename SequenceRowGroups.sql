-- Add unique row numbers by group
-- this is often useful when de-duplicating rows that have an arbitrary difference
-- and don't naturally have a min or max value
select	 row_number() over (
                            partition by something
                            order by something
                            ) as SequenceID
		,*
from Example;