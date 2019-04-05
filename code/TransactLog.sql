-- Investigate the transact log
select log_reuse_wait_desc
from sys.databases;

-- also...
DBCC SQLPERF(logspace);