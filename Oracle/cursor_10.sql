-- THIS DOES NOT WORK.   REASON UNKNOWN
-- shows 'cursor variable', which delays binding of cursor to a SELECT, and
-- allows binding to various SELECT's;  also used in JDBC
-- exhibits the fact that %ROWCOUNT tracks number of elements processed so far
-- in the active set
set echo off
set pages 100
set serveroutput on
DECLARE
  empnum  empbb02.empno%TYPE;
  name    empbb02.ename%TYPE;
  TYPE cursor_var IS REF CURSOR;
  myCursorVar cursor_var;
BEGIN
  OPEN myCursorVar FOR SELECT empno,ename FROM empbb02;
  FOR x IN myCursorVar LOOP
    DBMS_OUTPUT.PUT_LINE(x.empno||'  '||x.ename||' rowcount is '||
      myCursorVar%ROWCOUNT);
  END LOOP;
  CLOSE myCursorVar;
END;
/