--SQL quine (a piece of code able to export itself)
select replace(
				replace('select replace(replace("$",char(34),char(39)),char(36),"$") as Quine;'
						,char(34)
						,char(39)
				)
		,char(36)
		,'select replace(replace("$",char(34),char(39)),char(36),"$") as Quine;') as Quine;