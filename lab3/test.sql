
set echo on
set serveroutput on

 
BEGIN
	FOR c IN (SELECT column_name FROM all_tab_columns WHERE owner = (select user from dual) AND table_name = 'empbb02') LOOP
		--dbms_output.put_line(TO_Char(DECODE(c.column_name, NULL, 'NULL', c.column_name)||','));
		dbms_output.put_line(c.column_name||',');
	END LOOP;
END;
.
/


SELECT column_name, table_name FROM all_tab_columns WHERE owner = (select user from dual) ORDER BY table_name;