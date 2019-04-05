-- Create a pivot table from an existing table
select *
from Example
	pivot (
        count(something) for anotherthing in ([A], [B], [C], [D], [E], [G], [L], [X], [Y])
        ) as matrix;