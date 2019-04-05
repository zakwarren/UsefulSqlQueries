-- Create and run a dynamic SQL script


-- Declare utility variables
declare @tableName varchar(max), @dSql nvarchar(500);


-- Generate table name based on today's date
set @tableName = (select 'Example_'
						+ datename(year, getdate())
						+ datename(month, getdate())
					);


-- Check if the table exists
if exists (	select name
			from sysobjects
			where name = @tableName and xtype = 'U')


-- Generate dynamic SQL script with table variable
select @dSql = N'select * from ' +  quotename(@tableName);


-- Run dynamic SQL script
exec sp_executesql @dSql;