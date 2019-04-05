-- select the first row from every table in the database
declare @sql nvarchar(max)='';


select @sql += ' select top 1 * from ' + quotename(TABLE_SCHEMA) + '.'+ quotename(TABLE_NAME) + '; '
from information_schema.tables
where table_type = 'BASE TABLE';


exec Sp_executesql @sql;