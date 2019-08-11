-- shows 'cursor variable', which delays binding of cursor to a SELECT, and
-- allows binding to various SELECT's;  also used in JDBC
-- exhibits the fact that %ROWCOUNT tracks number of elements processed so far
-- in the active set
-- one reason to consider ref cursor is to pass a result set object to an
-- application language, where that result set is computed more quickely
-- on the server side.  See jdbc17Ora.java
-- in this version the cursor has a RETURN clause which constrains the table
-- it can deal with (sometimes called a strongly typed ref cursor)
-- We now MUST retrieve an entire row, but can use the ref cursor with
-- different where clauses to restrict the rows selected
spool cursor1.dat
set echo on
set pages 100
set serveroutput on
DECLARE
  --empnum  empbb02.empno%TYPE;
  --name    empbb02.ename%TYPE;
  TYPE cursor_var IS REF CURSOR RETURN empbb02%ROWTYPE;
  myCursorVar cursor_var;
  row empbb02%ROWTYPE;
BEGIN
  OPEN myCursorVar FOR SELECT * FROM empbb02;
  LOOP
    FETCH myCursorVar INTO row;
    EXIT WHEN myCursorVar%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(row.ename||'  '||row.empno||' rowcount is '||
      myCursorVar%ROWCOUNT);
  END LOOP;
  CLOSE myCursorVar;
END;
/