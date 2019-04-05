-- Code for dealing with unusual year change over points
-- while SQL has a lot of good datetime functions, it is based on a January start to the year
-- these code snippets handle these instances
-- for example, the academic year starts in September


-- Detect the current academic year
select convert(varchar(10), 
                case	when datepart(month, getdate()) >= 9
                            then convert(varchar(10), datepart(year, getdate()))
                                + '/'
                                + right(convert(varchar(10), datepart(year, getdate()) + 1), 2)
                        when datepart(month, getdate()) < 9
                            then convert(varchar(10), datepart(year, getdate()) - 1)
                                + '/'
                                + right(convert(varchar(10), datepart(year, getdate())), 2)
                        end) as AcademicYear;


-- Calculate beginning and end of the academic year
select  convert(date, '01-Sep-' + convert(varchar(255),
                        case	when datepart(month, getdate()) < 9
                                    then datepart(year, getdate()) - 1
                                when datepart(month, getdate()) >= 9
                                    then datepart(year, getdate())
                                end
                )) as AcademicBegin
		,convert(date, '01-Sep-' + convert(varchar(255),
                        case	when datepart(month, getdate()) < 9
                                    then datepart(year, getdate())
                                when datepart(month, getdate()) >= 9
                                    then datepart(year, getdate()) + 1
                                end
                )) as AcademicEnd;