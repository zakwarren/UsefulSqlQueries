-- Converting from Unix timestamp to datetime
select dateadd(second, UnixTimeStamp, '01-Jan-1970');


-- Converting datetime to Unix timestamp
select datediff(second, '01-Jan-1970', UnixTimeStamp);