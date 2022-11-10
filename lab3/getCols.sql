spool lab3/columns.txt
SELECT column_name, table_name FROM all_tab_columns WHERE owner = (select user from dual) ORDER BY table_name;
spool off