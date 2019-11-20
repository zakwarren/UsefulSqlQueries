-- Find all stored procedures in the current database
select * 
from information_schema.routines 
where ROUTINE_TYPE = 'PROCEDURE';
