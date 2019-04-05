-- Add a column that increments it's value when the value in another column changes
select   dense_rank() over (
                            order by something
                            ) as Increment
        ,*
from Example;