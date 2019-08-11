-- Here we use a special form of FOR.....Loop, where iteration occurs
-- over the active set of a cursor.  The control variable is an implicit
-- RECORD variable.  The cursor itself is undeclared and anonymous.
spool cursorbb02c.dat
set echo on
set pages 100
set serveroutput on
BEGIN
  FOR emp_rec IN (SELECT ename,deptno,sal
                  FROM empbb02
                  WHERE sal > 3500) LOOP
    DBMS_OUTPUT.PUT_LINE(emp_rec.ename||' is in dept. '||
      emp_rec.deptno||' and makes '|| emp_rec.sal||' per month.');
  END LOOP;
END;
/