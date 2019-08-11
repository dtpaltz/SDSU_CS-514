-- This one doesn't work!!!!!!!!!!!!
DECLARE
  empname empbb02.ename%TYPE;
  empmgr  empbb02.boss%TYPE;
  empsal  empbb02.sal%TYPE;
BEGIN
  SELECT emp.ename,emp.boss,emp.sal
  INTO empname,empmgr,empsal
  FROM empbb02 emp
  WHERE emp.empno > 734 ;
  DBMS_OUTPUT.PUT_LINE('employee 799 is ' ||empname|| ', works for ' ||empmgr|| ' and makes ' || empsal);
END;
/