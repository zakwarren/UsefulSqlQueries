-- Enable the xp_cmdshell extended stored procedure
-- warning: this allows you to execute commands directly on
-- the server with all of the security implications that entails


-- allow advanced options to be changed
exec sp_configure 'show advanced options', 1
go


-- update the currently configured value for advanced options
reconfigure
go


-- enable xp_cmdshell
exec sp_configure 'xp_cmdshell', 1 -- set to 0 to disable xp_cmdshell
go


-- update the currently configured value for this feature
reconfigure
go


-- test that xp_cmdshell works
exec xp_cmdshell 'whoami';