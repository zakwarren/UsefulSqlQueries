REM Bat file to deploy all SQL scripts in a directory to the database
for %%G in (*.sql) do sqlcmd /S server /d database -E -i"%%G"
pause