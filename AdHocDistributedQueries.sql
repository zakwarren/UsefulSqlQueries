-- Enable Ad Hoc distributed queries, such as openrowset commands
-- useful when querying linked databases such as MySQL


exec sp_configure 'show advanced options', 1;  
reconfigure;
go


exec sp_configure 'Ad Hoc Distributed Queries', 1;  
reconfigure;  
go