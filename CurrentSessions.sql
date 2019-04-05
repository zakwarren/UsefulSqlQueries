-- Check for current logged in sessions
select	 db_name(dbid) as DbName
		,count(dbid) as NumberOfConnections
		,loginame as LoginName
from sys.sysprocesses
where dbid > 0
group by dbid
		,loginame
order by DbName;