-- Convert latitude and longitude to spacial data
select convert(geography, 'Point('
                + convert(varchar(20), Longitude)
                + ' '
                + convert(varchar(20), Latitude)
                + ')'
                ) as SpacialData;