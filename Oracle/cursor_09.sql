-- shows 'cursor variable', which delays binding of cursor to a SELECT, and
-- allows binding to various SELECT's;  also used in JDBC
-- exhibits the fact that %ROWCOUNT tracks number of elements processed so far
-- in the active set
-- one reason to consider ref cursor is to pass a result set object to an
-- application language, where that result set is computed more quickely
-- on the server side.  See jdbc17Ora.java
-- In this variant of cursorbb02f.sql, we can use the oracle 9i syntax
-- SYS_REFCURSOR to get a weakly typed ref cursor with less typing
-- see cursorbb02g for a strongly typed version
spool cursor1.dat
set echo on
set pages 100
set serveroutput on
DECLARE
  empnum  empbb02.empno%TYPE;
  name    empbb02.ename%TYPE;
  --TYPE cursor_var IS REF CURSOR;
  --myCursorVar cursor_var;
  mycursorVar SYS_REFCURSOR;
BEGIN
  OPEN myCursorVar FOR SELECT empno,ename FROM empbb02;
  LOOP
    FETCH myCursorVar INTO empnum,name;
    EXIT WHEN myCursorVar%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(name||'  '||empnum||' rowcount is '||
      myCursorVar%ROWCOUNT);
  END LOOP;
  CLOSE myCursorVar;
END;
/