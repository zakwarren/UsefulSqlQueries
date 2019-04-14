--List the number of rows in each table in the current database
select  o.name
       ,ddps.row_count 
from sys.indexes i
  inner join sys.objects o                  on i.OBJECT_ID = o.OBJECT_ID
  inner join sys.dm_db_partition_stats ddps on i.OBJECT_ID = ddps.OBJECT_ID
                                            and i.index_id = ddps.index_id 
where i.index_id < 2 --as 0 = hash table, 1 = clustered index
    and o.is_ms_shipped = 0 --remove to include system objects
order by o.name;