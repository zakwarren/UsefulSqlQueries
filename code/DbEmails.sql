-- Send database emails
exec msdb.dbo.sp_send_dbmail
	@profile_name = 'EmailProfile',
	@recipients = 'example@example.com',  
	@subject = 'Test email',  
	@body = 'Hello!',  
	@body_format = 'HTML';


-- Create html table retaining special characters (such as angle brackets)
select stuff(	( 
					select distinct	 td = '<tr><td>' + Column1 + '</td>'
									,''
									,td = '<td>'+ Column2 + '</td>'
									,''
									,td = '<td><a href="http://www.example.co.uk/id_redir.php?id=' + Id + '">Example dynamic link</a></td>'
									,''
									,td = '<td><img src="http://example.image/' + Id + '.jpg" width="120" height="90"></td></tr>'
					from #exampleTable
					for xml path(''), root('MyString'), type
				 ).value('/MyString[1]','varchar(max)')
			, 1, 0, '') as emailTable;