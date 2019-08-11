--this illustrates the use of %ROWTYPE for working with a
--single row; since INTO is required, this is a minimal way
--to achieve the goal; compare this with plsql4.sql
-- implicit record example
DECLARE
  my_emp empbb02%ROWTYPE;
BEGIN
  SELECT *
  INTO my_emp
  FROM empbb02
  WHERE empbb02.empno = '735';
  DBMS_OUTPUT.PUT_LINE('employee 735 is '||my_emp.ename||', works for '
    ||my_emp.boss||' and makes '||my_emp.sal);
END;
.
/