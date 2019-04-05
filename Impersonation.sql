-- Impersonation with execute as


-- impersonate login
execute as login = 'somelogin';
revert;


-- impersonate user
execute as user = 'someuser';
revert;


-- impersonate login as part of dynamic SQL (after procedure finishes, revert is implicit)
exec('execute as login = ''someuser''; select system_user');
select system_user;


-- see what the original login is regardless of impersonation
select original_login();


-- deny a procedure running if impersonation is used
if system_user <> original_login()
begin
   raiserror('This procedure does not support impersonated users', 16, 1)
   return 1
end;