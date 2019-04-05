-- Test if a table exists and, if so, drop it
if object_id('tempdb.dbo.#Example') is not null
drop table #Example;