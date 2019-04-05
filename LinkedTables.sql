-- Querying a SQL Server linked table
select *
from [Server].[Database].[Schema].[Table];


-- Querying a non-SQL Server linked table (e.g. MySQL, Access)
select *
from openquery(LinkedDatabase, 'select * from [Linked table]');