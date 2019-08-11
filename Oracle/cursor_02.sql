-- this is a no shortcut named cursor using OPEN, FETCH ... INTO, CLOSE
-- also see cursorbb02a2.sql
spool cursorbb02a.dat
set echo on
set pages 100
set serveroutput on
DECLARE
  empnum  empbb02.empno%TYPE;
  name    empbb02.ename%TYPE;
  CURSOR emp_cursor IS
    SELECT empno,ename
    FROM empbb02;
BEGIN
  OPEN emp_cursor;
  LOOP
    FETCH emp_cursor INTO empnum,name;
    EXIT WHEN emp_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(name||'   '||empnum);
  END LOOP;
  CLOSE emp_cursor;
END;
/