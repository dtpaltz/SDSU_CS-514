-- This spools the contents (only) of the course tables into respective CSV files
set echo off
set heading off
set termout off
set feedback off
set pagesize 0
set trimspool on

spool lab3/deptbb02.csv

SELECT
DECODE(deptno, NULL, 'NULL', deptno)||','||
DECODE(dname, NULL, 'NULL', dname)||','||
DECODE(restaurant, NULL, 'NULL', restaurant)||','||
DECODE(location, NULL, 'NULL', location)||','||
DECODE(motto, NULL, 'NULL', motto)
FROM deptbb02;

spool off

--------------------------------------------------------------

spool lab3/empbb02.csv

SELECT
DECODE(empno, NULL, 'NULL', empno)||','||
DECODE(ename, NULL, 'NULL', ename)||','||
DECODE(pos, NULL, 'NULL', pos)||','||
DECODE(boss, NULL, 'NULL', boss)||','||
DECODE(hiredate, NULL, 'NULL', hiredate)||','||
DECODE(sal, NULL, 'NULL', sal)||','||
DECODE(deptno, NULL, 'NULL', deptno)||','||
DECODE(incentives, NULL, 'NULL', incentives)
FROM empbb02;

spool off

--------------------------------------------------------------

spool lab3/infobb02.csv

SELECT
DECODE(empno, NULL, 'NULL', empno)||','||
DECODE(fname, NULL, 'NULL', fname)||','||
DECODE(nick, NULL, 'NULL', nick)||','||
DECODE(uni, NULL, 'NULL', uni)||','||
DECODE(average, NULL, 'NULL', average)||','||
DECODE(era, NULL, 'NULL', era)
FROM infobb02;

spool off

--------------------------------------------------------------

spool lab3/salsbb02.csv

SELECT
DECODE(grade, NULL, 'NULL', grade)||','||
DECODE(role, NULL, 'NULL', role)||','||
DECODE(losal, NULL, 'NULL', losal)||','||
DECODE(hisal, NULL, 'NULL', hisal)
FROM salsbb02;

spool off

set heading on
set termout on
set feedback on
