-- Find whether a particular user is logged in
select session_id
from sys.dm_exec_sessions
where login_name = 'DOMAIN\user'; -- the username in question
                                  -- (requires domain if searching for a windows authentication account)
                                  -- (doesn't if searching for a SQL login)

kill 42  --42 is the session_id that's to be stopped