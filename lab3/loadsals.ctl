load data
	infile 'lab3/salsbb02.csv'
	into table salsbb15
	fields terminated by ","
	(grade,role,losal,hisal)